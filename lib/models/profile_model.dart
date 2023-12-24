class ProfileModel {
  int? id;
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? username;
  String? type;

  ProfileModel(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.email,
      this.image,
      this.username,
      this.type});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    username = json['username'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['image'] = image;
    data['username'] = username;
    data['type'] = type;
    return data;
  }
}
