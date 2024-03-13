import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_image_container.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Pictures extends StatelessWidget {
  final TabController tabController;
  const Pictures({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CustomTextHeader(tabController: tabController, text: '2 veya Daha Fazla Resim Ekleyiniz'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                ),
                Row(
                  children: [
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                    CustomImageContainer(tabController: tabController),
                  ],
                )
            ]
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 4,
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
