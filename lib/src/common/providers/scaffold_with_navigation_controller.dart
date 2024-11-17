import 'package:flutter/material.dart';

class ScaffoldWithNavigationController extends ChangeNotifier {
  int bottomNavIndex = 0;

  final bottomNavIcons = [
    Icons.home,
    Icons.book,
    Icons.manage_accounts,
    Icons.account_circle_rounded,
  ];
  final bottomNavText = [
    'Home',
    'Bookings',
    'Manage',
    'Profile',
  ];
}
