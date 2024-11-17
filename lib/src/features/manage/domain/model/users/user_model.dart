// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final DateTime? createdAt;
  final String? name;
  final String? avatar;
  final String? email;
  final String? mobileNumber;
  final String? currency;
  final bool? isActive;
  final String? totalUnpaidBooking;
  final int? availableLimit;
  final String? id;
  final String? companyId;

  const UserModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.email,
    this.mobileNumber,
    this.currency,
    this.isActive,
    this.totalUnpaidBooking,
    this.availableLimit,
    this.id,
    this.companyId,
  });

  UserModel copyWith({
    DateTime? createdAt,
    String? name,
    String? avatar,
    String? email,
    String? mobileNumber,
    String? currency,
    bool? isActive,
    String? totalUnpaidBooking,
    int? availableLimit,
    String? id,
    String? companyId,
  }) =>
      UserModel(
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        currency: currency ?? this.currency,
        isActive: isActive ?? this.isActive,
        totalUnpaidBooking: totalUnpaidBooking ?? this.totalUnpaidBooking,
        availableLimit: availableLimit ?? this.availableLimit,
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        currency: json["currency"],
        isActive: json["isActive"],
        totalUnpaidBooking: json["totalUnpaidBooking"],
        availableLimit: json["availableLimit"],
        id: json["id"],
        companyId: json["companyId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "email": email,
        "mobileNumber": mobileNumber,
        "currency": currency,
        "isActive": isActive,
        "totalUnpaidBooking": totalUnpaidBooking,
        "availableLimit": availableLimit,
        "id": id,
        "companyId": companyId,
      };

  @override
  List<Object?> get props {
    return [
      createdAt,
      name,
      avatar,
      email,
      mobileNumber,
      currency,
      isActive,
      totalUnpaidBooking,
      availableLimit,
      id,
      companyId,
    ];
  }
}
