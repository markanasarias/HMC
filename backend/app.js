var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const mysql = require('./routes/repository/healthcare')


var patientRouter = require('./routes/patient');
var staffRouter = require('./routes/staff');
var eventRouter = require('./routes/event');
var loginRouter = require('./routes/login');
var centerRouter = require('./routes/center');
var logsRouter = require('./routes/logs');
var itemsRouter = require('./routes/items');
var requestinventoryRouter = require('./routes/request_inventory');
var inventoryRouter = require('./routes/inventory');
var serviceRouter = require('./routes/service');
var appointmentRouter = require('./routes/appointment');
var dashboardRouter = require('./routes/dashboard');
var scheduleRouter = require('./routes/schedule');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

mysql.CheckConnection();


app.use('/patient', patientRouter);
app.use('/staff', staffRouter);
app.use('/event', eventRouter);
app.use('/login', loginRouter);
app.use('/center', centerRouter);
app.use('/logs', logsRouter);
app.use('/items', itemsRouter);
app.use('/request_inventory', requestinventoryRouter);
app.use('/inventory', inventoryRouter);
app.use('/service', serviceRouter);
app.use('/appointment', appointmentRouter);
app.use('/dashboard', dashboardRouter);
app.use('/schedule', scheduleRouter);



app.use(function(req, res, next) {
  next(createError(404));
});

app.use(function(err, req, res, next) {

  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
