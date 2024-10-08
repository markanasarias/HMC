const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loglayout', { title: 'Express' });
});

module.exports = router;

router.post("/load", (req, res) => {
    try {
      let {branch_id} =  req.body;
      let sql = `SELECT * FROM master_inventory WHERE branch_id = '${branch_id}'`;

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

  router.post("/loadwithout", (req, res) => {
    try {
      let { branch_id } = req.body;
      let sql = `SELECT * FROM master_inventory`;
      if (branch_id) {
        sql += ` WHERE branch_id = '${branch_id}'`;
      }
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






