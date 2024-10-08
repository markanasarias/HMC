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
                mri.item_id,
                mi.item_name,
                mri.requested_quantity,
                mri.request_date,
                mri.status,
                mri.requested_by,
                mri.branch_id,
                mb.branch_name  -- Include branch_name from master_branches
            FROM 
                master_requested_inventory mri
            JOIN 
                master_items mi ON mri.item_id = mi.item_id
            JOIN 
                master_branches mb ON mri.branch_id = mb.branch_id  -- Join with master_branches 
                WHERE  mri.branch_id = '${branch_id}'
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
GROUP BY 
    bi.branch_id, br.branch_name;
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
    mri.item_id,
    mi.item_name,
    mri.requested_quantity,
    mri.request_date,
    mri.status,
    mri.requested_by,
    mri.branch_id
FROM 
    master_requested_inventory mri
JOIN 
    master_items mi ON mri.item_id = mi.item_id
WHERE 
    mri.branch_id = '${branch_id}';
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




  






