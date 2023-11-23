import 'package:baby_shop/common/components/form/button/button.dart';
import 'package:baby_shop/common/components/form/textfield/custom_text_field.dart';

import 'package:baby_shop/common/components/space_height.dart';
import 'package:baby_shop/data/datasources/auth_local_datasource.dart';
import 'package:baby_shop/data/models/requests/login_request_model.dart';
import 'package:baby_shop/presentation/auth/sigin/bloc/signin_bloc.dart';
import 'package:baby_shop/presentation/auth/signup/signup_page.dart';
import 'package:baby_shop/presentation/main_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordlController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    passwordlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0.0, 10, 0),
                          child: const Icon(
                            Icons.receipt,
                            size: 64.0,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Sign In",
                          style: GoogleFonts.lobster(
                            fontSize: 42.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        /*  Container(
                        transform: Matrix4.translationValues(0.0, -10, 0),
                        child: Text(
                          "Baby Shop",
                          style: GoogleFonts.blackOpsOne(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )*/
                      ],
                    ),
                  ),
                  /* .animate()
                    .moveY(
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    ),*/
                  SpaceHeight(20.0),
                  CustomTextField(
                      controller: emailController,
                      label: "Email",
                      suffixIcon: Icons.email,
                      value: null,
                      onChanged: (value) {}),
                  /* .animate()
                    .move(
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    ),*/
                  CustomTextField(
                      controller: passwordlController,
                      label: "Password",
                      suffixIcon: Icons.password,
                      value: null,
                      onChanged: (value) {}),
                  /* Text(
                  "30%",
                  style: GoogleFonts.oswald(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),*/
                  BlocConsumer<SigninBloc, SigninState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        success: (data) {
                          AuthLocalDatasource().saveAuthData(data);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainNavigationView()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Login Sukses"),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        },
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("message"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return QButton(
                            label: "Login",
                            onPressed: () {
                              final data = LoginRequestModel(
                                identifier: emailController.text,
                                password: passwordlController.text,
                              );
                              context
                                  .read<SigninBloc>()
                                  .add(SigninEvent.login(data));
                            },
                          );
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                  /*.animate()
                    .moveY(
                      begin: 100,
                      duration: 800.ms,
                    )
                    .fadeIn(
                      duration: 800.ms,
                    )*/

                  const SpaceHeight(50.0),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text.rich(TextSpan(
                          text: "Belum punya akun ? ",
                          children: [
                            TextSpan(
                              text: "Register",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
