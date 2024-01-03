class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-credential':
        return const LogInWithEmailAndPasswordFailure('invalid-credential');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure('user-disabled');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure('user-not-found');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure('wrong-password');
      default:
        return const LogInWithEmailAndPasswordFailure(
            'An unknown error occurred');
    }
  }
}
