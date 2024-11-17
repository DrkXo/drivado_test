import 'package:collection/collection.dart';
import 'package:drivado_test/src/common/providers/scaffold_with_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ScaffoldWithNavigation extends StatefulWidget {
  const ScaffoldWithNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavigation> createState() => _ScaffoldWithNavigationState();
}

class _ScaffoldWithNavigationState extends State<ScaffoldWithNavigation> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ScaffoldWithNavigationController>();
    return Scaffold(
      body: widget.navigationShell,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...controller.bottomNavIcons
                .mapIndexed((idx, ico) => MaterialButton(
                      textColor: widget.navigationShell.currentIndex == idx
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                      onPressed: () {
                        widget.navigationShell.goBranch(
                          idx,
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            controller.bottomNavIcons[idx],
                          ),
                          Text(
                            controller.bottomNavText[idx],
                          ),
                        ],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
