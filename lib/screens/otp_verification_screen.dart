import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magix/providers/user_view_model.dart';

import '../widgets/authentication/input_form.dart';
import '../widgets/snack_bar.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as UserViewModel;
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: const FlutterLogo(
                size: 150,
              ),
            ),
            const Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.3,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "An OTP sent on +91-${model.phoneController.text.trim()}, Please enter your otp below and hit the validate button to verify your account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).disabledColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: InputFieldBuilder(
                textAlign: TextAlign.center,
                maxLength: 6,
                inputType: TextInputType.phone,
                controller: model.otpController,
                hint: "X X X X X X",
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Phone No cannot be empty!";
                  } else if (val.length < 10) {
                    return "Enter mobile no. with country code";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                verifyAndRegister(context, model);
              },
              child: const Text("Validate"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      )),
    );
  }

  Future<void> verifyAndRegister(
      BuildContext context, UserViewModel model) async {
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${model.phoneController.text}",
      verificationCompleted: (PhoneAuthCredential authCredential) async {
        // Signing
        final _res = await model.registerUser();
        // if _res not null navigate to dashboard
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBar(context, msg: "${e.message}");
      },
      codeSent: (
        String verificationID,
        int? resendToken,
      ) {
        model.setVerificationID(verificationID);
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        model.setVerificationID(verificationID);
      },
      timeout: const Duration(seconds: 120),
    );
  }
}
