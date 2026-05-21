import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:varindo_estate_management/utils/utils.dart';

part 'server_state.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(ServerInitial(
      serverIndexState: 0,
      baseUrlCoreState: "${serverList[0]}$urlCore",
      baseUrlCoreMPNState: "${serverList[0]}$urlCoreMPN",
      baseUrlAuthState: "${serverList[0]}$urlAuth",
      baseUrlV8State: "${serverList[0]}$urlV8",
      baseUrlSocketState: "${serverList[0]}$urlSocket",
      baseUrlFileState: "${serverList[0]}$urlFile",
      baseUrlCustomBillerState: "${serverList[0]}$urlCustomBiller",
      baseUrlDynamicBillerState: "${serverList[0]}$urlDynamicBiller"
    )
  );

  void updateState(int index) {
    emit(
      ServerInitial(
        serverIndexState: index,
        baseUrlCoreState: "${serverList[index]}$urlCore",
        baseUrlCoreMPNState: "${serverList[index]}$urlCoreMPN}",
        baseUrlAuthState: "${serverList[index]}$urlAuth",
        baseUrlV8State: "${serverList[index]}$urlV8",
        baseUrlSocketState: "${serverList[index]}$urlSocket",
        baseUrlFileState: "${serverList[index]}$urlFile",
        baseUrlCustomBillerState: "${serverList[index]}$urlCustomBiller",
        baseUrlDynamicBillerState: "${serverList[index]}$urlDynamicBiller"
      )
    );
  }
}
