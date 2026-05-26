import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unit_serah_terima_screen_state.dart';

class UnitSerahTerimaScreenCubit extends Cubit<UnitSerahTerimaScreenState> {
  UnitSerahTerimaScreenCubit() : super(UnitSerahTerimaScreenInitial(fotoListState: []));

  void addPhoto(File fotoFile) {
    final currentFotos = List<File>.from(state.fotoList);

    currentFotos.add(fotoFile);

    emit(UnitSerahTerimaScreenInitial(fotoListState: currentFotos));
  }

  void deleteFoto(int index) {
    final currentFotos = List<File>.from(state.fotoList);

    currentFotos.removeAt(index);

    emit(UnitSerahTerimaScreenInitial(fotoListState: currentFotos));
  }
}
