import 'package:flutter/material.dart';
import 'package:myecotrip/authentication/data/bloc/validation_mixin.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc with ValidationMixin {
  final _name = BehaviorSubject<String>();
  final _mobile = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _signupError = BehaviorSubject<String>();

  //gettters
   Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeMobile => _mobile.sink.add;

  addLoginError(String error) {
    _signupError.sink.add(error);
  }

  //streams
  Stream<String> get email => _email.stream.transform(validatorEmailTyping);
  Stream<String> get password => _password.stream.transform(validatorPassword);
  Stream<String> get name => _name.stream.transform(validatorPassword);
  Stream<String> get mobile => _mobile.stream.transform(validatorPassword);
  Stream<String> get signupError => _signupError.stream;


  Stream<bool> get submitValidForm => Rx.combineLatest2(email, password, (e, n) => true);
  Stream<List<String>> get validateForm1Stream => Rx.combineLatestList(
        [
          name,
          mobile,
        ],
      );
       Stream<List<String>> get validateForm2Stream => Rx.combineLatestList(
        [
          email,
          password,
        ],
      );

  dispose() {
    _name.close();
    _mobile.close();
    _email.close();
    _password.close();
  }
}

class SignUpProvider extends InheritedWidget {
  final bloc = SignUpBloc();
  SignUpProvider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static SignUpBloc? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SignUpProvider>())!.bloc;
  }
}
