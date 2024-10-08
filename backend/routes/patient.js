const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('patientlayout', { title: 'Express' });
});

module.exports = router;

router.get('/load', (req, res) => {
  try {
    let sql =  'SELECT * FROM master_patient';

    mysql.Select(sql, 'MasterPatient', (err, result) => {
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

router.post('/save', (req, res) => {
  try {
    let {
      first_name, last_name, middle_name, age, date_of_birth,
      birth_place, gender, civil_status, nationality, religion,
      occupation, phone_number, email, address, emergency_contact_name,
      emergency_contact_phone, blood_type, philhealth_number, allergies,
      status, createby
    } = req.body;

    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    // SQL query to check if the patient already exists
    let sql = `SELECT * FROM master_patient WHERE first_name = '${first_name}' AND last_name = '${last_name}' AND middle_name = '${middle_name}' AND date_of_birth = '${date_of_birth}'`;
    mysql.SelectResult(sql, (err, result) => {
      if (err) {
        console.error('Error: ', err);
        return res.json({ msg: 'error' });
      }

      if (result.length !== 0) {
        // Patient already exists
        return res.json({ msg: 'Patient already exists' });
      }

      // Data for inserting a new patient
      let data = [[
        first_name, last_name, middle_name, age, date_of_birth,
        birth_place, gender, civil_status, nationality, religion,
        occupation, phone_number, email, address, emergency_contact_name,
        emergency_contact_phone, blood_type, philhealth_number, allergies,
        status, createby, createddate
      ]];
      mysql.InsertTable("master_patient", data, (err, result) => {
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








