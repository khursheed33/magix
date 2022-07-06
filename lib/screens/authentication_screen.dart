import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magix/home/app_routers.dart';
import 'package:magix/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

import '../providers/user_view_model.dart';
import '../widgets/authentication/input_form.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context) => UserViewModel(),
      builder: (context, _) => Consumer<UserViewModel>(
        builder: (ctx, model, _) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: model.authFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      Text(
                        model.isLogin ? "LOGIN" : "REGISTER",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InputFieldBuilder(
                        maxLength: 10,
                        inputType: TextInputType.phone,
                        controller: model.phoneController,
                        hint: "Phone Number",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Phone No cannot be empty!";
                          } else if (val.length < 10) {
                            return "Enter mobile no. with country code";
                          }
                          return null;
                        },
                      ),
                      if (!model.isLogin)
                        InputFieldBuilder(
                          maxLength: 20,
                          controller: model.nameController,
                          hint: "Name",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Name cannot be empty!";
                            }
                            return null;
                          },
                        ),
                      if (!model.isLogin)
                        InputFieldBuilder(
                          maxLength: 20,
                          controller: model.surnameController,
                          hint: "Surname",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Surame cannot be empty!";
                            }
                            return null;
                          },
                        ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () async {
                          final _isValid =
                              model.authFormKey.currentState!.validate();

                          if (_isValid) {
                            model.authFormKey.currentState!.save();
                            // Start Registeration
                            Navigator.of(context).pushNamed(
                              RoutePath.otpVerification,
                              arguments: model,
                            );
                          }
                        },
                        child: Text(model.isLogin ? "Login" : "Register"),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.isLogin
                                ? "Don't have account? "
                                : "Already have account? ",
                          ),
                          TextButton(
                            onPressed: model.toggleIsLogin,
                            child: Text(
                              model.isLogin ? "Register" : "Login",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
