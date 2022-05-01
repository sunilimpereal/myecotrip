// To parse this JSON data, do
//
//     final trekBookingModel = trekBookingModelFromJson(jsonString);

import 'dart:convert';

List<TrekBookingModel> trekBookingModelFromJson(String str) =>
    List<TrekBookingModel>.from(json.decode(str).map((x) => TrekBookingModel.fromJson(x)));

String trekBookingModelToJson(List<TrekBookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrekBookingModel {
  TrekBookingModel({
    required this.slno,
    required this.trbId,
    required this.trbUserid,
    required this.trbFullname,
    required this.trbEmail,
    required this.trbMobile,
    required this.trbBookdate,
    required this.trbVisitdate,
    required this.trbCountry,
    required this.trbVisitors,
    required this.trbTrekid,
    required this.trbTreklocation,
    required this.trbTrekname,
    required this.trbStartpoint,
    required this.trbSlot,
    required this.trbStatus,
    required this.trbCreatedAt,
    required this.trbUpdatedAt,
    required this.sltShift,
    required this.trkPermit,
    required this.trkPayid,
    required this.trkOrderid,
  });

  String slno;
  String trbId;
  String trbUserid;
  String trbFullname;
  String trbEmail;
  String trbMobile;
  DateTime trbBookdate;
  DateTime trbVisitdate;
  String trbCountry;
  String trbVisitors;
  String trbTrekid;
  String trbTreklocation;
  String trbTrekname;
  String trbStartpoint;
  String trbSlot;
  String trbStatus;
  DateTime trbCreatedAt;
  DateTime trbUpdatedAt;
  String sltShift;
  String trkPermit;
  String trkPayid;
  String trkOrderid;

  factory TrekBookingModel.fromJson(Map<String, dynamic> json) => TrekBookingModel(
        slno: json["slno"],
        trbId: json["trb_id"],
        trbUserid: json["trb_userid"],
        trbFullname: json["trb_fullname"],
        trbEmail: json["trb_email"],
        trbMobile: json["trb_mobile"],
        trbBookdate: DateTime.parse(json["trb_bookdate"]),
        trbVisitdate: DateTime.parse(json["trb_visitdate"]),
        trbCountry: json["trb_country"],
        trbVisitors: json["trb_visitors"],
        trbTrekid: json["trb_trekid"],
        trbTreklocation: json["trb_treklocation"],
        trbTrekname: json["trb_trekname"],
        trbStartpoint: json["trb_startpoint"],
        trbSlot: json["trb_slot"],
        trbStatus: json["trb_status"],
        trbCreatedAt: DateTime.parse(json["trb_createdAt"]),
        trbUpdatedAt: DateTime.parse(json["trb_updatedAt"]),
        sltShift: json["slt_shift"],
        trkPermit: json["trk_permit"],
        trkPayid: json["trk_payid"],
        trkOrderid: json["trk_orderid"],
      );

  Map<String, dynamic> toJson() => {
        "slno": slno,
        "trb_id": trbId,
        "trb_userid": trbUserid,
        "trb_fullname": trbFullname,
        "trb_email": trbEmail,
        "trb_mobile": trbMobile,
        "trb_bookdate":
            "${trbBookdate.year.toString().padLeft(4, '0')}-${trbBookdate.month.toString().padLeft(2, '0')}-${trbBookdate.day.toString().padLeft(2, '0')}",
        "trb_visitdate":
            "${trbVisitdate.year.toString().padLeft(4, '0')}-${trbVisitdate.month.toString().padLeft(2, '0')}-${trbVisitdate.day.toString().padLeft(2, '0')}",
        "trb_country": trbCountry,
        "trb_visitors": trbVisitors,
        "trb_trekid": trbTrekid,
        "trb_treklocation": trbTreklocation,
        "trb_trekname": trbTrekname,
        "trb_startpoint": trbStartpoint,
        "trb_slot": trbSlot,
        "trb_status": trbStatus,
        "trb_createdAt": trbCreatedAt.toIso8601String(),
        "trb_updatedAt": trbUpdatedAt.toIso8601String(),
        "slt_shift": sltShift,
        "trk_permit": trkPermit,
        "trk_payid": trkPayid,
        "trk_orderid": trkOrderid,
      };
}
