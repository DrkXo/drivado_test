import 'package:flutter/material.dart';

class ScaffoldWithNavigationController extends ChangeNotifier {
  int bottomNavIndex = 0;

  final bottomNavIcons = [
    Icons.home_outlined,
    Icons.book_outlined,
    Icons.manage_accounts_outlined,
    Icons.account_circle_outlined,
  ];
  final bottomNavText = [
    'Home',
    'Bookings',
    'Manage',
    'Profile',
  ];
}
