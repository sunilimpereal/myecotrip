// To parse this JSON data, do
//
//     final trekInfoModel = trekInfoModelFromJson(jsonString);

import 'dart:convert';

TrekInfoModel trekInfoModelFromJson(String str) => TrekInfoModel.fromJson(json.decode(str));

String trekInfoModelToJson(TrekInfoModel data) => json.encode(data.toJson());

class TrekInfoModel {
    TrekInfoModel({
       required  this.slno,
       required  this.trkId,
       required  this.trkLandscapeid,
       required  this.trkName,
       required  this.trkLocation,
       required  this.trkOpendate,
       required  this.trkCloseddate,
       required  this.trkShift400,
       required  this.trkShift430,
       required  this.trkShift500,
       required  this.trkShift530,
       required  this.trkShift600,
       required  this.trkShift630,
       required  this.trkShift700,
       required  this.trkShift730,
       required  this.trkShift800,
       required  this.trkShift830,
       required  this.trkShift900,
       required  this.trkImage,
       required  this.trkDescription,
       required  this.trkStatus,
       required  this.trkCreatedAt,
       required  this.trkUpdatedAt,
       required  this.lndscp,
       required  this.images1,
       required  this.images2,
       required  this.images3,
       required  this.images4,
       required  this.mapcords,
       required  this.info,
       required  this.slot,
       required  this.overview,
       required  this.tarrif,
       required  this.tarrifall,
       required  this.guides,
       required  this.trkDescriptionPlain,
    });

    String slno;
    String trkId;
    String trkLandscapeid;
    String trkName;
    String trkLocation;
    DateTime trkOpendate;
    DateTime trkCloseddate;
    dynamic trkShift400;
    dynamic trkShift430;
    dynamic trkShift500;
    dynamic trkShift530;
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
    Lndscp lndscp;
    String images1;
    String images2;
    String images3;
    String images4;
    String mapcords;
    Info info;
    Slot slot;
    Overview overview;
    Tarrif tarrif;
    List<Tarrif> tarrifall;
    List<Guide> guides;
    String trkDescriptionPlain;

    factory TrekInfoModel.fromJson(Map<String, dynamic> json) => TrekInfoModel(
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
        lndscp: Lndscp.fromJson(json["lndscp"]),
        images1: json["images1"],
        images2: json["images2"],
        images3: json["images3"],
        images4: json["images4"],
        mapcords: json["mapcords"],
        info: Info.fromJson(json["info"]),
        slot: Slot.fromJson(json["slot"]),
        overview: Overview.fromJson(json["overview"]),
        tarrif: Tarrif.fromJson(json["tarrif"]),
        tarrifall: List<Tarrif>.from(json["tarrifall"].map((x) => Tarrif.fromJson(x))),
        guides: List<Guide>.from(json["guides"].map((x) => Guide.fromJson(x))),
        trkDescriptionPlain: json["trk_description_plain"],
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "trk_id": trkId,
        "trk_landscapeid": trkLandscapeid,
        "trk_name": trkName,
        "trk_location": trkLocation,
        "trk_opendate": "${trkOpendate.year.toString().padLeft(4, '0')}-${trkOpendate.month.toString().padLeft(2, '0')}-${trkOpendate.day.toString().padLeft(2, '0')}",
        "trk_closeddate": "${trkCloseddate.year.toString().padLeft(4, '0')}-${trkCloseddate.month.toString().padLeft(2, '0')}-${trkCloseddate.day.toString().padLeft(2, '0')}",
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
        "lndscp": lndscp.toJson(),
        "images1": images1,
        "images2": images2,
        "images3": images3,
        "images4": images4,
        "mapcords": mapcords,
        "info": info.toJson(),
        "slot": slot.toJson(),
        "overview": overview.toJson(),
        "tarrif": tarrif.toJson(),
        "tarrifall": List<dynamic>.from(tarrifall.map((x) => x.toJson())),
        "guides": List<dynamic>.from(guides.map((x) => x.toJson())),
        "trk_description_plain": trkDescriptionPlain,
    };
}

class Guide {
    Guide({
       required this.natId,
       required this.natLocation,
       required this.natNatid,
       required this.natFullname,
       required this.natEmail,
       required this.natMobile,
    });

    String natId;
    String natLocation;
    String natNatid;
    String natFullname;
    String natEmail;
    String natMobile;

