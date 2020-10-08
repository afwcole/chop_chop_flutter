import 'package:chop_chop_flutter/screens/access/signup/enter_phone_number.dart';
import 'package:chop_chop_flutter/screens/shared/call_to_action_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController(
    initialPage: 0,
  );

  int currentIndex = 0;
  List<String> onboardingText = [
    "Order your favourite food and drinks to your room",
    "Wide variety of restaurants on campus to choose from",
    "Most convenient and easy way to enjoy your food"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              onPageChanged: (page) {
                setState(() => currentIndex = page);
              },
              controller: _pageController,
              children: <Widget>[
                Container(
                  color: Color(0xFFFAFAFA),
                ),
                Container(
                  color: Color(0xFFFAFAFA),
                ),
                Container(
                  color: Color(0xFFFAFAFA),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.asset(
                  'images/Logo.png',
                  height: 76,
                  width: 76,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      onboardingText[currentIndex],
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 3,
                      effect: ScaleEffect(
                        activeDotColor: Color(0xFFFFBB00),
                        dotColor: Color(0xFFFFBB00),
                        dotHeight: 8,
                        dotWidth: 8,
                        scale: 1.75,
                        spacing: 16,
                      ),
                    ),
                    SizedBox(height: 32),
                    CallToActionButton(
                      buttonText: "Create an Account",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnterNumberPage()));
                      },
                    ),
                    SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        print("You just tapped to sign in");
                      },
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}