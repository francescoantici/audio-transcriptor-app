import 'dart:ui';

import 'package:audio_transcriptor_app/utils/ui_utils/responsive_layout.dart';
import 'package:flutter/material.dart';

class CustomScrollConfiguration extends StatelessWidget {
  const CustomScrollConfiguration({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
        scrollbars: MediaQuery.of(context).onLayout(defaultValue: false, onDesktop: true),
      ),
      child: child,
    );
  }
}
