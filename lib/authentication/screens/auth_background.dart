import 'package:flutter/material.dart';
import 'package:myecotrip/authentication/screens/login_screen.dart';
import 'package:myecotrip/authentication/screens/signup_screen.dart';
import 'package:myecotrip/constants/config.dart';

enum AuthStates {
  login,
  signup1,
  signup2,
}

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  AuthStates authState = AuthStates.login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                IMAGES + 'login_bg.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              top: Config().deviceHeight(context) * 0.15,
              left: Config().deviceWidth(context) * 0.1,
              child: Container(
                height: Config().deviceHeight(context) * 0.1,
                width: Config().deviceWidth(context) * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        IMAGES + 'logo.png',
                      ),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Container(
              height: Config().deviceHeight(context),
              width: Config().deviceWidth(context),
              decoration: const BoxDecoration(),
            ),
            authState == AuthStates.login
                ? LoginScreen(
                    clickSignUp: () {
                      setState(() {
                        authState = AuthStates.signup1;
                      });
                    },
                  )
                : SignUpScreen(
                    clickLogin: () {
                      setState(() {
                        authState = AuthStates.login;
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }
}
