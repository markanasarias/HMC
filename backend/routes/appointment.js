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
        let { staff_id, requestedby } = req.body;
        
        let sql = `
            SELECT 
                a.appointment_id, 
                a.staff_id, 
                staff.fullname AS staff_fullname,
                a.requestedby,
                requestor.fullname AS requestedby_fullname,
                a.purpose, 
                a.startdate, 
                a.enddate, 
                a.status, 
                a.created_by, 
                a.created_date
            FROM master_appointment AS a
            LEFT JOIN master_staff AS staff ON a.staff_id = staff.id
            LEFT JOIN master_staff AS requestor ON a.requestedby = requestor.id
            WHERE a.staff_id = '${staff_id}' OR a.requestedby = '${requestedby}'
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








