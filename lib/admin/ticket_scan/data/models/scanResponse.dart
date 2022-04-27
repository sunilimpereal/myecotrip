// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'dart:convert';

TicketModel ticketModelFromJson(String str) => TicketModel.fromJson(json.decode(str));

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  TicketModel({
    required this.permit,
    required this.booking,
    required this.trek,
    required this.slot,
    required this.landscape,
    required this.visitors,
    required this.guide,
    required this.status,
  });

  Permit permit;
  Booking booking;
  Trek trek;
  Slot slot;
  Landscape landscape;
  List<Visitor> visitors;
  Guide guide;
  String status;

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        permit: Permit.fromJson(json["permit"]),
        booking: Booking.fromJson(json["booking"]),
        trek: Trek.fromJson(json["trek"]),
        slot: Slot.fromJson(json["slot"]),
        landscape: Landscape.fromJson(json["landscape"]),
        visitors: List<Visitor>.from(json["visitors"].map((x) => Visitor.fromJson(x))),
        guide: Guide.fromJson(json["guide"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "permit": permit.toJson(),
        "booking": booking.toJson(),
        "trek": trek.toJson(),
        "slot": slot.toJson(),
        "landscape": landscape.toJson(),
        "visitors": List<dynamic>.from(visitors.map((x) => x.toJson())),
        "guide": guide.toJson(),
        "status": status,
      };
}

class Booking {
  Booking({
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
  });

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

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
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
      );

  Map<String, dynamic> toJson() => {
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
      };
}

class Guide {
  Guide({
    required this.tgdId,
    required this.tgdFname,
    required this.tgdLname,
    required this.tgdEmail,
    required this.tgdMobile,
    required this.tgdAge,
    required this.tgdDob,
    required this.tgdIdtype,
    required this.tgdIdnumber,
    required this.tgdIdfile,
    required this.tgdAddress,
    required this.tgdPin,
    required this.tgdCity,
    required this.tgdState,
    required this.tgdCountry,
  });

  String tgdId;
  String tgdFname;
  String tgdLname;
  String tgdEmail;
  String tgdMobile;
  String tgdAge;
  DateTime tgdDob;
  String tgdIdtype;
  String tgdIdnumber;
  String tgdIdfile;
  String tgdAddress;
  String tgdPin;
  String tgdCity;
  String tgdState;
  String tgdCountry;

  factory Guide.fromJson(Map<String, dynamic> json) => Guide(
        tgdId: json["tgd_id"],
        tgdFname: json["tgd_fname"],
        tgdLname: json["tgd_lname"],
        tgdEmail: json["tgd_email"],
        tgdMobile: json["tgd_mobile"],
        tgdAge: json["tgd_age"],
        tgdDob: DateTime.parse(json["tgd_dob"]),
        tgdIdtype: json["tgd_idtype"],
        tgdIdnumber: json["tgd_idnumber"],
        tgdIdfile: json["tgd_idfile"],
        tgdAddress: json["tgd_address"],
        tgdPin: json["tgd_pin"],
        tgdCity: json["tgd_city"],
        tgdState: json["tgd_state"],
        tgdCountry: json["tgd_country"],
      );

  Map<String, dynamic> toJson() => {
        "tgd_id": tgdId,
        "tgd_fname": tgdFname,
        "tgd_lname": tgdLname,
        "tgd_email": tgdEmail,
        "tgd_mobile": tgdMobile,
        "tgd_age": tgdAge,
        "tgd_dob":
            "${tgdDob.year.toString().padLeft(4, '0')}-${tgdDob.month.toString().padLeft(2, '0')}-${tgdDob.day.toString().padLeft(2, '0')}",
        "tgd_idtype": tgdIdtype,
        "tgd_idnumber": tgdIdnumber,
        "tgd_idfile": tgdIdfile,
        "tgd_address": tgdAddress,
        "tgd_pin": tgdPin,
        "tgd_city": tgdCity,
        "tgd_state": tgdState,
        "tgd_country": tgdCountry,
      };
}

class Landscape {
  Landscape({
    required this.trkDescription,
  });

  String trkDescription;

  factory Landscape.fromJson(Map<String, dynamic> json) => Landscape(
        trkDescription: json["trk_description"],
      );

  Map<String, dynamic> toJson() => {
        "trk_description": trkDescription,
      };
}

class Permit {
  Permit({
    required this.indUserid,
    required this.indBookingid,
    required this.indPermit,
    required this.indAmount,
  });

  String indUserid;
  String indBookingid;
  String indPermit;
  String indAmount;

  factory Permit.fromJson(Map<String, dynamic> json) => Permit(
        indUserid: json["ind_userid"],
        indBookingid: json["ind_bookingid"],
        indPermit: json["ind_permit"],
        indAmount: json["ind_amount"],
      );

  Map<String, dynamic> toJson() => {
        "ind_userid": indUserid,
        "ind_bookingid": indBookingid,
        "ind_permit": indPermit,
        "ind_amount": indAmount,
      };
}

class Slot {
  Slot({
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

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
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

class Trek {
  Trek({
    required this.infTrekid,
    required this.infLength,
    required this.infDuration,
    required this.infDifficulty,
    required this.infStartingpoint,
    required this.infEndpoint,
    required this.infChildallow,
    required this.infDescription,
  });

  String infTrekid;
  String infLength;
  String infDuration;
  String infDifficulty;
  String infStartingpoint;
  String infEndpoint;
  String infChildallow;
  String infDescription;

  factory Trek.fromJson(Map<String, dynamic> json) => Trek(
        infTrekid: json["inf_trekid"],
        infLength: json["inf_length"],
        infDuration: json["inf_duration"],
        infDifficulty: json["inf_difficulty"],
        infStartingpoint: json["inf_startingpoint"],
        infEndpoint: json["inf_endpoint"],
        infChildallow: json["inf_childallow"],
        infDescription: json["inf_description"],
      );

  Map<String, dynamic> toJson() => {
        "inf_trekid": infTrekid,
        "inf_length": infLength,
        "inf_duration": infDuration,
        "inf_difficulty": infDifficulty,
        "inf_startingpoint": infStartingpoint,
        "inf_endpoint": infEndpoint,
        "inf_childallow": infChildallow,
        "inf_description": infDescription,
      };
}

class Visitor {
  Visitor({
    required this.tvtType,
    required this.tvtFname,
    required this.tvtLname,
    required this.tvtEmail,
    required this.tvtMobile,
    required this.tvtAge,
    required this.tvtFees,
    required this.tvtGender,
  });

  String tvtType;
  String tvtFname;
  String tvtLname;
  String tvtEmail;
  String tvtMobile;
  String tvtAge;
  String tvtFees;
  String tvtGender;

  factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
        tvtType: json["tvt_type"],
        tvtFname: json["tvt_fname"],
        tvtLname: json["tvt_lname"],
        tvtEmail: json["tvt_email"],
        tvtMobile: json["tvt_mobile"],
        tvtAge: json["tvt_age"],
        tvtFees: json["tvt_fees"],
        tvtGender: json["tvt_gender"],
      );

  Map<String, dynamic> toJson() => {
        "tvt_type": tvtType,
        "tvt_fname": tvtFname,
        "tvt_lname": tvtLname,
        "tvt_email": tvtEmail,
        "tvt_mobile": tvtMobile,
        "tvt_age": tvtAge,
        "tvt_fees": tvtFees,
        "tvt_gender": tvtGender,
      };
}
