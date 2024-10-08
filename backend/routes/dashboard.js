const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('centerlayout', { title: 'Express' });
});

module.exports = router;

router.get("/loadcount", (req, res) => {
  try {
    let sql = `SELECT 
    (SELECT COUNT(*) FROM master_patient) AS total_patients,
    (SELECT COUNT(*) FROM master_staff WHERE type IN ('Admin', 'Staff')) AS total_admin_staff,
    (SELECT COUNT(*) FROM master_staff WHERE type = 'Doctor') AS total_doctors,
    (SELECT COUNT(*) FROM master_appointment WHERE status = 'Scheduled') AS total_scheduled_appointments`;
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

router.get("/countlatestpatient", (req, res) => {
  try {
    let sql = `SELECT 
    lf.month AS creation_month,
    IFNULL(COUNT(mp.patient_id), 0) AS patient_count
FROM 
    (SELECT DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL n MONTH), '%M') AS month,
            MONTH(DATE_SUB(CURDATE(), INTERVAL n MONTH)) AS month_number
     FROM (SELECT 0 AS n UNION ALL
           SELECT 1 UNION ALL
           SELECT 2 UNION ALL
           SELECT 3 UNION ALL
           SELECT 4) AS nums
    ) lf
LEFT JOIN 
    master_patient mp 
    ON DATE_FORMAT(mp.createddate, '%M') = lf.month
GROUP BY 
    lf.month, lf.month_number
ORDER BY 
    lf.month_number DESC`;
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


