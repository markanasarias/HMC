class MedicalRecordModel {
  final String id;
  final String patient_id;
  final String medical_record;
  final String file;
  final String status;
  final String created_by;
  final String created_date;
  final String file_name;
  final String full_name;

  MedicalRecordModel(
      this.id,
      this.patient_id,
      this.medical_record,
      this.file,
      this.status,
      this.created_by,
      this.created_date,
      this.file_name,
      this.full_name,
   );
  factory MedicalRecordModel.fromJson(Map<String, dynamic> json) {
    return MedicalRecordModel(
      json['id'],
      json['patient_id'],
      json['medical_record'],
      json['file'],
      json['status'],
      json['created_by'],
      json['created_date'],
      json['file_name'],
      json['full_name'],            
    );
  }
}