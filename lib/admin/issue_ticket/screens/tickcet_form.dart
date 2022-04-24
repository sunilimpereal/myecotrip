import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/widgets/adbutton.dart';
import 'package:myecotrip/admin/issue_ticket/screens/payment.dart';
import 'package:myecotrip/admin/issue_ticket/screens/widgets/dropdownTextField.dart';
import 'package:myecotrip/admin/issue_ticket/screens/widgets/dropdown_isstic.dart';
import 'package:myecotrip/admin/reports/screens/report_slide.dart';
import 'package:myecotrip/admin/reports/screens/reports_screen.dart';
import 'package:myecotrip/admin/ticket_scan/screen/widgets/ticket_person_card.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/screens/widgets/EC_textfield.dart';
import 'package:myecotrip/main/Trekking_Details_page/Widgets/app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constants/config.dart';
import '../../../main/Trekking_Details_page/Widgets/back_button.dart';

class IssueTicketForm extends StatefulWidget {
  const IssueTicketForm({Key? key}) : super(key: key);

  @override
  State<IssueTicketForm> createState() => _IssueTicketFormState();
}

class _IssueTicketFormState extends State<IssueTicketForm> {
  late PanelController panelController = PanelController();
  int i = 0;

  //textfields
  TextEditingController locationController = TextEditingController();
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
  String? selectedType = null;
  String? selectedGender = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SlidingUpPanel(
        isDraggable: true,
        color: Colors.green[200]!,
        controller: panelController,
        borderRadius:
            const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        minHeight: Config().deviceHeight(context) * 0.065,
        maxHeight: MediaQuery.of(context).size.height * 0.55,
        panel: panel(),
        header: headerui(context),
        body: Column(
          children: [
            CustomAppBar(
              leading: CustomBackButton(
                onTap: () {},
              ),
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
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.56,
                      options: ['madikere', 'bengaluru', 'dsadsdsa'],
                      onSelected: (e) {
                        setState(() {
                          locationController.text = e;
                        });
                      },
                      labelText: "Select Location",
                      controller: locationController,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [Icon(Icons.calendar_month_outlined), Text("20/4/2022")],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.46,
                      options: ['madikere', 'bengaluru', 'dsadsdsa'],
                      onSelected: (e) {
                        setState(() {
                          trekController.text = e;
                        });
                      },
                      labelText: "Select Trek",
                      controller: trekController,
                    ),
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.45,
                      options: ['6:00 AM', '4 :00 PM'],
                      searchable: false,
                      onSelected: (e) {
                        setState(() {
                          slotController.text = e;
                        });
                      },
                      labelText: "Select Slot",
                      controller: slotController,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ECTExtField(
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
                        });
                      },
                      labelText: "Select Gender",
                      controller: genderController,
                    ),
                    DropdownTextField(
                      width: Config().deviceWidth(context) * 0.35,
                      options: ['Adult', 'Child', 'Student'],
                      searchable: false,
                      onSelected: (e) {
                        setState(() {
                          typeController.text = e;
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
                      onPressed: () {},
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Members",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Material(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 30,
                          width: 30,
                          child: Center(
                            child: Ink(
                                child: InkWell(
                              splashColor: Colors.green,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "3",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            TicketPersonCard(),
            TicketPersonCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AdButton(
                  icon: Icons.person_add,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment(),
                      ),
                    );
                  },
                  text: "Issue Ticket",
                  color: Colors.green.shade700,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
