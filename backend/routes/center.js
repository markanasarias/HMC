const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('centerlayout', { title: 'Express' });
});

module.exports = router;

router.get("/load", (req, res) => {
  try {
    let sql = `SELECT * FROM master_branches`;
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

router.post("/getcenter", (req, res) => {
  try {
    let {branch_id} =  req.body;
    let sql = `SELECT * FROM master_branches WHERE branch_id = '${branch_id}'`;

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
    let branch_name = req.body.branch_name;
    let address = req.body.address;
    let latitude = req.body.latitude;
    let longitude = req.body.longitude;
    let createby = req.body.createby; 
    let status = 'Active';
    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    let sql = `SELECT * FROM master_branches WHERE branch_name = '${branch_name}'`;
    mysql.SelectResult(sql, (err, result) => {
      if (err) {
        console.error('Error: ', err);
        return res.json({ msg: 'error' });
      }

      if (result.length !== 0) {
        return res.json({ msg: 'Branch already exists' });
      }

      let data = [];
      data.push([
        branch_name, address, latitude, longitude, createddate, createby, status,
      ]);

      mysql.InsertTable("master_branches", data, (err, result) => {
        if (err) {
          console.error('Error: ', err);
          return res.json({ msg: 'error' });
        }

        console.log(result);
        res.json({
          msg: 'success'
        });
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
    let branch_id = req.body.branch_id;
    let branch_name = req.body.branch_name;
    let address = req.body.address;
    let latitude = req.body.latitude;
    let longitude = req.body.longitude;
    let status = req.body.status;
    let sqlupdate = `UPDATE master_branches SET  branch_name = '${branch_name}', address ='${address}', latitude ='${latitude}', longitude ='${longitude}', status ='${status}' WHERE branch_id ='${branch_id}'`
    
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