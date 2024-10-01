class ResponceModel {
  final String message;
  final int status;
  final List<dynamic> result;
  final String description;

  ResponceModel(this.message, this.status, this.result, this.description);

  factory ResponceModel.fromJson(Map<String, dynamic> json) {
    return ResponceModel(
        json['message'], json['status'], json['result'], json['description']);
  }
}