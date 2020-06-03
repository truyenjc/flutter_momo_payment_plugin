import 'dart:io';

import 'package:flutter/foundation.dart';

class MomoPaymentData {
  String merchantname;
  String merchantcode;
  String appScheme;
  double amount;
  String orderId;
  String orderLabel;
  String merchantnamelabel;
  double fee;
  String description;
  String requestId;
  String partnerCode;
  String extraData;
  bool isDevelopmentMode;

  MomoPaymentData({
    @required this.merchantname,
    @required this.merchantcode,
    @required this.amount,
    @required this.partnerCode,
    @required this.appScheme,
    this.orderId,
    this.orderLabel,
    this.merchantnamelabel,
    this.fee,
    this.description,
    this.requestId,
    this.extraData,
    this.isDevelopmentMode = false,
  }) : assert(
          merchantname != null &&
              merchantname.isNotEmpty &&
              merchantcode != null &&
              merchantcode.isNotEmpty &&
              amount != null &&
              amount > 0 &&
              partnerCode != null &&
              partnerCode.isNotEmpty &&
              appScheme != null &&
              appScheme.isNotEmpty,
        );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "merchantname": this.merchantname,
      "merchantcode": this.merchantcode,
      "amount": this.amount,
      "partnerCode": this.partnerCode,
      "fee": this.fee ?? 0,
      "isDevelopmentMode": isDevelopmentMode ?? false,
    };

    if (Platform.isIOS) {
      json["appScheme"] = appScheme;
    }
    if (description != null) {
      json["description"] = description;
    }
    if (requestId != null) {
      json["requestId"] = requestId;
    }
    if (merchantnamelabel != null) {
      json["merchantnamelabel"] = merchantnamelabel;
    }
    if (orderId != null) {
      json["orderId"] = orderId;
    }
    if (orderLabel != null) {
      json["orderLabel"] = orderLabel;
    }

    return json;
  }
}
