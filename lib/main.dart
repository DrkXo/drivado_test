import 'package:drivado_test/src/common/providers/scaffold_with_navigation_controller.dart';
import 'package:drivado_test/src/drivado.dart';
import 'package:drivado_test/src/features/manage/data/company_repository.dart';
import 'package:drivado_test/src/features/manage/data/users_repository.dart';
import 'package:drivado_test/src/features/manage/presentation/controller/manage_screen_controller.dart';
import 'package:drivado_test/src/router/router.dart';
import 'package:drivado_test/src/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RouterService(),
        ),
        Provider<DioService>(
          create: (context) => DioService(),
        ),
        ChangeNotifierProvider<ScaffoldWithNavigationController>(
          create: (context) => ScaffoldWithNavigationController(),
        ),
        ChangeNotifierProvider<ManageScreenController>(
          create: (context) => ManageScreenController(),
        ),
        ChangeNotifierProxyProvider0<UsersRepository>(
          create: (context) => UsersRepository(
            dioService: context.read<DioService>(),
          ),
          update: (BuildContext context, value) {
            return value!
              ..updateDependency(
                dioService: context.read<DioService>(),
              );
          },
        ),
        ChangeNotifierProxyProvider0<CompanyRepository>(
          create: (context) => CompanyRepository(
            dioService: context.read<DioService>(),
          ),
          update: (BuildContext context, value) {
            return value!
              ..updateDependency(
                dioService: context.read<DioService>(),
              );
          },
        ),
      ],
      child: const Drivado(),
    ),
  );
}
