import 'package:flutter/material.dart';

import '../../Constants/assets_constants.dart';
import '../../Constants/string_constants.dart';

class VerifyButton extends StatelessWidget {
  double screenHeight;
  double screenWidth;
  VerifyButton(
      {Key? key, required this.screenHeight, required this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  alignment: Alignment.center,
                  height: screenHeight * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetConstants.popUpImage,
                        height: 100,
                        width: 100,
                      ),
                      const Text(
                        StringConstants.verifySuccessDialogText,
                        style: TextStyle(
                            color: Color(0xFFFF5840),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        alignment: Alignment.center,
        height: screenHeight * 0.06,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            color: Color(0xFFFF5840),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: const Text(
          StringConstants.verify,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
