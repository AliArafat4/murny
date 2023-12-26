class OrderModel {
  int? id;
  String? createdAt;
  String? driverId;
  String? orderFromId;
  String? locationFrom;
  String? locationTo;
  int? cartId;
  String? orderState;
  String? paymentMethod;
  String? tripStart;
  String? tripEnd;

  OrderModel(
      {this.id,
      this.createdAt,
      this.driverId,
      this.orderFromId,
      this.locationFrom,
      this.locationTo,
      this.cartId,
      this.orderState,
      this.paymentMethod,
      this.tripStart,
      this.tripEnd});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    driverId = json['driver_id'];
    orderFromId = json['order_from_id'];
    locationFrom = json['location_from'];
    locationTo = json['location_to'];
    cartId = json['cart_id'];
    orderState = json['order_state'];
    paymentMethod = json['payment_method'];
    tripStart = json['trip_start'];
    tripEnd = json['trip_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['driver_id'] = driverId;
    data['order_from_id'] = orderFromId;
    data['location_from'] = locationFrom;
    data['location_to'] = locationTo;
    data['cart_id'] = cartId;
    data['order_state'] = orderState;
    data['payment_method'] = paymentMethod;
    data['trip_start'] = tripStart;
    data['trip_end'] = tripEnd;
    return data;
  }
}
