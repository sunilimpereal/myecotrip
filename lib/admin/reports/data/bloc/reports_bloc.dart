import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/reports/data/repository/trekBookingRepository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../utils/bloc.dart';
import '../models/trekBookings_model.dart';

class ReportsBloc extends Bloc {
  BuildContext context;
  ReportsBloc(this.context) {
    getRecentTickets();
  }
  final _ticketReportListcontroller = BehaviorSubject<List<TrekBookingModel>>();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  Stream<List<TrekBookingModel>> get ticketReportListStream =>
      _ticketReportListcontroller.stream.asBroadcastStream();

  changeDate({required DateTime startDatet,required DateTime endDatet}){
    startDate = startDatet;
    endDate = endDatet;
    getRecentTickets();
  }
  Future<bool> getRecentTickets() async {
    TrekBookingRepository ticketRepository = TrekBookingRepository();
    final result = await ticketRepository.getTrekBookingsList(
        context: context, startDate: startDate, endDate: endDate);
    _ticketReportListcontroller.sink.add(result);
    return true;
  }

  @override
  void dispose() {
    _ticketReportListcontroller.close();
  }
}

class ReportsProvider extends InheritedWidget {
  late ReportsBloc bloc;
  BuildContext context;
  ReportsProvider({Key? key, required Widget child, required this.context})
      : super(key: key, child: child) {
    bloc = ReportsBloc(context);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ReportsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ReportsProvider>() as ReportsProvider).bloc;
  }
}
