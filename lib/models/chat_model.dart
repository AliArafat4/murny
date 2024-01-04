class ChatModel {
  int? id;
  String? sentFrom;
  String? sentTo;
  String? message;
  String? sentAt;

  ChatModel({this.id, this.sentFrom, this.sentTo, this.message, this.sentAt});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentFrom = json['sent_from'];
    sentTo = json['sent_to'];
    message = json['message'];
    sentAt = json['sent_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sent_from'] = this.sentFrom;
    data['sent_to'] = this.sentTo;
    data['message'] = this.message;
    data['sent_at'] = this.sentAt;
    return data;
  }
}
