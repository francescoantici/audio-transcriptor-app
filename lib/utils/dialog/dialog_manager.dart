import 'package:audio_transcriptor_app/utils/dialog/dialog_component.dart';
import 'package:audio_transcriptor_app/utils/router/showcase_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dialogManagerProvider = Provider<DialogManager>((ref) {
  return DialogManager(navigatorKey: ref.watch(navigatorKeyProvider));
});

class DialogManager {
  DialogManager({required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  Future<T?> showSuccessDialog<T>({
    required String text,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return Future.value();
    return showDialog(
      context: context,
      builder: (context) => CustomBaseDialog(
        title: 'Operazione completata',
        content: text,
      ),
    );
  }

  Future<T?> showWarningDialog<T>({
    required String text,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return Future.value();
    return showDialog(
      context: context,
      builder: (context) => CustomBaseDialog(
        title: 'Attenzione',
        content: text,
      ),
    );
  }
}

mixin DialogManagerProvider {
  DialogManager getDialogManager(WidgetRef ref) => ref.read(dialogManagerProvider);
}
