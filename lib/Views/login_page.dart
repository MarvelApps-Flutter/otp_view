import 'package:flutter/material.dart';
import 'package:otp_view_app/Constants/assets_constants.dart';
import 'package:otp_view_app/Constants/string_constants.dart';
import 'package:otp_view_app/views/otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileController = TextEditingController();
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: loginPageBodySection(context),
        ),
      ),
    );
  }

  Container loginPageBodySection(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loginPageHeader(),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            imageSection(),
            enterMobileNumberText(),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            mobileTextFiledSection(),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            sendOtpSection()
          ],
        ),
      ),
    );
  }

  Widget sendOtpSection() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return OTPView(
            mobileNumber: mobileController.text,
          );
        }));
      },
      child: Container(
        alignment: Alignment.center,
        height: screenHeight * 0.06,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            color: Color(0xFFFF5840),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: const Text(
          StringConstants.sendBtnLabel,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget mobileTextFiledSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: mobileController,
        decoration: const InputDecoration(
            hintText: StringConstants.enterMobileNumberHintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20)),
      ),
    );
  }

  Widget imageSection() {
    return Image.asset(
      AssetConstants.appImage,
      height: 350,
      width: 300,
      fit: BoxFit.fill,
    );
  }

  Widget enterMobileNumberText() {
    return const Text(
      StringConstants.enterMobileNumber,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }

  Widget loginPageHeader() {
    return const Text(
      StringConstants.createAccount,
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 30),
    );
  }
}
