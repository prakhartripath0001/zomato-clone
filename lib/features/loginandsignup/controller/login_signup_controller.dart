import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginSignUpControllerProvider = Provider(
  (ref) => LoginSignUpController(),
);

class LoginSignUpController {
  Stream<int> getResendTime() async* {
    for (int i = 5; i >= 0; i--) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  bool get isUserSigned => false;
}
