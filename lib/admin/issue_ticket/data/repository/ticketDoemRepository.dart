import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/availabilityModel.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/trekinfoModel.dart';
import 'package:myecotrip/main.dart';
import '../../../../constants/config.dart';
import '../../../../repository/repository.dart';
import '../../../reports/data/models/trekBookings_model.dart';
import '../models/landScapeMode.dart';

class TicketFromRepository {
  Future<List<LandScapeModel>> getlandscapeList({required BuildContext context}) async {
    String adminId = ""; // TODO Admin ID
    try {
      final response =
          await API.get(url: 'lslist/${sharedPref.uuid}', apiRoot: API_TMNGR, context: context);
      if (response.statusCode == 201) {
        List<LandScapeModel> trekBookingList = landScapeModelFromJson(response.body);
        return trekBookingList;
      } else {
        log('filaed 2');
        return [];
      }
    } catch (e) {
      showToast(
        'Get Landscape Failed',
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.top,
        animDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
        backgroundColor: Colors.green,
      );
      log('filaed 3 $e');
      return [];
    }
  }

  Future<TrekInfoModel?> gettrekinfo({
    required BuildContext context,
    required String trekId,
  }) async {
    String adminId = ""; // TODO Admin ID
    try {
      final response =
          await API.get(url: 'trekinfo/${trekId}', apiRoot: API_TMNGR, context: context);
      if (response.statusCode == 201) {
        TrekInfoModel trekInfoModel = trekInfoModelFromJson(response.body);
        return trekInfoModel;
      } else {
        log('filaed 2');
        return null;
      }
    } catch (e) {
      showToast(
        'Get trekInfo Failed',
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: StyledToastPosition.top,
        animDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
        backgroundColor: Colors.green,
      );
      log('filaed 3 $e');
      return null;
    }
  }

  Future<List<AvailSlot>> getSlotList(
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
      List<AvailSlot> slotList = availabilityModel.slots;
      return slotList;
    } else {
      log('filaed 2');
      return [];
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
}
