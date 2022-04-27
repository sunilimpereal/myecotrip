import 'package:flutter/material.dart';
import 'package:myecotrip/authentication/data/bloc/validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with ValidationMixin {
  final _email = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _loginError = BehaviorSubject<String>();

  //gettters
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changeMobile => _mobile.sink.add;
  Function(String) get changePassword => _password.sink.add;

  addLoginError(String error) {
    _loginError.sink.add(error);
  }

  //streams
  Stream<String> get email => _email.stream.transform(validatorEmailTyping);
  Stream<String> get mobile => _mobile.stream.transform(validatorMobile);
  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<String> get loginError => _loginError.stream;
  Stream<bool> get submitValidForm => Rx.combineLatest2(email, password, (e, n) => true);
  Stream<List<String>> get validateFormStream => Rx.combineLatestList(
        [
          email,
          password,
        ],
      );
  Stream<List<String>> get validateFormAdminStream => Rx.combineLatestList(
        [
          mobile,
          password,
        ],
      );

  dispose() {
    _email.close();
    _password.close();
    _mobile.close();
  }
}

class LoginProvider extends InheritedWidget {
  final bloc = LoginBloc();
  LoginProvider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginProvider>())!.bloc;
  }
}
