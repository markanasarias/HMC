class CalendarModel {
  final String id;
  final String name;
  final String description;
  final String start_time;
  final String end_time;
  final String location;
  final String createby;
  final String createddate;

  CalendarModel(
      this.id,
      this.name,
      this.description,
      this.start_time,
      this.end_time,
      this.location,
      this.createby,
      this.createddate,);
  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      json['id'],
      json['name'],
      json['description'],
      json['start_time'],
      json['end_time'],
      json['location'],
      json['createby'],
      json['createddate'],            
    );
  }
}