const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('stafflayout', { title: 'Express' });
});

module.exports = router;

router.get('/load', (req, res) => {
  try {
    let sql =  'SELECT * FROM master_staff';

    mysql.Select(sql, 'MasterStaff', (err, result) => {
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

router.post("/getstaff", (req, res) => {
  try {
    let {staffid} =  req.body;
    let sql = `SELECT * FROM master_staff WHERE id = '${staffid}'`;

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
      type, fullname,
      position, specialization, phone_number, email, address,
      hire_date, years_of_experience, medical_license_number, image,
      createby, status, center
    } = req.body;

    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    let sql = `SELECT * FROM master_staff WHERE fullname = '${fullname}' AND phone_number = '${phone_number}'`;
    mysql.SelectResult(sql, (err, result) => {
      if (err) {
        console.error('Error: ', err);
        return res.json({ msg: 'error' });
      }

      if (result.length !== 0) {
        return res.json({ msg: 'Staff already exists' });
      }
      let data = [[
        type, fullname,
        position, specialization, phone_number, email, address,
        hire_date, years_of_experience, medical_license_number, image, createby,
        status, createddate, center 
      ]];
      mysql.InsertTable("master_staff", data, (err, result) => {
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

router.post('/saveuser', (req, res) => {
  try {
    let user_id = req.body.user_id;
    let username = req.body.username;
    let password = req.body.password;
    let usertype = req.body.usertype;
    let status = 'Active';
    let createby = req.body.createby;
    let today = new Date();
    let created_at = today.toISOString().split('T')[0];

    let data = [];
    data.push([
      user_id, username, password, usertype, status, createby, created_at,
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








