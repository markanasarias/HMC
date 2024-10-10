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
      let sql = `SELECT * FROM master_items`;
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

  router.post("/getitems", (req, res) => {
    try {
      let {item_id} =  req.body;
      let sql = `SELECT * FROM master_items WHERE item_id = '${item_id}'`;
  
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
      let item_name = req.body.item_name;
      let item_type = req.body.item_type;
      let created_by = req.body.created_by;
      let status = 'Active';
      let today = new Date();
      let createddate = today.toISOString().split('T')[0];
  
      let sql = `SELECT * FROM master_items WHERE item_name = '${item_name}'`;
      mysql.SelectResult(sql, (err, result) => {
        if (err) {
          console.error('Error: ', err);
          return res.json({ msg: 'error' });
        }
  
        if (result.length !== 0) {
          return res.json({ msg: 'Item already exists' });
        }
  
        let data = [[
          item_name, item_type, created_by, createddate, status
        ]];
        mysql.InsertTable("master_items", data, (err, result) => {
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
  







