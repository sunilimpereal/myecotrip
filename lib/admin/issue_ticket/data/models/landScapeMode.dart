// To parse this JSON data, do
//
//     final landScapeModel = landScapeModelFromJson(jsonString);

import 'dart:convert';

List<LandScapeModel> landScapeModelFromJson(String str) => List<LandScapeModel>.from(json.decode(str).map((x) => LandScapeModel.fromJson(x)));

String landScapeModelToJson(List<LandScapeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LandScapeModel {
    LandScapeModel({
        required this.trkId,
        required this.trkLandscapeid,
        required this.trkName,
        required this.trkLocation,
        required this.trkOpendate,
        required this.trkCloseddate,
    });

    String trkId;
    String trkLandscapeid;
    String trkName;
    String trkLocation;
    DateTime trkOpendate;
    DateTime trkCloseddate;

    factory LandScapeModel.fromJson(Map<String, dynamic> json) => LandScapeModel(
        trkId: json["trk_id"],
        trkLandscapeid: json["trk_landscapeid"],
        trkName: json["trk_name"],
        trkLocation: json["trk_location"],
        trkOpendate: DateTime.parse(json["trk_opendate"]),
        trkCloseddate: DateTime.parse(json["trk_closeddate"]),
    );

    Map<String, dynamic> toJson() => {
        "trk_id": trkId,
        "trk_landscapeid": trkLandscapeid,
        "trk_name": trkName,
        "trk_location": trkLocation,
        "trk_opendate": "${trkOpendate.year.toString().padLeft(4, '0')}-${trkOpendate.month.toString().padLeft(2, '0')}-${trkOpendate.day.toString().padLeft(2, '0')}",
        "trk_closeddate": "${trkCloseddate.year.toString().padLeft(4, '0')}-${trkCloseddate.month.toString().padLeft(2, '0')}-${trkCloseddate.day.toString().padLeft(2, '0')}",
    };
}
