import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imiu_mobile/models/welcome.dart';
import 'package:imiu_mobile/routes/app_pages.dart';
import 'package:imiu_mobile/ultis/colors.dart';
import 'package:imiu_mobile/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor.withOpacity(0.1),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Container(
              color: primaryColor.withOpacity(0.1),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    Image.asset('assets/images/logo-imiu.png'),
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          PageView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            onPageChanged: _onPageChanged,
                            itemCount: welcomeList.length,
                            itemBuilder: (context, i) => slideItem(i),
                          ),
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 100),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    for (int i = 0; i < welcomeList.length; i++)
                                      if (i == _currentPage)
                                        slideDot(true)
                                      else
                                        slideDot(false)
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              text: 'Bắt đầu',
                              onPressed: () {
                                Get.offAllNamed(Routes.register);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]))),
        ));
  }

  Widget slideItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            welcomeList[index].content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
        ),
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(welcomeList[index].image),
            ),
          ),
        ),
      ],
    );
  }

  Widget slideDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
