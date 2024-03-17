import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/widgets/custom_text_container.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Location extends StatelessWidget {
  final TabController tabController;
  const Location({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
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
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  CustomTextHeader(
                    tabController: tabController,
                    text: 'Neredesin?',
                  ),
                  CustomTextField(
                    text: 'Lokasyon bilginiz',
                    onChanged: (value) {
                      context.read<OnboardingBloc>().add(
                            UpdateUser(
                              user: state.user.copyWith(location: value),
                            ),
                          );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ]),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 6,
                      selectedColor: Theme.of(context).primaryColor,
                      unselectedColor:
                          Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      tabController: tabController,
                      text: 'Bitir',
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
