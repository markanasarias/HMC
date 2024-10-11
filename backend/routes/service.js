const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loglayout', { title: 'Express' });
});

module.exports = router;

router.get("/load", (req, res) => {
    try {
      let sql = `SELECT * FROM master_service`;
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

  router.post("/getservice", (req, res) => {
    try {
      let {id} =  req.body;
      let sql = `SELECT * FROM master_service WHERE id = '${id}'`;
  
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
      let {
        service_name, schedule_days, schedule_time, created_by
      } = req.body;
      let status = 'Active';
      let today = new Date();
      let created_date = today.toISOString().split('T')[0];
  
      let sql = `SELECT * FROM master_service WHERE service_name = '${service_name}'`;
      mysql.SelectResult(sql, (err, result) => {
        if (err) {
          console.error('Error: ', err);
          return res.json({ msg: 'error' });
        }
  
        if (result.length !== 0) {
          return res.json({ msg: 'Service already exists' });
        }
  
        let data = [[
          service_name, schedule_days, schedule_time, status, created_by, created_date
        ]];
        mysql.InsertTable("master_service", data, (err, result) => {
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

  router.post('/update', (req, res) => {
    try {
      let id = req.body.id;
      let service_name = req.body.service_name;
      let schedule_days = req.body.schedule_days;
      let schedule_time = req.body.schedule_time;
      let status = req.body.status;
      let sqlupdate = `UPDATE master_service SET  
      service_name = '${service_name}', 
      schedule_days ='${schedule_days}',
      schedule_time ='${schedule_time}',
      status ='${status}'
      WHERE id ='${id}'`
      
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






