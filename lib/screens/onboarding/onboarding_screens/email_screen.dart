import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Email extends StatelessWidget {
  final TabController tabController;
  const Email({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomTextHeader(tabController: tabController, text: 'Email Adresiniz Nedir?',),
              CustomTextField(tabController: tabController, text: 'Email adresinizi girin')
            ]
          ),
          Column(
            children: [
                StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 1,
                    selectedColor: Theme.of(context).primaryColor,
                    unselectedColor: Theme.of(context).scaffoldBackgroundColor,
                ),
                SizedBox(height: 10,),
                CustomButton(tabController: tabController, text: 'Devam et',)
            ],
          ),

        ],
      )
    );
  }
}
