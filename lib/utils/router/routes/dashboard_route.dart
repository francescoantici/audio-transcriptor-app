import 'package:audio_transcriptor_app/pages/dashboard/dashboard_page.dart';
import 'package:go_router/go_router.dart';

class DashboardPageRoute extends GoRoute {
  DashboardPageRoute()
      : super(
          path: pagePath,
          builder: (context, state) => const DashboardPage(),
        );
  static String pagePath = '/';
}
