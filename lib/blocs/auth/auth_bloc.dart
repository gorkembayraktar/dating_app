import 'dart:async';

import 'package:dating_app/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/repositories/auth_repository.dart';


part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _userSubscription;

  AuthBloc({required AuthRepository authRepository}) :
        _authRepository = authRepository,
        super(AuthState.unknown()) {
    //on<LoadUsersEvent>((event, emit) => emit(SwipeLoaded(users: event.users)));
    on<AuthUserChanged>((event, emit){
      emit(AuthState.authenticated(user: event.user));
    });

    _userSubscription = authRepository.user.listen((user) {
        add(AuthUserChanged(user: user!));
    });
  }

  @override
  Future<void> close(){
    _userSubscription?.cancel();
    return super.close();
  }
}