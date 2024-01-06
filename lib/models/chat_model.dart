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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sent_from'] = sentFrom;
    data['sent_to'] = sentTo;
    data['message'] = message;
    data['sent_at'] = sentAt;
    return data;
  }
}
