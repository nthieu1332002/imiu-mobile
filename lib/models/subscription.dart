// To parse this JSON data, do
//
//     final subscription = subscriptionFromJson(jsonString);

import 'dart:convert';

List<Subscription> subscriptionFromJson(String str) {
  final jsonData = json.decode(str)['data'].cast<Map<String, dynamic>>();
  print("jsonData: +$jsonData");
  return jsonData
      .map<Subscription>((json) => Subscription.fromJson(json))
      .toList();
}

String subscriptionToJson(List<Subscription> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subscription {
  String id;
  String name;
  int value;
  String duration;
  List<SubscriptionDetail> subscriptionDetails;

  Subscription({
    required this.id,
    required this.name,
    required this.value,
    required this.duration,
    required this.subscriptionDetails,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        duration: json["duration"],
        subscriptionDetails: List<SubscriptionDetail>.from(
            json["subscriptionDetails"]
                .map((x) => SubscriptionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "duration": duration,
        "subscriptionDetails":
            List<dynamic>.from(subscriptionDetails.map((x) => x.toJson())),
      };
}

class SubscriptionDetail {
  String detail;
  bool status;

  SubscriptionDetail({
    required this.detail,
    required this.status,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) =>
      SubscriptionDetail(
        detail: json["detail"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "status": status,
      };
}
