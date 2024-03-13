import 'package:dating_app/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_container.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Biography extends StatelessWidget {
  final TabController tabController;
  const Biography({super.key, required this.tabController});

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
              CustomTextHeader(tabController: tabController, text: 'Kısaca Kendinden Bahset',),
              CustomTextField(tabController: tabController, text: 'Biyografi'),
              SizedBox(height: 100,),
              CustomTextHeader(tabController: tabController, text: 'Nelerden Hoşlanırsın?',),
              Row(
                children: [
                  CustomTextContainer(tabController: tabController, text: 'Müzik'),
                  CustomTextContainer(tabController: tabController, text: 'Ekonomi'),
                  CustomTextContainer(tabController: tabController, text: 'Sanat'),
                  CustomTextContainer(tabController: tabController, text: 'Siyaset')
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(tabController: tabController, text: 'Doğa'),
                  CustomTextContainer(tabController: tabController, text: 'Doğa Yürüyüşü'),
                  CustomTextContainer(tabController: tabController, text: 'Futbol'),
                  CustomTextContainer(tabController: tabController, text: 'Film')
                ],
              )
            ]
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 5,
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
