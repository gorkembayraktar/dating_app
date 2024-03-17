import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:dating_app/repositories/database/database_repository.dart';
import 'package:dating_app/repositories/storage/storage_repository.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/bio_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/demo_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/email_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/email_verification_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/location_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/pictures_screen.dart';
import 'package:dating_app/screens/onboarding/onboarding_screens/start_screen.dart';
import 'package:dating_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => OnboardingScreen());
  }

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Başla'),
    Tab(text: 'Email'),
    Tab(text: 'Email Verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Bio'),
    Tab(text: 'Location')
  ];

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context)!;

            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: const CustomAppBar(
                title: 'KIVILCIM',
                hasActions: false,
              ),
              body: TabBarView(
                children: [
                  Start(tabController: tabController),
                  Email(tabController: tabController),
                  EmailVerification(tabController: tabController),
                  Demo(tabController: tabController),
                  Pictures(tabController: tabController),
                  Biography(tabController: tabController),
                  Location(tabController: tabController)
                ],
              ),
            );
          },
        ));
  }
}
