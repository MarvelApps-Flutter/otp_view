import 'package:flutter/material.dart';
import 'package:otp_view_app/Constants/assets_constants.dart';
import 'package:otp_view_app/Constants/string_constants.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTpView extends StatefulWidget {
  final String? mobileNumber;
  const OTpView({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OTpView> createState() => _OTpViewState();
}

class _OTpViewState extends State<OTpView> {
  TextEditingController? otpDigit;

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
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otpPageHeader(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              imageSection(),
              const Text(
                StringConstants.mobileVerifySuccess,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              otpInputSectionText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              otpInputSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              didntReceivedCodeSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              verifyBtnSection(),
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

  verifyBtnSection() {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.3,
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
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.4,
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

  Widget otpInputSection() {
    return SizedBox(
      child: PinPut(
        eachFieldWidth: 50.0,
        eachFieldHeight: 50.0,
        controller: otpDigit,
        fieldsCount: 4,
        eachFieldMargin: EdgeInsets.symmetric(horizontal: 5),
        submittedFieldDecoration: BoxDecoration(
          color: Color(0xFFFF5840),
          borderRadius: BorderRadius.circular(15.0),
        ),
        selectedFieldDecoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(15.0),
        ),
        followingFieldDecoration: BoxDecoration(
          color: Color(0xFFFF5840),
          borderRadius: BorderRadius.circular(15.0),
        ),
        pinAnimationType: PinAnimationType.rotation,
        textStyle: TextStyle(color: Colors.white, fontSize: 20.0, height: 1),
      ),
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
