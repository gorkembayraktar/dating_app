import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/models/models.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:dating_app/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final DatabaseRepository _databaseRepository;
  final StorageRepository _storageRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  OnboardingBloc(
      {required DatabaseRepository databaseRepository,
      required StorageRepository storageRepository})
      : _databaseRepository = databaseRepository,
        _storageRepository = storageRepository,
        super(OnboardingLoading()) {
    on<StartOnboarding>((event, emit) async {
      await _databaseRepository.createUser(event.user!);

      emit(OnboardingLoaded(user: event.user!));
    });

    on<UpdateUser>((event, emit) {
      if (state is OnboardingLoaded) {
        _databaseRepository.UpdateUser(event.user);
        emit(OnboardingLoaded(user: event.user));
      }
    });

    on<UpdateUserImages>((event, emit) async {
      if (state is OnboardingLoaded) {
        User user = (state as OnboardingLoaded).user;

        print('on<UpdateUserImages>');
        await _storageRepository.uploadImage(user, event.image);
        print('on<UpdateUserImages>2');
        print(user.id!);

        _databaseRepository.getUser(user.id!).listen((user) {
          add(UpdateUser(user: user));
        });
      }
    });
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
