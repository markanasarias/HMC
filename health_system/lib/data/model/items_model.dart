class ItemsModel {
  final String item_id;
  final String item_name;
  final String item_type;
  final String created_by;
  final String created_date;
  final String status;
  ItemsModel(
      this.item_id,
      this.item_name,
      this.item_type,
      this.created_by,
      this.created_date,
      this.status,);
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      json['item_id'],
      json['item_name'],
      json['item_type'],
      json['created_by'],
      json['created_date'],
      json['status'],             
    );
  }
}