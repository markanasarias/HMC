const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loglayout', { title: 'Express' });
});

module.exports = router;

router.post("/loadstaff", (req, res) => {
    try {
        let {branch_id} = req.body;
        let sql = `
           SELECT 
    mri.request_id, 
    mi.item_id, 
    mi.item_name,
    mri.requested_quantity,  -- Showing requested quantity
    mri.request_date AS first_request_date,  -- Showing the request date
    mri.status,  -- Showing the status
    mri.requested_by,  -- Showing the requested_by
    mri.branch_id,  -- Showing the branch_id
    mb.branch_name  -- Showing the branch_name
FROM 
    master_requested_inventory mri
JOIN 
    master_items mi ON mri.item_id = mi.item_id
JOIN 
    master_branches mb ON mri.branch_id = mb.branch_id
WHERE  
    mri.branch_id = '${branch_id}' AND mri.status = 'Pending'
ORDER BY 
    mi.item_id, mri.request_date -- Sorting by item_id and request_date
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

router.get("/loadadmin", (req, res) => {
    try {
        let sql = `
            SELECT 
                mri.request_id,
                mri.item_id,
                mi.item_name,
                mri.requested_quantity,
                mri.request_date,
                mri.status,
                mri.requested_by,
                mri.branch_id,
                mb.branch_name
            FROM 
                master_requested_inventory mri
            JOIN 
                master_items mi ON mri.item_id = mi.item_id
            JOIN 
                master_branches mb ON mri.branch_id = mb.branch_id
        `;

        mysql.SelectResult(sql, (err, result) => {
            if (err) {
                return res.json({
                    msg: err,
                });
            }
            let groupedResult = result.reduce((acc, row) => {
                if (!acc[row.branch_name]) {
                    acc[row.branch_name] = {
                        branch_name: row.branch_name,
                        status: row.status,
                        request_date: row.request_date,
                        requests: []
                    };
                }
                acc[row.branch_name].requests.push({
                    request_id: row.request_id,
                    item_id: row.item_id,
                    item_name: row.item_name,
                    requested_quantity: row.requested_quantity,
                    requested_by: row.requested_by,
                    branch_id: row.branch_id
                });
                return acc;
            }, {});

            res.json({
                msg: "success",
                data: groupedResult
            });
        });
    } catch (error) {
        res.json({
            msg: error,
        });
    }
});

router.get("/loadbranch", (req, res) => {
    try {
        let sql = `
           SELECT 
    bi.branch_id,
    br.branch_name,
    COUNT(bi.request_id) AS total_requests,
    SUM(bi.requested_quantity) AS total_requested_quantity,
    MIN(bi.request_date) AS first_request_date,
    MAX(bi.request_date) AS last_request_date,
    MAX(bi.status) AS latest_status,
    MAX(bi.requested_by) AS last_requested_by
FROM 
    master_requested_inventory bi
INNER JOIN 
    master_branches br ON bi.branch_id = br.branch_id
WHERE 
    bi.status = 'Pending'
GROUP BY 
    bi.branch_id, br.branch_name

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

router.post("/loadrequestbranch", (req, res) => {
    try {
        let {branch_id} = req.body;
        let sql = `
           SELECT 
    mri.request_id, 
    mi.item_id, 
    mi.item_name,
    mri.requested_quantity,  -- Showing requested quantity
    mri.request_date AS first_request_date,  -- Showing the request date
    mri.status,  -- Showing the status
    mri.requested_by,  -- Showing the requested_by
    mri.branch_id,  -- Showing the branch_id
    mb.branch_name  -- Showing the branch_name
FROM 
    master_requested_inventory mri
JOIN 
    master_items mi ON mri.item_id = mi.item_id
JOIN 
    master_branches mb ON mri.branch_id = mb.branch_id
WHERE  
    mri.branch_id = '${branch_id}' AND mri.status = 'Pending'
ORDER BY 
    mi.item_id, mri.request_date -- Sorting by item_id and request_date
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


router.post('/updatedataold', (req, res) => {
    try {
        let items = req.body.items;  

        if (!Array.isArray(items) || items.length === 0) {
            return res.json({ msg: 'error', error: 'No items provided' });
        }

        items.forEach(item => {
            let sql = `
                UPDATE master_requested_inventory
                SET requested_quantity = ?, status = 'Approved'
                WHERE request_id = ?
            `;
            let data = [item.requested_quantity, item.request_id];

            mysql.UpdateMultiple(sql, data, (err, result) => {
                if (err) {
                    console.error('Error updating record: ', err);
                    return res.json({ msg: 'error', error: 'Failed to update requested quantity' });
                }

                console.log(result);
            });
        });
        res.json({ msg: 'success' });

    } catch (error) {
        console.error('Caught Error: ', error);
        res.json({ msg: 'error', error: 'Unexpected error' });
    }
});


router.post('/updatedata', async (req, res) => {
    try {
        let items = req.body.items;  

        if (!Array.isArray(items) || items.length === 0) {
            return res.json({ msg: 'error', error: 'No items provided' });
        }

        let updatePromises = items.map(async (item) => {
            try {
                let updateSql = `
                    UPDATE master_requested_inventory
                    SET requested_quantity = ?, status = 'Approved'
                    WHERE request_id = ?
                `;
                let updateData = [item.requested_quantity, item.request_id];

                await new Promise((resolve, reject) => {
                    mysql.UpdateMultiple(updateSql, updateData, (updateErr, updateResult) => {
                        if (updateErr) {
                            return reject('Failed to update requested quantity');
                        }
                        console.log('Update result:', updateResult);
                        resolve();
                    });
                });

                let sql = `SELECT * FROM master_inventory 
                    WHERE item_id = '${item.item_id}' AND branch_id = '${item.branch_id}'`;

                let inventoryResult = await new Promise((resolve, reject) => {
                    mysql.SelectResult(sql, (err, result) => {
                        if (err) {
                            return reject('Failed to fetch master inventory');
                        }
                        resolve(result);
                    });
                });

                if (inventoryResult.length > 0) {
                    console.log(`Item with item_id: ${item.item_id} and branch_id: ${item.branch_id} exists in master_inventory.`);
                } else {
                    console.log(`Item with item_id: ${item.item_id} and branch_id: ${item.branch_id} does not exist in master_inventory.`);
                }

                return inventoryResult;
            } catch (error) {
                console.error('Error processing item:', error);
                throw error;
            }
        });

        let results = await Promise.all(updatePromises);

        res.json({
            msg: "success",
            data: results, 
        });

    } catch (error) {
        console.error('Caught Error: ', error);
        res.json({ msg: 'error', error: 'Unexpected error' });
    }
});




router.post('/reject', (req, res) => {
    try {
        let items = req.body.items;  

        if (!Array.isArray(items) || items.length === 0) {
            return res.json({ msg: 'error', error: 'No items provided' });
        }

        items.forEach(item => {
            let sql = `
                UPDATE master_requested_inventory
                SET requested_quantity = ?, status = 'Rejected'
                WHERE request_id = ?
            `;
            let data = [item.requested_quantity, item.request_id];

            mysql.UpdateMultiple(sql, data, (err, result) => {
                if (err) {
                    console.error('Error updating record: ', err);
                    return res.json({ msg: 'error', error: 'Failed to update requested quantity' });
                }

                console.log(result);
            });
        });
        res.json({ msg: 'success' });

    } catch (error) {
        console.error('Caught Error: ', error);
        res.json({ msg: 'error', error: 'Unexpected error' });
    }
});

router.post('/checking', (req, res) => {
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






  






