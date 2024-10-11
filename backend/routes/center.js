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
        branch_name, address, createddate, createby, status,
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


router.post("/edit", (req, res) => {
  try {
    let categoryname = req.body.categoryname;
    let categorycode = req.body.categorycode;

    let data = [categoryname, categorycode];
    // console.log(data);
    let sql_Update = `UPDATE master_category 
                       SET mc_categoryname = ?
                       WHERE mc_categorycode = ?`;

    let sql_check = `SELECT * FROM master_category WHERE mc_categoryname='${categoryname}'`;

    mysql.Select(sql_check, "MasterCategory", (err, result) => {
      if (err) console.error("Error: ", err);

      if (result.length == 1) {
        return res.json({
          msg: "duplicate",
        });
      } else {
        mysql.UpdateMultiple(sql_Update, data, (err, result) => {
          if (err) console.error("Error: ", err);

          console.log(result);

          let loglevel = dictionary.INF();
          let source = dictionary.MSTR();
          let message = `${dictionary.GetValue(dictionary.UPDT())} -  [${sql_Update}]`;
          let user = req.session.employeeid;

          Logger(loglevel, source, message, user);

          res.json({
            msg: "success",
          });
        });
      }
    });
  } catch (error) {
    res.json({
      msg: error,
    });
  }
});