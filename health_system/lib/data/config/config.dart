class Config {
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
  static const String savemedicalrecord = 'patient/savemedicalrecord';
  static const String loadmedicalrecoard = 'patient/loadmedicalrecord';
  static const String selectstaff = 'staff/getstaff';
  static const String selectcenter = 'center/getcenter';
  static const String saveitems = 'items/save';
  static const String selectitems = 'items/getitems';
  static const String savecalendar = 'event/save';
  static const String saveservices = 'service/save';
  static const String selectservice = 'service/getservice';
  static const String savelogs = 'logs/save';
  static const String getevents = 'event/getevents';
  static const String updatecenter = 'center/update';
  static const String updateitems = 'items/update';
  static const String updateservies = 'service/update';
  static const String selectpatient = 'patient/getpatient';
  static const String updatepatient = 'patient/update';
  static const String updatestaff = 'staff/update';
  static const String getdoctor = 'staff/getdoctor';
  static const String addappoinment = 'appointment/save';
  static const String selectappoinment = 'appointment/getappointment';
  static const String updateappoinment = 'appointment/update';
  static const String selectevent = 'event/getcalendar';
  static const String updateevent = 'event/update';
  static const String loadsched = 'schedule/load';
  static const String savesched = 'schedule/save';
  static const String selectsched = 'schedule/getsched';
  static const String updatesched = 'schedule/update';
  static const String staffquestinventory = 'inventory/savedata';
  static const String approvedrequestinventory = 'request_inventory/updatedata';
  static const String reject = 'request_inventory/reject';
}
