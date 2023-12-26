class DriverModel {
  int? id;
  String? userId;
  String? image;
  bool? gender;
  String? city;
  String? license;
  String? phone;
  String? email;
  String? name;
  double? lat;
  double? lng;
  String? type;

  DriverModel(
      {this.id,
      this.userId,
      this.image,
      this.gender,
      this.city,
      this.license,
      this.phone,
      this.email,
      this.name,
      this.lat,
      this.lng,
      this.type});

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    gender = json['gender'];
    city = json['city'];
    license = json['license'];
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
    lat = json['lat'];
    lng = json['lng'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['gender'] = gender;
    data['city'] = city;
    data['license'] = license;
    data['phone'] = phone;
    data['email'] = email;
    data['name'] = name;
    data['lat'] = lat;
    data['lng'] = lng;
    data['type'] = type;
    return data;
  }
}
