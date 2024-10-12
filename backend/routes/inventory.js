const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loglayout', { title: 'Express' });
});

module.exports = router;

router.post("/load", (req, res) => {
    try {
      let {branch_id} =  req.body;
      let sql = `SELECT * FROM master_inventory WHERE branch_id = '${branch_id}'`;

      mysql.SelectResult(sql, (err, result) => {
        if (err) {
          return res.json({
            msg: err,
          });
        }
        res.json({
          msg: "success",
          data: result,
        });
      });
    } catch (error) {
      res.json({
        msg: error,
      });
    }
  });

  router.post("/loadwithout", (req, res) => {
    try {
      let { branch_id } = req.body;
      let sql = `SELECT * FROM master_inventory`;
      if (branch_id) {
        sql += ` WHERE branch_id = '${branch_id}'`;
      }
      mysql.SelectResult(sql, (err, result) => {
        if (err) {
          return res.json({
            msg: err,
          });
        }
        res.json({
          msg: "success",
          data: result,
        });
      });
    } catch (error) {
      res.json({
        msg: error,
      });
    }
  });

  router.post('/save', (req, res) => {
    try {
      let item_name = req.body.item_name;
      let item_type = req.body.item_type;
      let created_by = req.body.created_by;
      let status = 'Active';
      let today = new Date();
      let createddate = today.toISOString().split('T')[0];
  
      let sql = `SELECT * FROM master_items WHERE item_name = '${item_name}'`;
      mysql.SelectResult(sql, (err, result) => {
        if (err) {
          console.error('Error: ', err);
          return res.json({ msg: 'error' });
        }
  
        if (result.length !== 0) {
          return res.json({ msg: 'Item already exists' });
        }
  
        let data = [[
          item_name, item_type, created_by, createddate, status
        ]];
        mysql.InsertTable("master_items", data, (err, result) => {
          if (err) {
            console.error('Error: ', err);
            return res.json({ msg: 'error' });
          }
  
          console.log(result);
          res.json({ msg: 'success' });
        });
      });
    } catch (error) {
      res.json({ msg: 'error' });
    }
  });


  router.post('/savedata', (req, res) => {
    try {
        let items = req.body.items;  

        if (!Array.isArray(items) || items.length === 0) {
            return res.json({ msg: 'error', error: 'No items provided' });
        }

        let data = [];
        let today = new Date();
        let request_date = today.toISOString().split('T')[0];
        let status = 'Pending';

        items.forEach(item => {
            data.push([
                item.item_id,
                item.requested_quantity,
                request_date, 
                status,
                item.requested_by,
                item.branch_id
            ]);
        });

        mysql.InsertTable("master_requested_inventory", data, (err, result) => {
            if (err) {
                console.error('Error: ', err);
                return res.json({ msg: 'error' });
            }

            console.log(result);
            res.json({ msg: 'success' });
        });
    } catch (error) {
        console.error('Caught Error: ', error);
        res.json({ msg: 'error' });
    }
});


router.post('/check', (req, res) => {
  try {
      let items = req.body.items;  

      if (!Array.isArray(items) || items.length === 0) {
          return res.json({ msg: 'error', error: 'No items provided' });
      }
      items.forEach(item => {
          let checkQuery = `SELECT * FROM master_requested_inventory WHERE item_id = '${item.item_id}' AND branch_id = '${item.branch_id}'`;
          mysql.SelectResult(checkQuery, (err, results) => {
              if (err) {
                  console.error('Error checking item existence: ', err);
                  return res.json({ msg: 'error', error: 'Database check failed' });
              }

              if (results.length > 0) {
                  console.log(`Item with ID ${item.item_id} and Branch ID ${item.branch_id} already exists.`);
              } else {
                  console.log(`Item with ID ${item.item_id} and Branch ID ${item.branch_id} does not exist.`);
              }
          });
      });

      res.json({ msg: 'success' });
  } catch (error) {
      console.error('Caught Error: ', error);
      res.json({ msg: 'error' });
  }
});


// Check if the item exists, and then either update or save based on the result
router.post('/check1', (req, res) => {
  try {
      let items = req.body.items;

      if (!Array.isArray(items) || items.length === 0) {
          return res.json({ msg: 'error', error: 'No items provided' });
      }

      let updates = [];  // Store items for updating
      let inserts = [];  // Store items for inserting
      let completed = 0; // To track the async operations
      let responseSent = false; // To prevent sending multiple responses

      items.forEach(item => {
          let checkQuery = `SELECT * FROM master_requested_inventory WHERE item_id = '${item.item_id}' AND branch_id = '${item.branch_id}'`;

          // Use SelectResult to check if the item exists
          mysql.SelectResult(checkQuery, (err, results) => {
              if (err) {
                  console.error('Error checking item existence: ', err);
                  if (!responseSent) {
                      responseSent = true;
                      return res.json({ msg: 'error', error: 'Database check failed' });
                  }
              }

              if (results.length > 0) {
                  // Item exists, add it to the updates array
                  updates.push(item);
              } else {
                  // Item does not exist, add it to the inserts array
                  inserts.push(item);
              }

              completed++;

              // After processing all items, decide to update or insert based on the arrays
              if (completed === items.length) {
                  // Ensure the response is not sent more than once
                  if (!responseSent) {
                      if (updates.length > 0) {
                          updateItems(updates, res, () => {
                              if (inserts.length > 0) {
                                  insertItems(inserts, res);
                              } else if (!responseSent) {
                                  responseSent = true;
                                  res.json({ msg: 'success' });
                              }
                          });
                      } else if (inserts.length > 0) {
                          insertItems(inserts, res);
                      } else if (!responseSent) {
                          responseSent = true;
                          res.json({ msg: 'success' });
                      }
                  }
              }
          });
      });

  } catch (error) {
      console.error('Caught Error: ', error);
      if (!responseSent) {
          responseSent = true;
          res.json({ msg: 'error', error: 'Unexpected error' });
      }
  }
});

// Function to update existing items
function updateItems(items, res, callback) {
  let today = new Date();
  let request_date = today.toISOString().split('T')[0];
  let status = 'Pending';

  items.forEach(item => {
      let sql = `
          UPDATE master_requested_inventory
          SET requested_quantity = requested_quantity + ?
          WHERE item_id = ? AND branch_id = ?
      `;
      let data = [item.requested_quantity, item.item_id, item.branch_id];

      // Call the UpdateMultiple function
      mysql.UpdateMultiple(sql, data, (err, result) => {
          if (err) {
              console.error('Error updating record: ', err);
              if (!responseSent) {
                  responseSent = true;
                  return res.json({ msg: 'error', error: 'Failed to update requested quantity' });
              }
          }
      });
  });

  // Call the callback once all updates are done
  callback();
}

// Function to insert new items
function insertItems(items, res) {
  let data = [];
  let today = new Date();
  let request_date = today.toISOString().split('T')[0];
  let status = 'Pending';

  items.forEach(item => {
      data.push([
          item.item_id,
          item.requested_quantity,
          request_date,
          status,
          item.requested_by,
          item.branch_id
      ]);
  });

  mysql.InsertTable("master_requested_inventory", data, (err, result) => {
      if (err) {
          console.error('Error: ', err);
          if (!responseSent) {
              responseSent = true;
              return res.json({ msg: 'error' });
          }
      }

      console.log(result);
      if (!responseSent) {
          responseSent = true;
          res.json({ msg: 'success' });
      }
  });
}













