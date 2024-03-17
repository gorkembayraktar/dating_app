part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnboarding extends OnboardingEvent {}

class UpdateUser extends OnboardingEvent {
  final User user;

  UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class UpdateUserImages extends OnboardingEvent {
  final User? user;
  final XFile image;
  const UpdateUserImages({required this.image, this.user});

  @override
  List<Object?> get props => [user, image];
}
