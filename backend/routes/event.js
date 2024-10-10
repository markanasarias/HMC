const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('eventlayout', { title: 'Express' });
});

module.exports = router;

router.get('/load', (req, res) => {
  try {
    let sql =  'SELECT * FROM master_event';

    mysql.Select(sql, 'MasterEvent', (err, result) => {
      if (err) console.error('Error: ', err);

      res.json({
        msg: 'success', data: result
      });
    });
  } catch (error) {
    res.json({
      msg: error
    })
  }
});

router.post("/getcalendar", (req, res) => {
  try {
    let {id} =  req.body;
    let sql = `SELECT * FROM master_event WHERE id = '${id}'`;

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
    let name = req.body.name;
    let description = req.body.description;
    let start_time = req.body.start_time;
    let end_time = req.body.end_time;
    let createby = req.body.createby; 
    let status = 'Active';
    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    let data = [];
    data.push([
      name, description,  start_time, end_time, createddate, createby, status,
    ]);

    mysql.InsertTable("master_event", data, (err, result) => {
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






