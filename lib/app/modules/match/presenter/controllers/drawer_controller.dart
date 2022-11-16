import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tinpet/app/shared/routes/app_routes.dart';

class MyDrawerController {
  MyDrawerController() {
    _init();
  }

  late final SharedPreferences _sharedPreferences;
  SharedPreferences get sharedPrefe => _sharedPreferences;

  String _currentRoute = '/match';

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Map<String, String>? getUser() {
    final user = _sharedPreferences.getStringList('user');

    if (user == null) {
      return null;
    }

    return {
      'id': user[0],
      'email': user[1],
      'name': user[2],
      'photo': user[3],
    };
  }

  void onPressedMatch(BuildContext context) {
    if (_currentRoute == AppRoutes.MATCH) {
      return Navigator.pop(context);
    } else {
      _navToMatch(context);
      _currentRoute = AppRoutes.MATCH;
    }
  }

  void onPressedSoulMate(BuildContext context) {
    if (_currentRoute == AppRoutes.SOULMATE) {
      return Navigator.pop(context);
    } else {
      _navToSoulMate(context);
      _currentRoute = AppRoutes.SOULMATE;
    }
  }

  void onPressedHowAboutThisPet(BuildContext context) {
    if (_currentRoute == AppRoutes.HOW_ABOUT_THIS_PET) {
      return Navigator.pop(context);
    } else {
      _navToHowAboutThisPet(context);
      _currentRoute = AppRoutes.HOW_ABOUT_THIS_PET;
    }
  }

  Future<void> _navToMatch(BuildContext context) async {
    return await Navigator.pushReplacementNamed<void, void>(
      context,
      AppRoutes.MATCH,
    );
  }

  Future<void> _navToSoulMate(BuildContext context) async {
    return await Navigator.pushReplacementNamed<void, void>(
      context,
      AppRoutes.SOULMATE,
    );
  }

  Future<void> _navToHowAboutThisPet(BuildContext context) async {
    return await Navigator.pushReplacementNamed<void, void>(
      context,
      AppRoutes.HOW_ABOUT_THIS_PET,
    );
  }
}
