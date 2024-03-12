
import 'package:dating_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState>{
  SwipeBloc() : super(SwipeLoading()) {
    on<LoadUsersEvent>((event, emit) => emit(SwipeLoaded(users: event.users)));
    on<SwipeLeftEvent>((event, emit) {
      print('SwipeLeftEvent');
      if (state is SwipeLoaded) {
        try{
          final users = (state as SwipeLoaded).users;
          emit(SwipeLoaded(users: List.from(users)..remove(event.user)));
        }catch(_){

        }

      }
    });
    on<SwipeRightEvent>((event, emit) {
      print('SwipeRightEvent');
      if (state is SwipeLoaded) {
        try{
          final users = (state as SwipeLoaded).users;
          emit(SwipeLoaded(users: List.from(users)..remove(event.user)));
        }catch(_){

        }

      }
    });

  }
}