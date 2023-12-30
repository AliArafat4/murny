class AuthModel {
  String? message;
  String? token;
  int? expiresAt;
  String? refreshToken;
  String? tokenType;
  String? userType;

  AuthModel({
    this.message,
    this.token,
    this.expiresAt,
    this.refreshToken,
    this.tokenType,
    this.userType,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    expiresAt = json['expires_at'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['expires_at'] = expiresAt;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    data['user_type'] = userType;
    return data;
  }
}
