import 'dart:async';

import 'package:dating_app/blocs/auth/auth_bloc.dart';
import 'package:dating_app/screens/onboarding/onboarding_screen.dart';
import 'package:dating_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              Duration(seconds: 1),
              () => Navigator.of(context).pushNamedAndRemoveUntil(
                  OnboardingScreen.routeName,
                  ModalRoute.withName(OnboardingScreen.routeName)),
            );
          } else if (state.status == AuthStatus.authenticated) {
            Timer(
              Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(
                HomeScreen.routeName,
              ),
            );
          }
        },
        child: Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'KIVILCIM',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
