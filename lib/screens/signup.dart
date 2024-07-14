import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memoir_vault/theme/theme_provider.dart';

import 'package:memoir_vault/widgets/oAuth_card.dart';
import 'package:memoir_vault/controller/signup_button.dart';
import 'package:memoir_vault/widgets/textfields/email_textfield.dart';
import 'package:memoir_vault/widgets/textfields/password_textfield.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({
    super.key,
    required this.toggleAuth,
  });

  final void Function() toggleAuth;

  @override
  ConsumerState<SignUpPage> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  //textfield controller
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final theme = ref.watch(themeProvider);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: height / 8),
            Container(
              // height: 640,
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
                        SizedBox(height: height / 77.6),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.encodeSansExpanded(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        SizedBox(height: height / 38.8),

                        // username textfield
                        TextFieldWidget(
                          title: 'Username',
                          controller: _usernameController,
                        ),
                        SizedBox(height: height / 38.8),

                        // Email TextField
                        TextFieldWidget(
                          title: 'Email',
                          controller: _emailController,
                        ),
                        SizedBox(height: height / 38.8),

                        // Password textField
                        PassTextField(
                          title: 'Password',
                          controller: _passwordController,
                        ),
                        SizedBox(height: height / 38.8),

                        // confirm Password textField
                        PassTextField(
                          title: 'Confirm Password',
                          controller: _confirmPasswordController,
                        ),
                        SizedBox(height: height / 31),

                        //SignUp Button
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              signIn(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                confirmPassword:
                                    _confirmPasswordController.text.trim(),
                                username: _usernameController.text.trim(),
                                context: context,
                                ref: ref,
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // width: width / 1.54617,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.customColors.loginButton,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.encodeSansExpanded(
                                    color: const Color.fromARGB(
                                        255, 248, 248, 248),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height / 77.6),

                        //or signup with text
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Or sign up with?',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.encodeSansExpanded(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height / 51.73),

                        //other sign in method
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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

                        SizedBox(height: height / 38.8),

                        //already have an account
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.encodeSansExpanded(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontSize: 15,
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.toggleAuth();
                                    },
                                    child: Text(
                                      ' Login',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.encodeSansExpanded(
                                        color:
                                            theme.customColors.memoirVaultTitle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
