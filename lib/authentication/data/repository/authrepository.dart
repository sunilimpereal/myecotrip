import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:myecotrip/authentication/data/bloc/login_bloc.dart';
import 'package:myecotrip/authentication/data/models/error_model.dart';
import 'package:myecotrip/authentication/data/models/login_request_model.dart';
import 'package:myecotrip/authentication/data/models/login_response_model.dart';
import 'package:myecotrip/constants/config.dart';
import 'package:myecotrip/repository/repository.dart';
import 'package:myecotrip/utils/shared_pref.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<bool> login(
      {required BuildContext context, required String email, required String password}) async {
    var sharedPref;
    Map<String, String>? postheaders = {
      'Accept': 'application/json',
    };
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel(email: email, pass: password);
      final response = await API.post(
          url: 'token', body: loginRequestModel.toJson(), context: context, headers: postheaders);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = loginResponseModelFromJson(response.body);
        sharedPrefs.setUserDetails(
            uuid: loginResponseModel.uuid, userEmail: loginRequestModel.email);
        sharedPrefs.setAuthToken(token: loginResponseModel.token);
        return true;
      } else {
        ErrorModel errorModel = errorModelFromJson(response.body);
        LoginBloc? loginBloc = LoginProvider.of(context);
        loginBloc!.addLoginError(errorModel.message);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> adminLogin(
      {required BuildContext context, required String email, required String password}) async {
    var sharedPref;
    Map<String, String>? postheaders = {
      'Accept': 'application/json',
    };
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel(email: email, pass: password);
      final response = await http.post(Uri.parse("https://karnatakaecotourism.com/api/tmngr/token"),
          body: loginRequestModelToJson(loginRequestModel), headers: postheaders);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = loginResponseModelFromJson(response.body);
        sharedPrefs.setUserDetails(
            uuid: loginResponseModel.uuid, userEmail: loginRequestModel.email);
        sharedPrefs.setAuthToken(token: loginResponseModel.token);
        return true;
      } else {
        ErrorModel errorModel = errorModelFromJson(response.body);
        LoginBloc? loginBloc = LoginProvider.of(context);
        loginBloc!.addLoginError(errorModel.message);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> signUp(
      {required BuildContext context, required String email, required String password}) async {
    var sharedPref;
    Map<String, String>? postheaders = {
      'Accept': 'application/json',
    };
    try {
      LoginRequestModel loginRequestModel = LoginRequestModel(email: email, pass: password);
      final response = await API.post(
          url: 'token', body: loginRequestModel.toJson(), context: context, headers: postheaders);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel = loginResponseModelFromJson(response.body);
        sharedPrefs.setUserDetails(
            uuid: loginResponseModel.uuid, userEmail: loginRequestModel.email);
        sharedPrefs.setAuthToken(token: loginResponseModel.token);
        return true;
      } else {
        ErrorModel errorModel = errorModelFromJson(response.body);
        LoginBloc? loginBloc = LoginProvider.of(context);
        loginBloc!.addLoginError(errorModel.message);
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
