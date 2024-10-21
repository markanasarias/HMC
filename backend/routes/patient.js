const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();
const path = require('path');

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('patientlayout', { title: 'Express' });
});

module.exports = router;

router.get('/getfile', (req, res) => {
  try {
    const filename = req.query.filename; 

    if (!filename) {
      return res.status(400).json({
        msg: 'Filename is required',
      });
    }

    // Manually set the path to the correct assets folder
    const filePath = path.join('C:/HMC/HMC/health_system/assets', filename);

    // Print the file path to the console for verification
    console.log('File path:', filePath);

    // Check if the file exists and send it
    res.sendFile(filePath, (err) => {
      if (err) {
        console.error('File not found:', err);
        return res.status(404).json({
          msg: 'File not found',
        });
      }
    });
  } catch (error) {
    res.status(500).json({
      msg: error.message,
    });
  }
});

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

router.post('/getpatient', (req, res) => {
  try {
    let {patientid} =  req.body;
    let sql =  `SELECT * FROM master_patient WHERE patient_id = '${patientid}'`;

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

router.post("/loadmedicalrecord", (req, res) => {
  try {
    let patient_id = req.body.patient_id;
      let sql = `
         SELECT 
    mmr.id, 
    mmr.patient_id, 
    mmr.medical_record, 
    mmr.file, 
    mmr.status, 
    mmr.created_by, 
    mmr.created_date, 
    mmr.file_name, 
    CONCAT(mp.first_name, ' ', mp.middle_name, ' ', mp.last_name) AS full_name
FROM 
    master_medical_record mmr
JOIN 
    master_patient mp 
ON 
    mmr.patient_id = mp.patient_id 
WHERE 
    mmr.patient_id = '${patient_id}';

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

router.post('/update', (req, res) => {
  try {
    let {
      patient_id, first_name, last_name, middle_name, age, date_of_birth,
      birth_place, gender, civil_status, nationality, religion,
      occupation, phone_number, email, address, emergency_contact_name,
      emergency_contact_phone, blood_type, philhealth_number, allergies,
      status
    } = req.body;
    let sqlupdate = `UPDATE master_patient SET  
    first_name ='${first_name}',
    last_name ='${last_name}',
    middle_name = '${middle_name}', 
    date_of_birth ='${date_of_birth}',
    birth_place = '${birth_place}', 
    gender ='${gender}',
    civil_status ='${civil_status}',
    nationality = '${nationality}', 
    religion ='${religion}',
    occupation ='${occupation}',
    phone_number = '${phone_number}', 
    email ='${email}',
    address ='${address}',
    emergency_contact_name = '${emergency_contact_name}', 
    emergency_contact_phone ='${emergency_contact_phone}',
    blood_type ='${blood_type}',
    philhealth_number ='${philhealth_number}',
    allergies ='${allergies}',
    status ='${status}'
    WHERE patient_id ='${patient_id}'`
    
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

router.post('/savemedicalrecord', (req, res) => {
  try {
    let patient_id = req.body.patient_id;
    let medical_record = req.body.medical_record;
    let file = req.body.file;
    let file_name = req.body.file_name;
    let createby = req.body.createby; 
    let status = 'Active';
    let today = new Date();
    let createddate = today.toISOString().split('T')[0];

    let data = [];
    data.push([
      patient_id, medical_record, file, status, createby, createddate, file_name,
    ]);

    mysql.InsertTable("master_medical_record", data, (err, result) => {
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

        let patient_id = result.insertId; 

        let username = `${first_name.charAt(0)}${last_name}`.replace(/\s+/g, '').toLowerCase();
        let password = `${first_name}${date_of_birth.replace(/-/g, '')}`.replace(/\s+/g, '').toLowerCase();
        
        let userData = [[
          patient_id, username, password, 'user', 'active', createby, createddate
        ]];

        mysql.InsertTable("master_patient_users", userData, (err, userResult) => {
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









