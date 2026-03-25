import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/Core/Const/App_Color.dart';
import 'package:my_app/feature/auth/view/loginScreen.dart';
import 'package:my_app/feature/auth/widgets/custom_button.dart';
import 'package:my_app/feature/auth/widgets/custom_text.dart';
import 'package:my_app/feature/auth/widgets/onboarding_data.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final int totalPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: totalPages,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return OnboardingData(
                        nameImage: "Images/splasmImage.png",

                        text: "Welcome to App",
                        textAlignname:
                            "Lorem ipsum dolor elit elit elit Volupta \nconsectetur adipisicing ",
                      );
                    } else if (index == 1) {
                      return OnboardingData(
                        nameImage: "Images/splasmImage.png",
                        text: "Easy APP ",
                        textAlignname:
                            "Lorem ipsum dolor elit elit elit Volupta \nconsectetur adipisicing ",
                      );
                    } else {
                      return OnboardingData(
                        nameImage: "Images/splasmImage.png",
                        text: "Get Started",
                        textAlignname:
                            "Lorem ipsum dolor elit elit elit Volupta \nconsectetur adipisicing ",
                      );
                    }
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(totalPages, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 10,

                    width: currentPage == index ? 30 : 11,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? AppColors.btmcolor
                          : Color(0xffCCD0D1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );
                }),
              ),

              Gap(50),
              CustomButton(
                text: "Get Started",
                onPressed: () {
                  if (currentPage == totalPages - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreen()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              Gap(60),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xffE8ECED)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Loginscreen()),
                );
              },
              child: Text("skip"),
            ),
          ),
        ],
      ),
    );
  }
}
