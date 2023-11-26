import 'dart:developer';

class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    log("code $code");
    switch (code) {
      case 'invalid-credential':
        return LogInWithEmailAndPasswordFailure('invalid-credential');
      default:
        return LogInWithEmailAndPasswordFailure();
    }
  }
}
