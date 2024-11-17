import 'package:drivado_test/src/common/widgets/scaffold_with_navigation.dart';
import 'package:drivado_test/src/features/manage/domain/model/sub_company/company_model.dart';
import 'package:drivado_test/src/features/manage/domain/model/users/user_model.dart';
import 'package:drivado_test/src/features/manage/presentation/screens/company_details.dart';
import 'package:drivado_test/src/features/manage/presentation/screens/manage_screen.dart';
import 'package:drivado_test/src/features/manage/presentation/screens/user_details_screen.dart';
import 'package:drivado_test/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterService with ChangeNotifier {
  late final GoRouter _router;

  // private navigators
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');

  GoRouter get router => _router;

  RouterService() {
    _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.manage.path,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          builder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return ScaffoldWithNavigation(
              navigationShell: navigationShell,
            );
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAKey,
              routes: [
                GoRoute(
                  path: Routes.manage.path,
                  name: Routes.manage.name,
                  builder: (context, state) => const ManageScreen(),
                ),
                GoRoute(
                  path: Routes.user.path,
                  name: Routes.user.name,
                  builder: (context, state) => UserDetailsScreen(
                    user: state.extra as UserModel,
                  ),
                ),
                GoRoute(
                  path: Routes.company.path,
                  name: Routes.company.name,
                  builder: (context, state) => CompanyDetailsScreen(
                    company: state.extra as CompanyModel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
