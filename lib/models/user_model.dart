class UserModel {
  String? message;
  String? token;
  int? expiresAt;
  String? refreshToken;
  String? tokenType;

  UserModel(
      {this.message,
      this.token,
      this.expiresAt,
      this.refreshToken,
      this.tokenType});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    expiresAt = json['expires_at'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['expires_at'] = expiresAt;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    return data;
  }
}
