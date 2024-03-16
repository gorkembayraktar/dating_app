import 'package:dating_app/cubits/signup/signup_cubit.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(builder: (context, state) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomTextHeader(
                  tabController: tabController,
                  text: 'Email Adresiniz Nedir?',
                ),
                CustomTextField(
                  tabController: tabController,
                  text: 'Email adresinizi girin',
                  onChanged: (value){
                    context.read<SignupCubit>().emailChanged(value);
                    print(state.email);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextHeader(
                  tabController: tabController,
                  text: 'Şifre Seçin',
                ),
                CustomTextField(
                  tabController: tabController,
                  text: 'Şifre girin',
                  onChanged: (value) {
                    context.read<SignupCubit>().passwordChanged(value);
                    print(state.password);
                  },
                )
              ]),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 1,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).scaffoldBackgroundColor,
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
    });
  }
}
