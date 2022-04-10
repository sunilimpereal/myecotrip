import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPref;
  init() async {
    if (_sharedPref == null) {
      _sharedPref = await SharedPreferences.getInstance();
    }
  }

  //getter 
  bool get loggedIn => _sharedPref!.getBool('loggedIn') ?? false;
  String get userEmail => _sharedPref!.getString('userEmail') ?? "";
  String get token => _sharedPref!.getString('token') ?? "";
  String get uuid => _sharedPref!.getString('uuid') ?? "";

  ///Set as logged in
  setLoggedIn() {
    _sharedPref!.setBool('loggedIn', true);
  }

  /// Set as logged out
  setLoggedOut() {
    _sharedPref!.setBool('loggedIn', false);
    // _sharedPref!.remove('authToken');
  }
  
  /// Set uuid for the user
  setUserDetails({
    required String uuid,
    required String userEmail,
  }) {
    _sharedPref!.setString('uuid', uuid);
    _sharedPref!.setString('userEmail', userEmail);
  }

  ///set Auth token for the app
  setAuthToken({required String token}) {
    log("see tocken $token");
    _sharedPref!.setString('token', token);
  }



}

final sharedPrefs = SharedPref();
