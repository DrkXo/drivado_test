import 'package:drivado_test/src/router/router.dart';
import 'package:drivado_test/src/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Drivado extends StatelessWidget {
  const Drivado({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Drivado',
      theme: ThemeData.light().copyWith(
        primaryColor: DrivadoTheme.primary,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: DrivadoTheme.primary,
        ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          color: DrivadoTheme.appbarBackground,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      routerConfig: context.watch<RouterService>().router,
    );
  }
}
