import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:myecotrip/admin/ticket_scan/data/models/scanResponse.dart';
import 'package:myecotrip/constants/config.dart';

import '../../../repository/repository.dart';

class ScannerRepository {
  static Future<TicketModel?> scanTicket(
      {required BuildContext context, required String ticketNumber}) async {
    try {
      // Map<String, String>? postheaders = {
      //   'Accept': 'application/json',
      //   'Authorization': 'Bearer ${sharedPref.token}',
      // };
      var sharedPref;
      Map<String, String>? headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${sharedPref.token}',
      };
      final response =
          await API.get(url: 'qrscan/${ticketNumber}', apiRoot: API_TMNGR, context: context);
      if (response.statusCode == 201) {
        TicketModel ticketModel = ticketModelFromJson(response.body);
        return ticketModel;
      } else {
        log('filaed 2');
        return null;
      }
    } catch (e) {
      showToast('Invalid Ticket',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.top,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
          backgroundColor: Colors.green);
      log('filaed 3 $e');
      return null;
    }
  }
}
