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

router.post("/getappointment", (req, res) => {
    try {
        let { appointment_id } = req.body;
        
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
            WHERE a.appointment_id = '${appointment_id}'
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

router.post('/save', (req, res) => {
    try {
      let staff_id = req.body.staff_id;
      let requestedby = req.body.requestedby;
      let purpose = req.body.purpose;
      let startdate = req.body.startdate;
      let enddate = req.body.enddate; 
      let status = 'Active';
      let created_by = req.body.created_by;
      let today = new Date();
      let created_date = today.toISOString().split('T')[0];
  
      let data = [];
      data.push([
        staff_id, requestedby,  purpose, startdate, enddate, status, created_by, created_date,  
      ]);
  
      mysql.InsertTable("master_appointment", data, (err, result) => {
        if (err) {
          console.error('Error: ', err);
          return res.json({ msg: 'error' });
        }
  
        console.log(result);
        res.json({
          msg: 'success'
        });
      });
    } catch (error) {
      res.json({
        msg: 'error'
      });
    }
  });


  router.post('/update', (req, res) => {
    try {
      let appointment_id = req.body.appointment_id;
      let staff_id = req.body.staff_id;
      let purpose = req.body.purpose;
      let startdate = req.body.startdate;
      let enddate = req.body.enddate;
      let status = req.body.status;
      let sqlupdate = `UPDATE master_appointment SET  
      staff_id = '${staff_id}', 
      purpose ='${purpose}',
      startdate = '${startdate}', 
      enddate ='${enddate}',
      status ='${status}'
      WHERE appointment_id ='${appointment_id}'`
      
      mysql.Update(sqlupdate, (err,result) =>{
        if(err) console.error('Error: ', err);
    
        console.log(result);
    
        res.json({
          msg: 'success'
        })
      })
    
    } catch (error) {
      res.json({
        msg: 'error'
      })
    }
    });










