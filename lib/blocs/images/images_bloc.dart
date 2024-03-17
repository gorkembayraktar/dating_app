import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/repositories/database/database_repository.dart';

part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  final DatabaseRepository _databaseRepository;
  StreamSubscription? _databaseSubscription;

  ImagesBloc({required DatabaseRepository databaseRepository})
      : _databaseRepository = databaseRepository,
        super(ImagesLoading()) {
    on<LoadImages>((event, emit) async {
      _databaseSubscription?.cancel();
      /*
        _databaseRepository.getUser().listen((user){
          print(user);
          add(UpdateImages(user.imageUrls));
        });
        */
    });

    on<UpdateImages>((event, emit) {
      emit(ImagesLoaded(imageUrls: event.imageUrls));
    });
  }

  @override
  Future<void> close() {
    _databaseSubscription?.cancel();
    return super.close();
  }
}
