import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/data/bloc/signup_bloc.dart';
import 'package:myecotrip/authentication/screens/widgets/ECStreamButton.dart';
import 'package:myecotrip/authentication/screens/widgets/EC_textfield.dart';

import '../../constants/config.dart';
import '../data/repository/authrepository.dart';

class SignUpScreen extends StatefulWidget {
  Function clickLogin;
  SignUpScreen({Key? key, required this.clickLogin}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ///one is for first sate that is name and mobile
  ///two is for email and password
  int state = 1;

  //name
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  String nameError = "";

  // mobile
  TextEditingController mobileController = TextEditingController();
  FocusNode mobileFocus = FocusNode();
  String mobileError = "";

  // email
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  String emailError = "";

  //password
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  String passwordError = "";

  bool signUpFailFlag = false;

  onTap() {
    setState(() {});
  }

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        emailError = "";
        passwordError ="";
      });
    });
    nameController.addListener(() {
      setState(() {
        nameError = "";
      });
    });
    passwordController.addListener(() {
      setState(() {
        passwordError = "";
      });
    });
    mobileController.addListener(() {
      setState(() {
        mobileError = "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignUpBloc? signUpBloc = SignUpProvider.of(context);
    return state == 1 ? stateOne(signUpBloc) : stateTwo(signUpBloc);
  }

  /// Containes name and mobile
  /// first part of sign up
  Widget stateOne(SignUpBloc? signUpBloc) {
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
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ECTExtField(
                        controller: nameController,
                        focusNode: nameFocus,
                        heading: "Name",
                        icon: Icons.person,
                        labelText: "Name",
                        obscureText: false,
                        onChanged: signUpBloc!.changeName,
                        keyboardType: TextInputType.text,
                        onTap: onTap,
                        onfocus: nameFocus.hasFocus,
                        stream: signUpBloc.name,
                        error: nameError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // password
                      ECTExtField(
                        controller: mobileController,
                        focusNode: mobileFocus,
                        heading: "Mobile",
                        icon: Icons.lock,
                        labelText: "Mobile",
                        obscureText: false,
                        onChanged: signUpBloc.changeMobile,
                        keyboardType: TextInputType.number,
                        onTap: onTap,
                        onfocus: mobileFocus.hasFocus,
                        stream: signUpBloc.mobile,
                        error: mobileError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      StreamBuilder<String>(
                          stream: signUpBloc.signupError,
                          builder: (context, snapshot) {
                            return ECStreamButton(
                              formValidationStream: signUpBloc.validateForm1Stream,
                              submit: () async {
                                if (validateForm1()) {
                                  setState(() {
                                    FocusScope.of(context).unfocus();
                                    state = 2;
                                  });
                                }
                              },
                              text: "Next",
                              errorText: snapshot.hasData ? snapshot.data ?? "" : "Error",
                              errorFlag: signUpFailFlag,
                              width: Config().deviceWidth(context) * 0.75,
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have an Account? ",
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.clickLogin();
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green[700]),
                            ),
                          ),
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

  Widget stateTwo(SignUpBloc? signUpBloc) {
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
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  state = 1;
                                });
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 24,
                              )),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ECTExtField(
                        controller: emailController,
                        focusNode: emailFocus,
                        heading: "email",
                        icon: Icons.email,
                        labelText: "email",
                        obscureText: false,
                        onChanged: signUpBloc!.changeEmail,
                        keyboardType: TextInputType.emailAddress,
                        onTap: onTap,
                        onfocus: emailFocus.hasFocus,
                        stream: signUpBloc.email,
                        error: emailError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      const SizedBox(
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
                        onChanged: signUpBloc.changePassword,
                        keyboardType: TextInputType.visiblePassword,
                        onTap: onTap,
                        onfocus: passwordFocus.hasFocus,
                        stream: signUpBloc.password,
                        error: passwordError,
                        width: MediaQuery.of(context).size.width * 0.75,
                      ),
                      StreamBuilder<String>(
                          stream: signUpBloc.signupError,
                          builder: (context, snapshot) {
                            return ECStreamButton(
                              formValidationStream: signUpBloc.validateForm2Stream,
                              submit: () async {
                                if (validateForm2()) {
                                  AuthRepository authRepository = AuthRepository();
                                }
                              },
                              text: "Sign Up",
                              errorText:
                                  snapshot.hasData ? snapshot.data ?? "" : "Error Signing Up",
                              errorFlag: signUpFailFlag,
                              width: Config().deviceWidth(context) * 0.75,
                            );
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have an Account? ",
                            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              widget.clickLogin();
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green[700]),
                            ),
                          ),
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

  bool validateForm1() {
    bool flag = true;

    if (nameController.text.isEmpty) {
      flag = false;
      setState(() {
        nameError = "Enter Valid Name";
      });
    } else {
      setState(() {
        nameError = "";
      });
    }
    // password validation
    if (mobileController.text.isEmpty) {
      flag = false;
      mobileError = "Please enter password";
    } else {
      mobileError = "";
    }
    return flag;
  }

  bool validateForm2() {
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
