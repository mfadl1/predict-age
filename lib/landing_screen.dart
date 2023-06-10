import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:predict_age_client/components/outline_button.dart';

import 'router/app_route_constant.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff39B68C),
              Color(0xff00726D),
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/landing_page_photo.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find My Age',
                      style: ElevarmFontFamilies.poppins(
                          color: Colors.white,
                          fontSize: ElevarmFontSizes.xl5,
                          fontWeight: ElevarmFontWeights.semibold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 285,
                      child: Text(
                        "Predict a person's age based on their photo. This app support a wide range of ages and can be used without an internet!!",
                        style: ElevarmFontFamilies.inter(
                            color: Colors.white,
                            fontWeight: ElevarmFontWeights.medium),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppOutlineButton.text(
                        borderColor: Colors.white,
                        backgroundColor: Colors.white,
                        height: ElevarmButtonHeights.lg,
                        textColor: const Color(0xff00726D),
                        text: 'Choose a Photo',
                        onPressed: () {
                          context.pushNamed(AppRoute.predictScreen.name);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppOutlineButton.text(
                        borderColor: Colors.white,
                        backgroundColor: const Color(0xff00726D),
                        height: ElevarmButtonHeights.lg,
                        text: 'Take a Photo',
                        onPressed: () {
                          context.pushNamed(AppRoute.predictScreen.name);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
