part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class StartOnboarding extends OnboardingEvent {
  final User user;

  StartOnboarding({
    User? user,
  }) : user = user ??
            User(
              id: '',
              name: '',
              age: 0,
              gender: '',
              interests: [],
              imageUrls: [],
              jobTitle: '',
              location: '',
              bio: '',
            );

  @override
  List<Object?> get props => [user];
}

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
