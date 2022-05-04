import 'package:myecotrip/admin/issue_ticket/data/models/availabilityModel.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/landScapeMode.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/trekinfoModel.dart';
import 'package:myecotrip/admin/ticket_scan/data/models/scanResponse.dart';

class TicketPostModel {
  List<Visitor> visitorList;
  AvailSlot? slot;
  LandScapeModel? landscape;
  TrekInfoModel? trekInfoModel;
  TicketPostModel({
    this.landscape,
    this.slot,
    this.trekInfoModel,
    required this.visitorList,
  });
}
