class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);
  // make the modal disappear in seconds
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('Email already in use');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('invalid-email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('operation not allowed');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('weak password');
      default:
        return const SignUpWithEmailAndPasswordFailure(
            'An unknown error occurred');
    }
  }
}
