part of 'komplain_create_screen_cubit.dart';

sealed class KomplainCreateScreenState extends Equatable {
  const KomplainCreateScreenState({
    required this.fotoList
  });

  final List<File> fotoList;

  @override
  List<Object> get props => [
    fotoList
  ];
}

final class KomplainCreateScreenInitial extends KomplainCreateScreenState {

  final List<File> fotoListState;

  const KomplainCreateScreenInitial({
    required this.fotoListState
  }) : super(fotoList: fotoListState);
}
