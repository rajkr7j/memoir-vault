import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/controller/login_button.dart';

import 'package:memoir_vault/widgets/textfields/email_textfield.dart';
import 'package:memoir_vault/widgets/textfields/password_textfield.dart';
import 'package:memoir_vault/widgets/oAuth_card.dart';
import 'package:memoir_vault/screens/forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.toggleAuth,
  });

  final void Function() toggleAuth;

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: height / 7),
            SizedBox(
              // height: 630,
              width: height > width ? width / 1.12 : width / 2.5,
              // padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25), // Add border radius
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 2.0, sigmaY: 2.0), // Add blur effect
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(32, 158, 208, 255),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:
                          MainAxisSize.min, // Set to minimize the size
                      children: [
                        SizedBox(height: height / 25.86),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'MEMOIR VAULT',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.reggaeOne(
                                color: const Color.fromARGB(255, 221, 62, 62),
                                fontSize: 35,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 29.09),

                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Login to your Account',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.encodeSansExpanded(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 43.63),

                        // Email TextField
                        TextFieldWidget(
                          title: 'Email',
                          controller: _emailController,
                        ),

                        SizedBox(height: height / 43.63),

                        // Password textField
                        PassTextField(
                          title: 'Password',
                          controller: _passwordController,
                        ),

                        SizedBox(height: height / 87.2),

                        //Login Button
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              logIn(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                  context: context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // width: width / 1.54617,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 221, 62, 62),
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.encodeSansExpanded(
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), //same as logintoyouaccount
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 87.2),

                        // Forget Password
                        Center(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return const ForgetPasswordPage();
                                    }),
                                  ),
                                );
                              },
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.encodeSansExpanded(
                                    color:
                                        const Color.fromARGB(255, 221, 62, 62),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 21.8),

                        //or login with text
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Or log in with?',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.encodeSansExpanded(
                                color: const Color.fromARGB(255, 255, 255,
                                    255), //same as logintoyouaccount
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 87.2),

                        //other sign in method
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                AccCard(
                                  image: 'assets/images/google.png',
                                  onTap: () {},
                                ),
                                SizedBox(width: width / 30.72),
                                AccCard(
                                  image: 'assets/images/facebook.png',
                                  onTap: () {},
                                ),
                                SizedBox(width: width / 30.72),
                                AccCard(
                                  image: 'assets/images/twitter.png',
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height / 43.63),

                        //dont have a account
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.encodeSansExpanded(
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), //same as logintoyouaccount
                                    fontSize: 15,
                                  ),
                                ),

                                //signup toggle text
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.toggleAuth();
                                    },
                                    child: Text(
                                      ' Signup',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.encodeSansExpanded(
                                        color: const Color.fromARGB(
                                            255, 221, 62, 62),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height / 15.5),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
