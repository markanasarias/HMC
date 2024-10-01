class PatientModel {
  final String id;
  final String firstName;
  final String lastName;
  final String middleName;
   final String age;
  final String dateOfBirth;
  final String birthPlace;
  final String gender;
  final String civilStatus;
  final String nationality;
  final String religion;
  final String occupation;
  final String phoneNumber;
  final String email;
  final String address;
  final String emergencyContactName;
  final String emergencyContactPhone;
          final String bloodType;
           final String philhealthNumber;
            final String allergies;
             final String createdBy;
              final String createdDate;

  PatientModel(
      this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.age,
      this.dateOfBirth,
      this.birthPlace,
      this.gender,
      this.civilStatus,
      this.nationality,
      this.religion,
      this.occupation,
      this.phoneNumber,
      this.email,
      this.address,
      this.emergencyContactName,
      this.emergencyContactPhone,
      this.bloodType,
      this.philhealthNumber,
      this.allergies,
      this.createdBy,
      this.createdDate);
  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['middleName'],
      json['age'],
      json['dateOfBirth'],
      json['birthPlace'],
      json['gender'],
      json['civilStatus'],
      json['nationality'],
       json['religion'],
        json['occupation'],
         json['phoneNumber'],
          json['email'],
           json['address'],
            json['emergencyContactName'],
             json['emergencyContactPhone'],
              json['bloodType'],
               json['philhealthNumber'],
                json['allergies'],
                 json['createdBy'],
                  json['createdDate'],
                 
    );
  }
}