// To parse this JSON data, do
//
//     final availabilityModel = availabilityModelFromJson(jsonString);

import 'dart:convert';

AvailabilityModel availabilityModelFromJson(String str) =>
    AvailabilityModel.fromJson(json.decode(str));

String availabilityModelToJson(AvailabilityModel data) => json.encode(data.toJson());

class AvailabilityModel {
  AvailabilityModel({
    required this.images1,
    required this.images2,
    required this.images3,
    required this.images4,
    required this.trekdata,
    required this.slots,
  });

  String images1;
  String images2;
  String images3;
  String images4;
  Trekdata trekdata;
  List<AvailSlot> slots;

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => AvailabilityModel(
        images1: json["images1"],
        images2: json["images2"],
        images3: json["images3"],
        images4: json["images4"],
        trekdata: Trekdata.fromJson(json["trekdata"]),
        slots: List<AvailSlot>.from(json["slots"].map((x) => AvailSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images1": images1,
        "images2": images2,
        "images3": images3,
        "images4": images4,
        "trekdata": trekdata.toJson(),
        "slots": List<dynamic>.from(slots.map((x) => x.toJson())),
      };
}

class AvailSlot {
  AvailSlot({
    required this.sltId,
    required this.sltTrekid,
    required this.sltTrekdate,
    required this.sltShift,
    required this.sltTslots,
    required this.sltBslots,
    required this.sltAslots,
    required this.sltGdeid,
    required this.sltStatus,
  });

  String sltId;
  String sltTrekid;
  DateTime sltTrekdate;
  String sltShift;
  String sltTslots;
  String sltBslots;
  String sltAslots;
  String sltGdeid;
  String sltStatus;

  factory AvailSlot.fromJson(Map<String, dynamic> json) => AvailSlot(
        sltId: json["slt_id"],
        sltTrekid: json["slt_trekid"],
        sltTrekdate: DateTime.parse(json["slt_trekdate"]),
        sltShift: json["slt_shift"],
        sltTslots: json["slt_tslots"],
        sltBslots: json["slt_bslots"],
        sltAslots: json["slt_aslots"],
        sltGdeid: json["slt_gdeid"],
        sltStatus: json["slt_status"],
      );

  Map<String, dynamic> toJson() => {
        "slt_id": sltId,
        "slt_trekid": sltTrekid,
        "slt_trekdate":
            "${sltTrekdate.year.toString().padLeft(4, '0')}-${sltTrekdate.month.toString().padLeft(2, '0')}-${sltTrekdate.day.toString().padLeft(2, '0')}",
        "slt_shift": sltShift,
        "slt_tslots": sltTslots,
        "slt_bslots": sltBslots,
        "slt_aslots": sltAslots,
        "slt_gdeid": sltGdeid,
        "slt_status": sltStatus,
      };
}

class Trekdata {
  Trekdata({
    required this.slno,
    required this.trkId,
    required this.trkLandscapeid,
    required this.trkName,
    required this.trkLocation,
    required this.trkOpendate,
    required this.trkCloseddate,
    required this.trkShift400,
    required this.trkShift430,
    required this.trkShift500,
    required this.trkShift530,
    required this.trkShift600,
    required this.trkShift630,
    required this.trkShift700,
    required this.trkShift730,
    required this.trkShift800,
    required this.trkShift830,
    required this.trkShift900,
    required this.trkImage,
    required this.trkDescription,
    required this.trkStatus,
    required this.trkCreatedAt,
    required this.trkUpdatedAt,
    required this.trkDescriptionPlain,
  });

  String slno;
  String trkId;
  String trkLandscapeid;
  String trkName;
  String trkLocation;
  DateTime trkOpendate;
  DateTime trkCloseddate;
  String trkShift400;
  String trkShift430;
  String trkShift500;
  String trkShift530;
  String trkShift600;
  String trkShift630;
  String trkShift700;
  String trkShift730;
  String trkShift800;
  String trkShift830;
  String trkShift900;
  String trkImage;
  String trkDescription;
  String trkStatus;
  DateTime trkCreatedAt;
  DateTime trkUpdatedAt;
  String trkDescriptionPlain;

  factory Trekdata.fromJson(Map<String, dynamic> json) => Trekdata(
        slno: json["slno"],
        trkId: json["trk_id"],
        trkLandscapeid: json["trk_landscapeid"],
        trkName: json["trk_name"],
        trkLocation: json["trk_location"],
        trkOpendate: DateTime.parse(json["trk_opendate"]),
        trkCloseddate: DateTime.parse(json["trk_closeddate"]),
        trkShift400: json["trk_shift400"],
        trkShift430: json["trk_shift430"],
        trkShift500: json["trk_shift500"],
        trkShift530: json["trk_shift530"],
        trkShift600: json["trk_shift600"],
        trkShift630: json["trk_shift630"],
        trkShift700: json["trk_shift700"],
        trkShift730: json["trk_shift730"],
        trkShift800: json["trk_shift800"],
        trkShift830: json["trk_shift830"],
        trkShift900: json["trk_shift900"],
        trkImage: json["trk_image"],
        trkDescription: json["trk_description"],
        trkStatus: json["trk_status"],
        trkCreatedAt: DateTime.parse(json["trk_createdAt"]),
        trkUpdatedAt: DateTime.parse(json["trk_updatedAt"]),
        trkDescriptionPlain: json["trk_description_plain"],
      );

  Map<String, dynamic> toJson() => {
        "slno": slno,
        "trk_id": trkId,
        "trk_landscapeid": trkLandscapeid,
        "trk_name": trkName,
        "trk_location": trkLocation,
        "trk_opendate":
            "${trkOpendate.year.toString().padLeft(4, '0')}-${trkOpendate.month.toString().padLeft(2, '0')}-${trkOpendate.day.toString().padLeft(2, '0')}",
        "trk_closeddate":
            "${trkCloseddate.year.toString().padLeft(4, '0')}-${trkCloseddate.month.toString().padLeft(2, '0')}-${trkCloseddate.day.toString().padLeft(2, '0')}",
        "trk_shift400": trkShift400,
        "trk_shift430": trkShift430,
        "trk_shift500": trkShift500,
        "trk_shift530": trkShift530,
        "trk_shift600": trkShift600,
        "trk_shift630": trkShift630,
        "trk_shift700": trkShift700,
        "trk_shift730": trkShift730,
        "trk_shift800": trkShift800,
        "trk_shift830": trkShift830,
        "trk_shift900": trkShift900,
        "trk_image": trkImage,
        "trk_description": trkDescription,
        "trk_status": trkStatus,
        "trk_createdAt": trkCreatedAt.toIso8601String(),
        "trk_updatedAt": trkUpdatedAt.toIso8601String(),
        "trk_description_plain": trkDescriptionPlain,
      };
}
