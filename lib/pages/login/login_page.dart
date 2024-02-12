import 'package:audio_transcriptor_app/domain/session/authentication_session_controller.dart';
import 'package:audio_transcriptor_app/utils/ui_utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget with UiDimension {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox.expand(
        child: Align(
          child: Padding(
            padding: mediumPadding,
            child: ElevatedButton(
              onPressed: () => ref.authController.login(),
              child: const Text('Login'),
            ),
          ),
        ),
      ),
    );
  }
}
