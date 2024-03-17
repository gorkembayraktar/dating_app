import 'package:dating_app/blocs/auth/auth_bloc.dart';
import 'package:dating_app/blocs/blocs.dart';
import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;
  const EmailVerification({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is! OnboardingLoaded) {
          return const Center(
            child: Text('Bir sorun oluştu.'),
          );
        }

        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  CustomTextHeader(
                    tabController: tabController,
                    text: 'Doğrulama kodunu aldınız mı?',
                  ),
                  CustomTextField(
                    tabController: tabController,
                    text: 'Kodu girin',
                    controller: codeController,
                  )
                ]),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 2,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor:
                          Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      tabController: tabController,
                      text: 'Devam et',
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
