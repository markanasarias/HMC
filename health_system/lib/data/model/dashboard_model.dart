class SalesGraph {
  final String date;
  final double total;

  SalesGraph({required this.date, required this.total});
}


class CardModel {
  final String total_patients;
  final String total_admin_staff;
  final String total_doctors;
  final String total_scheduled_appointments;
  CardModel(
      this.total_patients,
      this.total_admin_staff,
      this.total_doctors,
      this.total_scheduled_appointments,);
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      json['total_patients'],
      json['total_admin_staff'],
      json['total_doctors'],
      json['total_scheduled_appointments'],           
    );
  }
}

class GraphModel {
  final String creation_month;
  final String patient_count;
  GraphModel(
      this.creation_month,
      this.patient_count,);
  factory GraphModel.fromJson(Map<String, dynamic> json) {
    return GraphModel(
      json['creation_month'],
      json['patient_count'].toString(),          
    );
  }
}

class PieData {
  final String label;
  final double value;

  PieData({required this.label, required this.value});
}
