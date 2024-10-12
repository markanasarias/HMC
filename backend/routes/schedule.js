const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('schedulelayout', { title: 'Express' });
});

module.exports = router;

router.post("/load", (req, res) => {
  try {
    let {staff_id} =  req.body;
    let sql = `SELECT master_schedule.*, master_staff.fullname
FROM master_schedule
JOIN master_staff ON master_schedule.staff_id = master_staff.id WHERE master_schedule.staff_id = '${staff_id}';`;
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

router.post("/getsched", (req, res) => {
  try {
    let {schedule_id} =  req.body;
    let sql = `SELECT master_schedule.*, master_staff.fullname
FROM master_schedule
JOIN master_staff ON master_schedule.staff_id = master_staff.id where schedule_id = '${schedule_id}'`;
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
    let work_date = req.body.work_date;
    let shift_time = req.body.shift_time;
    let createby = req.body.createby; 
    let status = 'Active';
    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    let data = [];
      data.push([
        staff_id, work_date, shift_time, status,  createby, createddate,
      ]);

      mysql.InsertTable("master_schedule", data, (err, result) => {
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
    let schedule_id = req.body.schedule_id;
    let work_date = req.body.work_date;
    let shift_time = req.body.shift_time;
    let status = req.body.status;
    let sqlupdate = `UPDATE master_schedule SET 
     work_date = '${work_date}', 
     shift_time ='${shift_time}', 
     status ='${status}' 
     WHERE schedule_id ='${schedule_id}'`
    
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