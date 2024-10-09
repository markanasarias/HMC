const model = require('../model/healthcare');
const mysql = require("mysql");
const crypto = require('crypto');
require("dotenv").config();


const connection = mysql.createConnection({
  host: process.env._HOST_ADMIN,
  user: process.env._USER_ADMIN,
  password: process.env._PASSWORD_ADMIN,
  database: process.env._DATABASE_ADMIN,
  port:3306
});


exports.CheckConnection = () => {
  connection.connect((err) => {
    if (err) {
      console.error("Error connection to MYSQL databases: ", err);
      return;
    }
    console.log("MySQL database connection established successfully!");
  });
};

exports.Select = (sql, table, callback) => {
  try {
    connection.connect((err) => {
      return err;
    });
    connection.query(sql, (error, results, fields) => {

      if (error) {
        callback(error, null);
      }

      if (table == "MasterPatient") {
        callback(null, model.MasterPatients(results));
      }
      if (table == "MasterStaff") {
        callback(null, model.MasterStaff(results));
      }
      if (table == "MasterCenter") {
        callback(null, model.MasterCenter(results));
      }
      if (table == "MasterEvent") {
        callback(null, model.MasterEvent(results));
      }

      if (table == "MasterUsers") {
        callback(null, model.MasterUsers(results));
      }

    });
  } catch (error) {
    console.log(error);
  }
};

exports.InsertTable = (tablename, data, callback) => {
  if (tablename === "master_patient") {
    let sql = `INSERT INTO master_patient(
        first_name,
        last_name,
        middle_name,
        age,
        date_of_birth,
        birth_place,
        gender,
        civil_status,
        nationality,
        religion,
        occupation,
        phone_number,
        email,
        address,
        emergency_contact_name,
        emergency_contact_phone,
        blood_type,
        philhealth_number,
        allergies,
        status,
        createby,
        createddate) VALUES ?`;

   
    this.Insert(sql, data, callback); 
  }
  if (tablename === "master_staff") {
    let sql = `INSERT INTO master_staff(
        type,
        fullname,
        position,
        specialization,
        phone_number,
        email,
        address,
        hire_date,
        years_of_experience,
        medical_license_number,
        image,
        createby,
        status,
        createddate,
        center) VALUES ?`;
    this.Insert(sql, data, callback); 
  }
  if (tablename === "master_branches") {
    let sql = `INSERT INTO master_branches(
        branch_name,
        address,
        createddate,
        createdby,
        status) VALUES ?`;

   
    this.Insert(sql, data, callback); 
  }
  if (tablename === "master_medical_record") {
    let sql = `INSERT INTO master_medical_record(
        patient_id,
        medical_record,
        file,
        status,
        created_by,
        created_date,
        file_name) VALUES ?`;

   
    this.Insert(sql, data, callback); 
  }
};

exports.Insert = (sql, values, callback) => {
  connection.query(sql, [values], (err, result) => {
    if (err) {
      return callback(err, null);
    }
    callback(null, result);
  });
};


exports.SelectResult = (sql, callback) => {
  try {
    connection.connect((err) => {
      return err;
    });
    connection.query(sql, (error, results, fields) => {
      // console.log(results);

      if (error) {
        callback(error, null);
      }

      callback(null, results);
    });
  } catch (error) {
    console.log(error);
  }
};

exports.mysqlQueryPromise = (sql) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results);
      }
    });
  });
}

const Encrypter = (password, callback) => {
  const salt = crypto.randomBytes(16).toString('hex'); // Use a secure salt
  crypto.pbkdf2(password, salt, 1000, 64, 'sha512', (err, derivedKey) => {
    if (err) return callback(err);
    callback(null, salt + ':' + derivedKey.toString('hex')); // Store salt and hashed password together
  });
};

exports.Encrypter = Encrypter;




