import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Global');
final GlobalKey<NavigatorState> bottomNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'BottomNavigator');
final GlobalKey<NavigatorState> landingNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'LandingPage');
final GlobalKey<NavigatorState> askNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'AskPage');
final GlobalKey<NavigatorState> savedNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'SavedPage');
final GlobalKey<NavigatorState> profileNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'ProfilePage');
