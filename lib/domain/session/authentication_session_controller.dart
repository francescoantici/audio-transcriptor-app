import 'package:audio_transcriptor_app/domain/session/state/authenticationstate.dart';
import 'package:audio_transcriptor_app/utils/dialog/dialog_manager.dart';
import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationSessionController =
    StateNotifierProvider<AuthenticationSessionController, AuthenticationState>((ref) {
  final dialogMaganer = ref.read(dialogManagerProvider);
  final logger = ref.read(loggerManagerProvider);
  return AuthenticationSessionController(
    logger: logger,
    dialogManager: dialogMaganer,
  );
});

class AuthenticationSessionController extends StateNotifier<AuthenticationState> {
  AuthenticationSessionController({
    required this.logger,
    required this.dialogManager,
  }) : super(AuthenticationState.unknown());

  final LoggerManager logger;
  final DialogManager dialogManager;

  Future<void> login() async {
    state = AuthenticationState.logged();
    return Future.value();
  }

  Future<void> logout() async {
    state = AuthenticationState.unknown();
    return Future.value();
  }
}

extension AuthProviderHelper on WidgetRef {
  AuthenticationSessionController get authController => read(authenticationSessionController.notifier);
  AuthenticationState get watchAuthState => watch(authenticationSessionController);
}
