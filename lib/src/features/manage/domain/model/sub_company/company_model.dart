// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final companyModel = companyModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));

String companyModelToJson(CompanyModel data) => json.encode(data.toJson());

class CompanyModel extends Equatable {
  final DateTime? createdAt;
  final String? companyName;
  final String? logo;
  final String? email;
  final String? mobileNumber;
  final String? address;
  final int? gstNum;
  final String? totalUnpaidBooking;
  final int? availableCreditLimit;
  final String? id;

  const CompanyModel({
    this.createdAt,
    this.companyName,
    this.logo,
    this.email,
    this.mobileNumber,
    this.address,
    this.gstNum,
    this.totalUnpaidBooking,
    this.availableCreditLimit,
    this.id,
  });

  CompanyModel copyWith({
    DateTime? createdAt,
    String? companyName,
    String? logo,
    String? email,
    String? mobileNumber,
    String? address,
    int? gstNum,
    String? totalUnpaidBooking,
    int? availableCreditLimit,
    String? id,
  }) =>
      CompanyModel(
        createdAt: createdAt ?? this.createdAt,
        companyName: companyName ?? this.companyName,
        logo: logo ?? this.logo,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        address: address ?? this.address,
        gstNum: gstNum ?? this.gstNum,
        totalUnpaidBooking: totalUnpaidBooking ?? this.totalUnpaidBooking,
        availableCreditLimit: availableCreditLimit ?? this.availableCreditLimit,
        id: id ?? this.id,
      );

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        companyName: json["companyName"],
        logo: json["logo"],
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        address: json["address"],
        gstNum: json["gst_num"],
        totalUnpaidBooking: json["totalUnpaidBooking"],
        availableCreditLimit: json["availableCreditLimit"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "companyName": companyName,
        "logo": logo,
        "email": email,
        "mobileNumber": mobileNumber,
        "address": address,
        "gst_num": gstNum,
        "totalUnpaidBooking": totalUnpaidBooking,
        "availableCreditLimit": availableCreditLimit,
        "id": id,
      };

  @override
  List<Object?> get props {
    return [
      createdAt,
      companyName,
      logo,
      email,
      mobileNumber,
      address,
      gstNum,
      totalUnpaidBooking,
      availableCreditLimit,
      id,
    ];
  }
}
