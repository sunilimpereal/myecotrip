import 'package:flutter/cupertino.dart';
import 'package:myecotrip/admin/dashboard/data/dashboardRepository.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/availabilityModel.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/landScapeMode.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/trekinfoModel.dart';
import 'package:myecotrip/main/Trekking_Details_page/Screens/trek_panel_pages/trek_info.dart';

import '../../issue_ticket/data/repository/ticketDoemRepository.dart';

class CardDataModel {
  LandScapeModel landScapeModel;
  AvailabilityModel slotDetail;

  CardDataModel({required this.landScapeModel, required this.slotDetail});
}

