import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_unit_progress_screen_state.dart';

class UpdateUnitProgressScreenCubit extends Cubit<UpdateUnitProgressScreenState> {
  UpdateUnitProgressScreenCubit() : super(UpdateUnitProgressScreenInitial(isAlreadyTakenPhotoState: false, fotoFileState: File("")));

  updateState(bool isAlreadyTakenPhoto, File fileFoto) {
    emit(UpdateUnitProgressScreenInitial(isAlreadyTakenPhotoState: isAlreadyTakenPhoto, fotoFileState: fileFoto));
  }
}