    factory Guide.fromJson(Map<String, dynamic> json) => Guide(
        natId: json["nat_id"],
        natLocation: json["nat_location"],
        natNatid: json["nat_natid"],
        natFullname: json["nat_fullname"],
        natEmail: json["nat_email"],
        natMobile: json["nat_mobile"],
    );

    Map<String, dynamic> toJson() => {
        "nat_id": natId,
        "nat_location": natLocation,
        "nat_natid": natNatid,
        "nat_fullname": natFullname,
        "nat_email": natEmail,
        "nat_mobile": natMobile,
    };
}

class Info {
    Info({
        required this.slno,
        required this.infId,
        required this.infTrekid,
        required this.infLength,
        required this.infDuration,
        required this.infDifficulty,
        required this.infStartingpoint,
        required this.infEndpoint,
        required this.infChildallow,
        required this.infDescription,
        required this.infStatus,
        required this.infCreatedAt,
        required this.infUpdatedAt,
    });

    String slno;
    String infId;
    String infTrekid;
    String infLength;
    String infDuration;
    String infDifficulty;
    String infStartingpoint;
    String infEndpoint;
    String infChildallow;
    String infDescription;
    String infStatus;
    DateTime infCreatedAt;
    DateTime infUpdatedAt;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        slno: json["slno"],
        infId: json["inf_id"],
        infTrekid: json["inf_trekid"],
        infLength: json["inf_length"],
        infDuration: json["inf_duration"],
        infDifficulty: json["inf_difficulty"],
        infStartingpoint: json["inf_startingpoint"],
        infEndpoint: json["inf_endpoint"],
        infChildallow: json["inf_childallow"],
        infDescription: json["inf_description"],
        infStatus: json["inf_status"],
        infCreatedAt: DateTime.parse(json["inf_createdAt"]),
        infUpdatedAt: DateTime.parse(json["inf_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "inf_id": infId,
        "inf_trekid": infTrekid,
        "inf_length": infLength,
        "inf_duration": infDuration,
        "inf_difficulty": infDifficulty,
        "inf_startingpoint": infStartingpoint,
        "inf_endpoint": infEndpoint,
        "inf_childallow": infChildallow,
        "inf_description": infDescription,
        "inf_status": infStatus,
        "inf_createdAt": infCreatedAt.toIso8601String(),
        "inf_updatedAt": infUpdatedAt.toIso8601String(),
    };
}

class Lndscp {
    Lndscp({
      required  this.slno,
      required  this.lndId,
      required  this.lndLandscape,
      required  this.lndLocation,
      required  this.lndTreks,
      required  this.lndDescription,
      required  this.lndImage,
      required  this.lndStatus,
      required  this.lndCreatedAt,
      required  this.lndUpdatedAt,
      required  this.lndDescriptionPlain,
    });

    String slno;
    String lndId;
    String lndLandscape;
    String lndLocation;
    String lndTreks;
    String lndDescription;
    String lndImage;
    String lndStatus;
    DateTime lndCreatedAt;
    DateTime lndUpdatedAt;
    String lndDescriptionPlain;

    factory Lndscp.fromJson(Map<String, dynamic> json) => Lndscp(
        slno: json["slno"],
        lndId: json["lnd_id"],
        lndLandscape: json["lnd_landscape"],
        lndLocation: json["lnd_location"],
        lndTreks: json["lnd_treks"],
        lndDescription: json["lnd_description"],
        lndImage: json["lnd_image"],
        lndStatus: json["lnd_status"],
        lndCreatedAt: DateTime.parse(json["lnd_createdAt"]),
        lndUpdatedAt: DateTime.parse(json["lnd_updatedAt"]),
        lndDescriptionPlain: json["lnd_description_plain"],
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "lnd_id": lndId,
        "lnd_landscape": lndLandscape,
        "lnd_location": lndLocation,
        "lnd_treks": lndTreks,
        "lnd_description": lndDescription,
        "lnd_image": lndImage,
        "lnd_status": lndStatus,
        "lnd_createdAt": lndCreatedAt.toIso8601String(),
        "lnd_updatedAt": lndUpdatedAt.toIso8601String(),
        "lnd_description_plain": lndDescriptionPlain,
    };
}

class Overview {
    Overview({
      required  this.slno,
      required  this.ovrId,
      required  this.ovrTrekid,
      required  this.ovrDescription,
      required  this.ovrImage,
      required  this.ovrStatus,
      required  this.ovrCreatedAt,
      required  this.ovrUpdatedAt,
    });

    String slno;
    String ovrId;
    String ovrTrekid;
    String ovrDescription;
    String ovrImage;
    String ovrStatus;
    DateTime ovrCreatedAt;
    DateTime ovrUpdatedAt;

    factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        slno: json["slno"],
        ovrId: json["ovr_id"],
        ovrTrekid: json["ovr_trekid"],
        ovrDescription: json["ovr_description"],
        ovrImage: json["ovr_image"],
        ovrStatus: json["ovr_status"],
        ovrCreatedAt: DateTime.parse(json["ovr_createdAt"]),
        ovrUpdatedAt: DateTime.parse(json["ovr_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "ovr_id": ovrId,
        "ovr_trekid": ovrTrekid,
        "ovr_description": ovrDescription,
        "ovr_image": ovrImage,
        "ovr_status": ovrStatus,
        "ovr_createdAt": ovrCreatedAt.toIso8601String(),
        "ovr_updatedAt": ovrUpdatedAt.toIso8601String(),
    };
}

class Slot {
    Slot({
       required this.slno,
       required this.sltId,
       required this.sltTrekid,
       required this.sltTrekdate,
       required this.sltShift,
       required this.sltTslots,
       required this.sltBslots,
       required this.sltAslots,
       required this.sltGdeid,
       required this.sltNatid,
       required this.sltStatus,
       required this.sltCreatedAt,
       required this.sltUpdatedAt,
    });

    String slno;
    String sltId;
    String sltTrekid;
    DateTime sltTrekdate;
    String sltShift;
    String sltTslots;
    String sltBslots;
    String sltAslots;
    String sltGdeid;
    dynamic sltNatid;
    String sltStatus;
    DateTime sltCreatedAt;
    DateTime sltUpdatedAt;

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        slno: json["slno"],
        sltId: json["slt_id"],
        sltTrekid: json["slt_trekid"],
        sltTrekdate: DateTime.parse(json["slt_trekdate"]),
        sltShift: json["slt_shift"],
        sltTslots: json["slt_tslots"],
        sltBslots: json["slt_bslots"],
        sltAslots: json["slt_aslots"],
        sltGdeid: json["slt_gdeid"],
        sltNatid: json["slt_natid"],
        sltStatus: json["slt_status"],
        sltCreatedAt: DateTime.parse(json["slt_createdAt"]),
        sltUpdatedAt: DateTime.parse(json["slt_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "slt_id": sltId,
        "slt_trekid": sltTrekid,
        "slt_trekdate": "${sltTrekdate.year.toString().padLeft(4, '0')}-${sltTrekdate.month.toString().padLeft(2, '0')}-${sltTrekdate.day.toString().padLeft(2, '0')}",
        "slt_shift": sltShift,
        "slt_tslots": sltTslots,
        "slt_bslots": sltBslots,
        "slt_aslots": sltAslots,
        "slt_gdeid": sltGdeid,
        "slt_natid": sltNatid,
        "slt_status": sltStatus,
        "slt_createdAt": sltCreatedAt.toIso8601String(),
        "slt_updatedAt": sltUpdatedAt.toIso8601String(),
    };
}

class Tarrif {
    Tarrif({
       required this.slno,
       required this.trfId,
       required this.trfTrekid,
       required this.trfWday,
       required this.trfAdult,
       required this.trfChild,
       required this.trfStudent,
       required this.trfStatus,
       required this.trfCreatedAt,
       required this.trfUpdatedAt,
    });

    String slno;
    String trfId;
    String trfTrekid;
    String trfWday;
    String trfAdult;
    String trfChild;
    String trfStudent;
    String trfStatus;
    DateTime trfCreatedAt;
    DateTime trfUpdatedAt;

    factory Tarrif.fromJson(Map<String, dynamic> json) => Tarrif(
        slno: json["slno"],
        trfId: json["trf_id"],
        trfTrekid: json["trf_trekid"],
        trfWday: json["trf_wday"],
        trfAdult: json["trf_adult"],
        trfChild: json["trf_child"],
        trfStudent: json["trf_student"],
        trfStatus: json["trf_status"],
        trfCreatedAt: DateTime.parse(json["trf_createdAt"]),
        trfUpdatedAt: DateTime.parse(json["trf_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "trf_id": trfId,
        "trf_trekid": trfTrekid,
        "trf_wday": trfWday,
        "trf_adult": trfAdult,
        "trf_child": trfChild,
        "trf_student": trfStudent,
        "trf_status": trfStatus,
        "trf_createdAt": trfCreatedAt.toIso8601String(),
        "trf_updatedAt": trfUpdatedAt.toIso8601String(),
    };
}
