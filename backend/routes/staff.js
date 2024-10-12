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

router.get("/getdoctor", (req, res) => {
  try {
    let sql = `SELECT * FROM master_staff WHERE type IN ('Doctor', 'Admin')`;

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

        let user_id = result.insertId; 
        let username = fullname;
        
        let password = fullname + hire_date.replace(/-/g, '');
        
        let usertype = type;
        let user_status = 'Active';
        let created_at = createddate;

        let userData = [[
          user_id, username, password, usertype, user_status, createby, created_at,
        ]];

        // Insert into master_event
        mysql.InsertTable("master_users", userData, (err, userResult) => {
          if (err) {
            console.error('Error: ', err);
            return res.json({ msg: 'error' });
          }

          console.log(userResult);
          return res.json({ msg: 'success' });
        });
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


router.post('/update', (req, res) => {
  try {
    let id = req.body.id;
    let type = req.body.type;
    let fullname = req.body.fullname;
    let position = req.body.position;
    let specialization = req.body.specialization;
    let phone_number = req.body.phone_number;
    let email = req.body.email;
    let address = req.body.address;
    let hire_date = req.body.hire_date;
    let years_of_experience = req.body.years_of_experience;
    let medical_license_number = req.body.medical_license_number;
    let image = req.body.image;
    let status = req.body.status;
    let center = req.body.center;
    let sqlupdate = `UPDATE master_staff SET  
    type = '${type}', 
    fullname ='${fullname}',
    position = '${position}', 
    specialization ='${specialization}',
    phone_number = '${phone_number}', 
    email ='${email}',
    address = '${address}', 
    hire_date ='${hire_date}',
    years_of_experience = '${years_of_experience}', 
    medical_license_number ='${medical_license_number}',
    image = '${image}', 
    status ='${status}',
    center = '${center}'
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








