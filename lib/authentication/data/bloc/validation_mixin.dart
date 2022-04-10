import 'dart:async';

class ValidationMixin {
  final validatorEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError('Enter valid Email');
    }
  });
  final validatorEmailTyping =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains(" ")) {
      sink.addError('Enter valid Email');
    } else {
      sink.add(email);
    }
  });
  final validatorPassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (password, sink1) {
    if (password.isEmpty) {
      sink1.addError('Please Enter Valid password');
    } else {
      sink1.add(password);
    }
  });
}
