const mysql = require('./repository/healthcare');
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res, next) {
  res.render('loginlayout', { title: 'Express' });
});

module.exports = router;

router.post("/login", (req, res) => {
  try {
    let { username, password } = req.body;
    let sql = `SELECT ms.*, mu.usertype
               FROM master_staff ms
               JOIN master_users mu ON ms.id = mu.user_id
               WHERE mu.username = '${username}' AND mu.password = '${password}';`;

    mysql.SelectResult(sql, (err, result) => {
      if (err) {
        return res.json({
          msg: err,
        });
      }

      if (result.length === 0) {
        return res.json({
          msg: "Username or password incorrect",
        });
      }
      if (result[0].status === "inactive") {
        return res.json({
          msg: "Account is inactive. Please contact support.",
        });
      }

      // Successful login response
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



  





