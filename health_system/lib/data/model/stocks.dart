class StocksModel {
  final String item_id;
  final String item_name;
  final String category;
  final String quantity;
  final String purchase_date;
  final String expiry_date;
  final String createby;
  final String createddate;
  final String branch_id;
  final String status;
  StocksModel(
      this.item_id,
      this.item_name,
      this.category,
      this.quantity,
      this.purchase_date,
      this.expiry_date,
      this.createby,
      this.createddate,
      this.branch_id,
      this.status,);
  factory StocksModel.fromJson(Map<String, dynamic> json) {
    return StocksModel(
      json['item_id'],
      json['item_name'],
      json['category'],
      json['quantity'],
      json['purchase_date'],
      json['expiry_date'],
      json['createby'],
      json['createddate'],
      json['branch_id'],
      json['status'],             
    );
  }
}