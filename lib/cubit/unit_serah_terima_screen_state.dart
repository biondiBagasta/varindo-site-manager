part of 'unit_serah_terima_screen_cubit.dart';

sealed class UnitSerahTerimaScreenState extends Equatable {
  const UnitSerahTerimaScreenState({
    required this.fotoList
  });

  final List<File> fotoList;

  @override
  List<Object> get props => [
    fotoList
  ];
}

final class UnitSerahTerimaScreenInitial extends UnitSerahTerimaScreenState {

  final List<File> fotoListState;

  const UnitSerahTerimaScreenInitial({ required this.fotoListState }) :
  super(fotoList: fotoListState);
}
