import 'dart:io';

import 'package:elevarm_ui/elevarm_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'components/outline_button.dart';

class PredictScreen extends StatefulWidget {
  final XFile uploadImage;

  const PredictScreen({super.key, required this.uploadImage});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  bool isPredict = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(children: [
          Image.file(
            File(widget.uploadImage.path),
            height: 5 / 8 * MediaQuery.of(context).size.height,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Column(
                children: [
                  if (!isPredict)
                    Text(
                      'Predict your age based on your photo!',
                      textAlign: TextAlign.center,
                      style: ElevarmFontFamilies.poppins(
                        fontSize: ElevarmFontSizes.xl2,
                        fontWeight: ElevarmFontWeights.semibold,
                      ),
                    )
                  else ...[
                    Text(
                      'Your estimated age is\n18 - 25',
                      textAlign: TextAlign.center,
                      style: ElevarmFontFamilies.poppins(
                        fontSize: ElevarmFontSizes.xl2,
                        fontWeight: ElevarmFontWeights.semibold,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const ElevarmDivider(
                      thickness: 1,
                      color: ElevarmColors.neutral100,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'This prediction is based on the VGG16 pretrained model which has been fine tuned with the Adience dataset',
                      textAlign: TextAlign.center,
                      style: ElevarmFontFamilies.inter(
                        color: ElevarmColors.neutral400,
                        fontSize: ElevarmFontSizes.xs,
                        fontWeight: ElevarmFontWeights.medium,
                      ),
                    ),
                  ],
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      child: isPredict
                          ? AppOutlineButton.text(
                              borderColor: const Color.fromRGBO(0, 114, 109, 0.4),
                              backgroundColor:
                                  const Color.fromRGBO(0, 114, 109, 0.4),
                              height: ElevarmButtonHeights.lg,
                              textColor: Colors.white,
                              text: 'Predict the Age',
                            )
                          : AppOutlineButton.text(
                              borderColor: const Color(0xff00726D),
                              backgroundColor: const Color(0xff00726D),
                              height: ElevarmButtonHeights.lg,
                              textColor: Colors.white,
                              text: 'Predict the Age',
                              onPressed: () {
                                setState(() {
                                  isPredict = true;
                                });
                              },
                            )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AppOutlineButton.text(
                      borderColor: ElevarmColors.neutral100,
                      backgroundColor: Colors.white,
                      textColor: ElevarmColors.neutral500,
                      height: ElevarmButtonHeights.lg,
                      text: 'Back to Home',
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
