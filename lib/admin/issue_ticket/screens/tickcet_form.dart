import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:myecotrip/admin/dashboard/data/cardModel.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/availabilityModel.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/landScapeMode.dart';
import 'package:myecotrip/admin/issue_ticket/data/models/tickerPostModelTemp.dart';
import 'package:myecotrip/admin/issue_ticket/data/repository/ticketDoemRepository.dart';
import 'package:myecotrip/admin/issue_ticket/screens/payment.dart';
import 'package:myecotrip/admin/issue_ticket/screens/widgets/dropdownTextField.dart';
import 'package:myecotrip/admin/issue_ticket/screens/widgets/dropdown_isstic.dart';
import 'package:myecotrip/admin/reports/screens/report_slide.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/admin/reports/widgets/DateTile.dart';
import 'package:myecotrip/admin/ticket_scan/data/models/scanResponse.dart';
import 'package:myecotrip/admin/ticket_scan/screen/widgets/ticket_person_card.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/screens/widgets/EC_textfield.dart';
import 'package:myecotrip/main/Trekking_Details_page/Screens/trek_panel_pages/trek_info.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants/config.dart';
import '../../../main/Trekking_Details_page/Widgets/back_button.dart';
import '../../dashboard/screens/widgets/drawer.dart';
import '../data/models/trekinfoModel.dart';

class IssueTicketForm extends StatefulWidget {
  CardDataModel? cardDataModel;
  IssueTicketForm({Key? key, this.cardDataModel}) : super(key: key);

  @override
  State<IssueTicketForm> createState() => _IssueTicketFormState();
}

class _IssueTicketFormState extends State<IssueTicketForm> {
  late PanelController panelController = PanelController();
  int i = 0;

  //textfields
  TextEditingController landscapeController = TextEditingController();
  FocusNode locationFocus = FocusNode();
  TextEditingController trekController = TextEditingController();
  FocusNode trekFocus = FocusNode();
  TextEditingController slotController = TextEditingController();
  FocusNode slotFocus = FocusNode();
  TextEditingController genderController = TextEditingController();
  FocusNode genderFocus = FocusNode();
  TextEditingController typeController = TextEditingController();
  FocusNode typeFocus = FocusNode();
  TextEditingController firstNameController = TextEditingController();
  FocusNode firstNameFocus = FocusNode();
  TextEditingController lastNameController = TextEditingController();
  FocusNode lastNameFocus = FocusNode();
  TextEditingController mobileNumberController = TextEditingController();
  FocusNode mobileNumberFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController ageController = TextEditingController();
  FocusNode ageFocus = FocusNode();
  onTap() {
    setState(() {});
  }

  List<String> types = ["Adult", "Child", "Student"];
  List<String> genders = ["Male", "Female"];
  List<LandScapeModel> landscapeList = [];
  List<AvailSlot> slotList = [];
  AvailSlot? selectedSlot;
  LandScapeModel? selectedLandscape;
  TrekInfoModel? trekInfo;
  String? selectedType = null;
  String? selectedGender = null;
  DateTime selectedDate = DateTime.now();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  getLandScapeList() async {
    List<LandScapeModel> tempList = await ticketFromRepository.getlandscapeList(context: context);
    setState(() {
      landscapeList = tempList;
    });
  }

  getTrekinfo(String trekId) async {
    TrekInfoModel? trekInfoModel =
        await ticketFromRepository.gettrekinfo(context: context, trekId: trekId);
    setState(() {
      trekInfo = trekInfoModel;
      ticketPostModel.trekInfoModel = trekInfo;
    });
  }

  getSlotList() async {
    if (selectedLandscape != null) {
      List<AvailSlot> slot = await ticketFromRepository.getSlotList(
          context: context, trekid: selectedLandscape!.trkId, selectedDate: selectedDate);
      log(slot.toString());
      setState(() {
        slotList = slot;
      });
    }
  }

  @override
  void initState() {
    if (widget.cardDataModel != null) {
      selectedLandscape = widget.cardDataModel!.landScapeModel;
      landscapeController.text = selectedLandscape!.trkName;
      selectedSlot = widget.cardDataModel!.slotDetail.slots[0];
      slotController.text = selectedSlot!.sltShift;
      selectedDate = widget.cardDataModel!.slotDetail.slots[0].sltTrekdate;
      ticketPostModel.landscape =selectedLandscape;
      ticketPostModel.slot = selectedSlot;
      getTrekinfo(selectedLandscape!.trkId);
    }
    getLandScapeList();
    super.initState();
  }

