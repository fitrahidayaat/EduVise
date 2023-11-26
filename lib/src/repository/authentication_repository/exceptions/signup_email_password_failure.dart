class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);
  // make the modal disappear in seconds
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case '':
        return SignUpWithEmailAndPasswordFailure('');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
