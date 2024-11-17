import 'package:drivado_test/src/theme/themes.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.bottomWidget,
    bool? reverse,
  }) : reverse = reverse ?? false;

  final bool reverse;
  final List<Widget>? actions;
  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    switch (reverse) {
      case true:
        return AppBar(
          toolbarHeight: preferredSize.height,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Test Drivado",
                        style: TextStyle(
                          fontSize: DrivadoTheme.appbarTextSize,
                          color: DrivadoTheme.appbarForegroundColor,
                        ),
                      ),
                      Text(
                        "test@drivado",
                        style: TextStyle(
                          fontSize: DrivadoTheme.appbarTextSize,
                          color: DrivadoTheme.appbarForegroundColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(),
                ],
              ),
            ),
          ),
        );
      case false:
        return AppBar(
          toolbarHeight: preferredSize.height,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Test Drivado",
                        style: TextStyle(
                          fontSize: DrivadoTheme.appbarTextSize,
                          color: DrivadoTheme.appbarForegroundColor,
                        ),
                      ),
                      Text(
                        "test@drivado",
                        style: TextStyle(
                          fontSize: DrivadoTheme.appbarTextSize,
                          color: DrivadoTheme.appbarForegroundColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: actions ?? [],
        );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 30);
}
