class SignupWithEmailAndPaawordFailure {
  final String message;

  const SignupWithEmailAndPaawordFailure(
      [this.message = "An error has occurred, try again later."]);

  factory SignupWithEmailAndPaawordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignupWithEmailAndPaawordFailure(
            'Please enter a strong password');
      case 'invalid-email':
        return const SignupWithEmailAndPaawordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignupWithEmailAndPaawordFailure(
            'An account already exists for that email');
      case 'operation-not-allowed':
        return const SignupWithEmailAndPaawordFailure(
            'Operation is not allowed please contact support');
      case 'user-disabled':
        return const SignupWithEmailAndPaawordFailure(
            'This user has been disabled. Please contact support for help');
      default:
        return const SignupWithEmailAndPaawordFailure();
    }
  }
}
