// To parse this JSON data, do
//
//     final feedbackPost = feedbackPostFromJson(jsonString);

import 'dart:convert';

FeedbackPost feedbackPostFromJson(String str) =>
    FeedbackPost.fromJson(json.decode(str));

String feedbackPostToJson(FeedbackPost data) => json.encode(data.toJson());

class FeedbackPost {
  String fullName;
  String phone;
  String email;

  FeedbackPost({
    required this.fullName,
    required this.phone,
    required this.email,
  });

  factory FeedbackPost.fromJson(Map<String, dynamic> json) => FeedbackPost(
        fullName: json["full_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "email": email,
      };
}
