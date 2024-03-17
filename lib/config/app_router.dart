import 'package:dating_app/models/models.dart';
import 'package:dating_app/screens/matches/matches_screen.dart';
import 'package:flutter/material.dart';
import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    print(settings);
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);

      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      case ProfileScreen.routeName:
        return ProfileScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: Text('error'))),
      settings: RouteSettings(name: '/error'),
    );
  }
}
