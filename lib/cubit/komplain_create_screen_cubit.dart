import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'komplain_create_screen_state.dart';

class KomplainCreateScreenCubit extends Cubit<KomplainCreateScreenState> {
  KomplainCreateScreenCubit() : super(KomplainCreateScreenInitial(fotoListState: []));

  void addPhoto(File fotoFile) {
    final currentFotos = List<File>.from(state.fotoList);

    currentFotos.add(fotoFile);

    emit(KomplainCreateScreenInitial(fotoListState: currentFotos));
  }

  void deleteFoto(int index) {
    final currentFotos = List<File>.from(state.fotoList);

    currentFotos.removeAt(index);

    emit(KomplainCreateScreenInitial(fotoListState: currentFotos));
  }
}
