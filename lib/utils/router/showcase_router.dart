import 'package:audio_transcriptor_app/utils/logger/logger_manager.dart';
import 'package:audio_transcriptor_app/utils/router/router_notifier.dart';
import 'package:audio_transcriptor_app/utils/router/routes/dashboard_route.dart';
import 'package:audio_transcriptor_app/utils/router/routes/login_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

final scaffoldMessangerKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final key = ref.watch(navigatorKeyProvider);
  final notifier = ref.watch(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: key,
    redirect: notifier.redirect,
    refreshListenable: notifier,
    observers: [
      LoggerNavigatorObserver(
        logger: ref.read(loggerManagerProvider),
      ),
    ],
    routes: [
      DashboardPageRoute(),
      LoginPageRoute(),
    ],
  );
});

class LoggerNavigatorObserver extends NavigatorObserver {
  LoggerNavigatorObserver({required this.logger});

  final LoggerManager logger;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.logMessage('Route pushed: ${route.settings.name}');
    super.didPush(route, previousRoute);
  }
}
