class CartModel {
  int? id;
  String? name;
  int? price;
  int? seats;

  CartModel({this.id, this.name, this.price, this.seats});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    seats = json['seats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['seats'] = seats;
    return data;
  }
}
