import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/data/cardModel.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/landScapeMode.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/repository/repository.dart';

import '../../issue_ticket/data/models/availabilityModel.dart';
import '../../issue_ticket/data/repository/ticketDoemRepository.dart';

class DashboardRepository {
  Future<AvailabilityModel?> getAvailableSlotDetail(
      {required BuildContext context,
      required String trekid,
      required DateTime selectedDate}) async {
    String adminId = ""; // TODO Admin ID
    // try {
    String date =
        "${selectedDate.year.toString().padLeft(4, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    final response = await API.get(
        url: 'checkAvailability/${trekid}/${date}', apiRoot: API_TMNGR, context: context);
    if (response.statusCode == 201) {
      AvailabilityModel availabilityModel = availabilityModelFromJson(response.body);

      return availabilityModel;
    } else {
      log('filaed 2');
      return null;
    }
    // } catch (e) {
    //   showToast(
    //     'Get Slot Failed',
    //     context: context,
    //     animation: StyledToastAnimation.scale,
    //     reverseAnimation: StyledToastAnimation.fade,
    //     position: StyledToastPosition.top,
    //     animDuration: const Duration(seconds: 1),
    //     duration: const Duration(seconds: 4),
    //     curve: Curves.elasticOut,
    //     reverseCurve: Curves.linear,
    //     backgroundColor: Colors.green,
    //   );
    //   log('filaed 3 $e');
    //   return [];
    // }
  }

  Future<List<CardDataModel>> getCardData(
      {required BuildContext context, required DateTime date}) async {
    TicketFromRepository ticketFromRepository = TicketFromRepository();
    List<CardDataModel> cardList = [];
    // get the list of Landscapes
    List<LandScapeModel> landScapeList =
        await ticketFromRepository.getlandscapeList(context: context);
    for (LandScapeModel landScape in landScapeList) {
      AvailabilityModel? availabilityModel = await getAvailableSlotDetail(
          context: context, trekid: landScape.trkId, selectedDate: date);
      if (availabilityModel != null) {
        for (AvailSlot slot in availabilityModel.slots) {
          AvailabilityModel cardAvail = AvailabilityModel(
              images1: availabilityModel.images1,
              images2: availabilityModel.images2,
              images3: availabilityModel.images3,
              images4: availabilityModel.images4,
              trekdata: availabilityModel.trekdata,
              slots: [slot]);
          cardList.add(CardDataModel(landScapeModel: landScape, slotDetail: cardAvail));
        }
      }
    }
    return cardList;
  }
}
