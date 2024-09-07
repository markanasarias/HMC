class API {
  List<Users>? users;

  API({this.users});

  factory API.fromJson(Map<String, dynamic> json) {
    return API(
      users: json['users'] != null
          ? (json['users'] as List).map((i) => Users.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users?.map((e) => e.toJson()).toList(),
    };
  }
}

class Users {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;

  Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      maidenName: json['maidenName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'maidenName': maidenName,
      'age': age,
      'gender': gender,
      'email': email,
    };
  }
}
