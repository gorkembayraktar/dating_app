import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Demo extends StatelessWidget {
  final TabController tabController;
  const Demo({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {

    final ageController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(tabController: tabController, text: 'Cinsiyetiniz Nedir?',),
              SizedBox(height: 10,),
              CustomCheckBox(tabController: tabController, text: 'Erkek'),
              CustomCheckBox(tabController: tabController, text: 'Kadın'),
              SizedBox(height: 50,),
              CustomTextHeader(tabController: tabController, text: 'Yaşınız Nedir?'),
              CustomTextField(tabController: tabController, text: 'Yaşınızı girin', controller: ageController,)
            ]
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 3,
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
