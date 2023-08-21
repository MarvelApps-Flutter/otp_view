import 'package:flutter/material.dart';
import 'package:otp_view_app/Constants/assets_constants.dart';
import 'package:otp_view_app/Constants/string_constants.dart';
import 'package:otp_view_app/views/widgets/otp_input_Section.dart';
import 'package:otp_view_app/views/widgets/verify_button.dart';

class OTPView extends StatefulWidget {
  final String? mobileNumber;
  const OTPView({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OTPView> createState() => _OTpViewState();
}

class _OTpViewState extends State<OTPView> {
  TextEditingController? otpDigit;
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    otpDigit = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: otpBodySection(context),
      ),
    );
  }

  SingleChildScrollView otpBodySection(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpPageHeader(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              imageSection(),
              const Text(
                StringConstants.mobileVerifySuccess,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              otpInputSectionText(),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              OTPInput(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              didntReceivedCodeSection(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              VerifyButton(screenHeight: screenHeight, screenWidth: screenWidth)
            ],
          ),
        ),
      ),
    );
  }

  Widget otpPageHeader() {
    return const Text(
      StringConstants.verifyAccount,
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }

  Widget didntReceivedCodeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConstants.didntReceivedCode,
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
        const Text(
          StringConstants.resendBtnLabel,
          style: const TextStyle(color: Color(0xFFFF5840), fontSize: 20),
        ),
      ],
    );
  }

  Widget imageSection() {
    return Image.asset(
      AssetConstants.appImage,
      height: 200,
      width: 200,
      fit: BoxFit.fill,
    );
  }

  Widget otpInputSectionText() {
    return Text(
      StringConstants.sentOtpOn1 +
          widget.mobileNumber.toString() +
          StringConstants.enterToCompleteVerification,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.grey, fontSize: 20),
    );
  }
}
