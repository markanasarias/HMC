const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loglayout', { title: 'Express' });
});

module.exports = router;

router.post("/load", (req, res) => {
console.log('ito yun');
  try {
      let { branch_id } = req.body;
      let sql = `
      SELECT 
          mi.*,
          mi2.item_name,
          mi2.item_limit
      FROM 
          master_inventory mi
      JOIN 
          master_items mi2
      ON 
          mi.item_id = mi2.item_id
      WHERE 
          mi.branch_id = '${branch_id}';
      `;

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
                console.error('Errorssssss: ', err);
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


router.post('/check1', (req, res) => {
  try {
      let items = req.body.items;

      if (!Array.isArray(items) || items.length === 0) {
          return res.json({ msg: 'error', error: 'No items provided' });
      }

      let updates = [];
      let inserts = []; 
      let completed = 0; 
      let responseSent = false; 

      items.forEach(item => {
          let checkQuery = `SELECT * FROM master_requested_inventory WHERE item_id = '${item.item_id}' AND branch_id = '${item.branch_id}'`;

          mysql.SelectResult(checkQuery, (err, results) => {
              if (err) {
                  console.error('Error checking item existence: ', err);
                  if (!responseSent) {
                      responseSent = true;
                      return res.json({ msg: 'error', error: 'Database check failed' });
                  }
              }

              if (results.length > 0) {
                  updates.push(item);
              } else {
                  inserts.push(item);
              }

              completed++;

              if (completed === items.length) {
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

  callback();
}

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













