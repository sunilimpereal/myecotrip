import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:myecotrip/admin/reports/data/models/trekBookings_model.dart';

import '../../../../constants/config.dart';
import '../../../../repository/repository.dart';

class TrekBookingRepository {
  Future<List<TrekBookingModel>> getTrekBookingsList(
      {required BuildContext context,
      required DateTime startDate,
      required DateTime endDate}) async {
    String adminId = ""; // TODO Admin ID
    try {
      final response = await API.get(
          url:
              'trekBookingsSelectAll/0/10000/Active/Booking/${getFormatedDate(startDate)}/${getFormatedDate(endDate)}/TRK128/ADM10',
          apiRoot: API_TMNGR,
          context: context);
      if (response.statusCode == 201) {
        List<TrekBookingModel> trekBookingList = trekBookingModelFromJson(response.body);
        return trekBookingList;
      } else {
        log('filaed 2');
        return [];
      }
    } catch (e) {
      showToast(
        'Invalid Ticket',
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
}

getFormatedDate(DateTime datetime) {
  return "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}";
}
