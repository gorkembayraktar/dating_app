import 'package:dating_app/blocs/onboarding/onboarding_bloc.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;
  const Demo({super.key, required this.tabController});

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
            child: Text('hata!'),
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
                    text: 'Cinsiyetiniz Nedir?',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomCheckBox(
                    text: 'Erkek',
                    value: state.user.gender == 'Erkek',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(gender: 'Erkek')));
                    },
                  ),
                  CustomCheckBox(
                    text: 'Kadın',
                    value: state.user.gender == 'Kadın',
                    onChanged: (bool? newValue) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(gender: 'Kadın')));
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextHeader(
                      tabController: tabController, text: 'Yaşınız Nedir?'),
                  CustomTextField(
                    text: 'Yaşınızı girin',
                    onChanged: (String? value) {
                      context.read<OnboardingBloc>().add(UpdateUser(
                          user: state.user.copyWith(
                              age: value != null && value.isNotEmpty
                                  ? int.parse(value)
                                  : 0)));
                    },
                  )
                ]),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 3,
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