  TicketFromRepository ticketFromRepository = TicketFromRepository();
  //Ticket
  TicketPostModel ticketPostModel = TicketPostModel(visitorList: []);
  String errorMessage = "";
  addVisitor() {
    if (validateData()) {
      setState(() {
        ticketPostModel.visitorList.add(Visitor(
          tvtType: selectedType ?? "Adult",
          tvtFname: firstNameController.text,
          tvtLname: lastNameController.text,
          tvtEmail: emailController.text,
          tvtMobile: mobileNumberController.text,
          tvtAge: ageController.text,
          tvtFees: "123",
          tvtGender: genderController.text,
        ));
        clear();
      });
    } else {}
  }

  clear() {
    selectedType = null;
    typeController.clear();
    genderController.clear();
    ageController.clear();
    emailController.clear();
    mobileNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }

  showError(String a) {
    showToast(
      a,
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
  }

  validateData() {
    setState(() {});
    if (selectedType == null) {
      showError("Select Type");
      return false;
    }
    if (selectedGender == null) {
      showError("Select Gender");
      return false;
    }
    if (firstNameController.text == "") {
      showError("Enter FirstName");
      return false;
    }
    if (lastNameController.text == "") {
      showError("Enter Last Name");
      return false;
    }
    if (mobileNumberController.text == "") {
      showError("Enter Phone Number");
      return false;
    }
    if (emailController.text == "") {
      showError("Enter  Email");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(child: DashDrawer()),
        body: SafeArea(
          child: SlidingUpPanel(
            isDraggable: true,
            color: Colors.white,
            controller: panelController,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            minHeight: Config().deviceHeight(context) *
                (WidgetsBinding.instance!.window.viewInsets.bottom > 0.0 ? 0.03 : widget.cardDataModel !=null?0.16: 0.15),
            maxHeight: MediaQuery.of(context).size.height * 0.88,
            snapPoint: 0.5,
            panel: panel(),
            header: headerui(context),
            body: Column(
              children: [
                CustomAppBar(
                  leading:widget.cardDataModel !=null?
                  CustomBackButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ):
                   CustomIconButton(
                      size: 36,
                      onTap: () {
                        _key.currentState?.openDrawer();
                      },
                      iconData: Icons.sort),
                  title: const Text(
                    "Issue Ticket",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ),
                Container(
                    height: Config().deviceHeight(context) * 0.8,
                    child: SingleChildScrollView(child: form()))
              ],
            ),
          ),
        ));
  }

  Widget form() {
    Color textFieldColor = Theme.of(context).colorScheme.secondary;
    log(landscapeList.toString());
    LoginBloc? loginBloc = LoginProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        "Add Visitor",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.49,
                      options: landscapeList.map((e) => e.trkName).toList(),
                      onSelected: (e) {
                        setState(() {
                          landscapeController.text = e;
                          selectedLandscape =
                              landscapeList.firstWhere((element) => element.trkName == e);
                          ticketPostModel.landscape = selectedLandscape;
                          getSlotList();
                          getTrekinfo(selectedLandscape!.trkId);
                        });
                      },
                      labelText: "Select Landscape",
                      controller: landscapeController,
                    ),
                    DateTile(
                        title: '',
                        color: Theme.of(context).colorScheme.secondary,
                        date: selectedDate,
                        onTap: () => selectDate(
                            date: selectedDate,
                            context: context,
                            onSelected: (selected) {
                              setState(() {
                                selectedDate = selected;
                                getSlotList();
                                slotController.clear();
                                ticketPostModel.slot = null;
                              });
                            })),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.46,
                      options: slotList.map((e) => e.sltShift).toList(),
                      searchable: false,
                      onSelected: (e) {
                        setState(() {
                          selectedSlot = slotList.firstWhere((element) => element.sltShift == e);
                          ticketPostModel.slot = selectedSlot;
                          slotController.text = e;
                        });
                      },
                      labelText: "Select Slot",
                      controller: slotController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ECTExtField(
                      bgColor: textFieldColor,
                      controller: firstNameController,
                      focusNode: firstNameFocus,
                      heading: "First Name",
                      icon: Icons.person,
                      labelText: "First Name",
                      obscureText: false,
                      onChanged: loginBloc!.changePassword,
                      onTap: onTap,
                      onfocus: firstNameFocus.hasFocus,
                      stream: loginBloc.password,
                      width: Config().deviceWidth(context) * 0.46,
                    ),
                    ECTExtField(
                      bgColor: textFieldColor,
                      controller: lastNameController,
                      focusNode: lastNameFocus,
                      heading: "Last Name",
                      icon: Icons.person,
                      labelText: "Last Name",
                      obscureText: false,
                      onChanged: loginBloc.changePassword,
                      onTap: onTap,
                      onfocus: lastNameFocus.hasFocus,
                      stream: loginBloc.password,
                      width: Config().deviceWidth(context) * 0.46,
                    )
                  ],
                ),
                Row(
                  children: [
                    ECTExtField(
                      bgColor: textFieldColor,
                      controller: mobileNumberController,
                      focusNode: mobileNumberFocus,
                      heading: "Phone Number",
                      icon: Icons.person,
                      labelText: "Phone Number",
                      obscureText: false,
                      onChanged: loginBloc.changePassword,
                      onTap: onTap,
                      keyboardType: TextInputType.number,
                      onfocus: mobileNumberFocus.hasFocus,
                      stream: loginBloc.password,
                      width: Config().deviceWidth(context) * 0.93,
                    )
                  ],
                ),
                Row(
                  children: [
                    ECTExtField(
                      bgColor: textFieldColor,
                      controller: emailController,
                      focusNode: emailFocus,
                      heading: "Email",
                      icon: Icons.person,
                      labelText: "Email",
                      obscureText: false,
                      onChanged: loginBloc.changePassword,
                      onTap: onTap,
                      onfocus: emailFocus.hasFocus,
                      stream: loginBloc.password,
                      width: Config().deviceWidth(context) * 0.93,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ECTExtField(
                      bgColor: textFieldColor,
                      controller: ageController,
                      focusNode: ageFocus,
                      heading: "Age",
                      icon: Icons.person,
                      labelText: "Age",
                      obscureText: false,
                      onChanged: loginBloc.changePassword,
                      onTap: onTap,
                      keyboardType: TextInputType.number,
                      onfocus: ageFocus.hasFocus,
                      stream: loginBloc.password,
                      width: Config().deviceWidth(context) * 0.2,
                    ),
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.35,
                      options: ['Male', 'Female'],
                      searchable: false,
                      onSelected: (e) {
                        setState(() {
                          genderController.text = e;
                          selectedGender = e;
                        });
                      },
                      labelText: "Select Gender",
                      controller: genderController,
                    ),
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.35,
                      options: ['Adult', 'Child'],
                      searchable: false,
                      onSelected: (e) {
                        setState(() {
                          typeController.text = e;
                          selectedType = e;
                        });
                      },
                      labelText: "Select Type",
                      controller: typeController,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdButton(
                      width: Config().deviceWidth(context) * 0.93,
                      icon: Icons.person_add,
                      onPressed: () {
                        addVisitor();
                      },
                      text: "Add Visitor",
                      color: Colors.green.shade700,
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget panel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Visitors",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: Nunito),
                        ),
                        SizedBox(
                          width: Config().deviceWidth(context) * 0.04,
                        ),
                        Material(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Center(
                                child: Ink(
                                    child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: Text(
                                      ticketPostModel.visitorList.length.toString(),
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                )),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Column(
                    children: ticketPostModel.visitorList
                        .map((e) => TicketPersonCard(
                              visitor: e,
                            ))
                        .toList()),
                SizedBox(
                  height: Config().deviceHeight(context) * 0.05,
                ),
                ticketPostModel.visitorList.length > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AdButton(
                            icon: Icons.confirmation_number_outlined,
                            onPressed: () {
                              if (ticketPostModel.visitorList.length > 0) {
                                if (ticketPostModel.landscape == null) {
                                  showError("Landscape not selected");
                                } else if (ticketPostModel.slot == null) {
                                  showError("Slot not selected");
                                } else if (ticketPostModel.trekInfoModel == null) {
                                  showError("Failed to getTrekInfo");
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Payment(
                                        ticketPostModel: ticketPostModel,
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                showError("Add Vistiors to Issue Ticket");
                              }
                            },
                            text: "Issue Ticket",
                            color: Colors.green.shade700,
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
