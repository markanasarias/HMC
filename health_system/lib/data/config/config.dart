class Config{
  static const String apiUrl = 'http://localhost:3000/';

  static const String login = 'login/login';
  static const String loadpatient = 'patient/load';
  static const String addpatient = 'patient/save';
  static const String loadcenter = 'center/load';
  static const String addcenter = 'center/save';
  static const String loadstaff = 'staff/load';
  static const String addstaff = 'staff/save';
  static const String loadevent = 'event/load';
  static const String loaditems = 'items/load';
  static const String loadstocks = 'inventory/load';
  static const String loadstaffrequest = 'request_inventory/loadstaff';
  static const String loadadminrequest = 'request_inventory/loadbranch';
  static const String loadviewrequest = 'request_inventory/loadrequestbranch';
  static const String loadservice = 'service/load';
  static const String loadlogs = 'logs/load';
  static const String loadappointment = 'appointment/load';
  static const String loadcount = 'dashboard/loadcount';
  static const String loadlinegraph = 'dashboard/countlatestpatient';
}