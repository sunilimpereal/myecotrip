import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myecotrip/admin/dashboard/screens/dashboard.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/data/repository/authrepository.dart';
import 'package:myecotrip/authentication/screens/widgets/ECStreamButton.dart';
import 'package:myecotrip/authentication/screens/widgets/EC_textfield.dart';
import 'package:myecotrip/constants/config.dart';

import '../../main/navpage/main_page.dart';

class LoginScreen extends StatefulWidget {
  Function clickSignUp;
  LoginScreen({Key? key, required this.clickSignUp}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  String emailError = "";
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  String passwordError = "";
  bool loginFailFlag = false;
  onTap() {
    setState(() {});
  }

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        emailError = "";
      });
    });
    super.initState();
  }

  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    LoginBloc? loginBloc = LoginProvider.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRect(
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Material(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: Config().deviceHeight(context) * 0.5,
                  width: Config().deviceWidth(context) * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ECTExtField(
                        controller: emailController,
                        focusNode: emailFocus,
                        heading: "email",
                        icon: Icons.email,
                        labelText: "email",
                        obscureText: false,
                        onChanged: loginBloc!.changeEmail,
                        keyboardType: TextInputType.emailAddress,
                        onTap: onTap,
                        onfocus: emailFocus.hasFocus,
                        stream: loginBloc.email,
                        error: emailError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // password
                      ECTExtField(
                        controller: passwordController,
                        focusNode: passwordFocus,
                        heading: "password",
                        icon: Icons.lock,
                        labelText: "password",
                        obscureText: true,
                        onChanged: loginBloc.changePassword,
                        keyboardType: TextInputType.visiblePassword,
                        onTap: onTap,
                        onfocus: passwordFocus.hasFocus,
                        stream: loginBloc.password,
                        error: passwordError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      StreamBuilder<String>(
                          stream: loginBloc.loginError,
                          builder: (context, snapshot) {
                            return ECStreamButton(
                              formValidationStream: loginBloc.validateFormStream,
                              submit: () async {
                                if (validateForm()) {
                                  AuthRepository authRepository = AuthRepository();
                                  authRepository
                                      .login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context,
                                  )
                                      .then((value) {
                                    log("final val $value");
                                    Future.delayed(const Duration(milliseconds: 100))
                                        .then((value1) {
                                      if (value) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                checkedValue ? AdminDashboard() : MainPage(),
                                          ),
                                        );
                                      }
                                      setState(() {
                                        loginFailFlag = !value;
                                      });
                                    });
                                  });
                                }
                              },
                              text: "Login",
                              errorText: snapshot.hasData ? snapshot.data ?? "" : "Login Failed",
                              errorFlag: loginFailFlag,
                              width: Config().deviceWidth(context) * 0.75,
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dont have an account? ",
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.clickSignUp();
                            },
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green[700]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Admin",
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            width: 30,
                            child: Checkbox(
                              activeColor: Colors.green,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              value: checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue ?? false;
                                  log("sad00");
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  bool validateForm() {
    bool flag = true;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (!emailValid) {
      flag = false;
      setState(() {
        emailError = "Enter Valid Email";
      });
    } else {
      setState(() {
        emailError = "";
      });
    }
    // password validation
    if (passwordController.text.isEmpty) {
      flag = false;
      passwordError = "Please enter password";
    } else {
      passwordError = "";
    }
    return flag;
  }
}
