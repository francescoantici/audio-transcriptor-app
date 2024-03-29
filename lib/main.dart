import 'package:audio_transcriptor_app/utils/router/showcase_router.dart';
import 'package:audio_transcriptor_app/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SemanticsBinding.instance.ensureSemantics();
  runApp(
    const ProviderScope(
      child: AudioTranscriptorApp(),
    ),
  );
}

class AudioTranscriptorApp extends ConsumerWidget {
  const AudioTranscriptorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final scaffoldKey = ref.watch(scaffoldMessangerKeyProvider);
    final appTheme = ref.watch(appThemeProvider);
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldKey,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('it'), // Italian
      ],
    );
  }
}
