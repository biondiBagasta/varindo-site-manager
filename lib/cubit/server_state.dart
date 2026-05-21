part of 'server_cubit.dart';

sealed class ServerState extends Equatable {
  const ServerState({ required this.serverIndex, required this.baseUrlCore, required this.baseUrlCoreMPN, required this.baseUrlAuth, required this.baseUrlV8,
  required this.baseUrlSocket, required this.baseUrlFile, required this.baseUrlCustomBiller, required this.baseUrlDynamicBiller });

  final int serverIndex;
  final String baseUrlCore;
  final String baseUrlCoreMPN;
  final String baseUrlAuth;
  final String baseUrlV8;
  final String baseUrlSocket;
  final String baseUrlFile;
  final String baseUrlCustomBiller;
  final String baseUrlDynamicBiller;

  @override
  List<Object> get props => [
    serverIndex,
    baseUrlCore,
    baseUrlCoreMPN,
    baseUrlAuth,
    baseUrlV8,
    baseUrlSocket,
    baseUrlFile,
    baseUrlCustomBiller,
    baseUrlDynamicBiller
  ];
}

final class ServerInitial extends ServerState {

  final int serverIndexState;
  final String baseUrlCoreState;
  final String baseUrlCoreMPNState;
  final String baseUrlAuthState;
  final String baseUrlV8State;
  final String baseUrlSocketState;
  final String baseUrlFileState;
  final String baseUrlCustomBillerState;
  final String baseUrlDynamicBillerState;

  const ServerInitial({ 
    required this.serverIndexState,
    required this.baseUrlCoreState,
    required this.baseUrlCoreMPNState,
    required this.baseUrlAuthState,
    required this.baseUrlV8State,
    required this.baseUrlSocketState,
    required this.baseUrlFileState,
    required this.baseUrlCustomBillerState,
    required this.baseUrlDynamicBillerState 
  }) : super(
    serverIndex: serverIndexState,
    baseUrlCore: baseUrlCoreState,
    baseUrlCoreMPN: baseUrlCoreMPNState,
    baseUrlAuth: baseUrlAuthState,
    baseUrlV8: baseUrlV8State,
    baseUrlSocket: baseUrlSocketState,
    baseUrlFile: baseUrlFileState,
    baseUrlCustomBiller: baseUrlCustomBillerState,
    baseUrlDynamicBiller: baseUrlDynamicBillerState
  );
}
