import 'package:audio_transcriptor_app/pages/login/login_page.dart';
import 'package:go_router/go_router.dart';

class LoginPageRoute extends GoRoute {
  LoginPageRoute()
      : super(
          path: pagePath,
          builder: (context, state) => const LoginPage(),
        );

  static String pagePath = '/login';
}
