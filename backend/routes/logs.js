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
        let sql = `
            SELECT 
                ml.log_id,
                ml.user_id,
                ml.action,
                ml.created_at,
                ms.fullname
            FROM 
                master_logs ml
            JOIN 
                master_staff ms ON ml.user_id = ms.id
            ORDER BY 
                ml.log_id  DESC
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
  







