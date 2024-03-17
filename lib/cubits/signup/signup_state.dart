part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;
  final auth.User? user;

  const SignupState(
      {required this.email,
      required this.password,
      required this.status,
      this.user});

  factory SignupState.initial() {
    return SignupState(
        email: '', password: '', status: SignupStatus.initial, user: null);
  }

  SignupState copyWith(
      {String? email,
      String? password,
      SignupStatus? status,
      auth.User? user}) {
    return SignupState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object?> get props => [email, password, status, user];
}
