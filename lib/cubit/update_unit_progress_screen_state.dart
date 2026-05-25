part of 'update_unit_progress_screen_cubit.dart';

sealed class UpdateUnitProgressScreenState extends Equatable {
  const UpdateUnitProgressScreenState({ required this.isAlreadyTakenPhoto, required this.fotoFile });

  final bool isAlreadyTakenPhoto;
  final File fotoFile;

  @override
  List<Object> get props => [
    fotoFile,
    isAlreadyTakenPhoto
  ];
}

final class UpdateUnitProgressScreenInitial extends UpdateUnitProgressScreenState {

  final bool isAlreadyTakenPhotoState;
  final File fotoFileState;

  const UpdateUnitProgressScreenInitial({
    required this.isAlreadyTakenPhotoState,
    required this.fotoFileState
  }) : super(
    fotoFile: fotoFileState,
    isAlreadyTakenPhoto: isAlreadyTakenPhotoState
  );
}
