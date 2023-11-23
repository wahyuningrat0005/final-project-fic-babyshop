import 'package:baby_shop/common/components/appbar/appbar_custom.dart';
import 'package:baby_shop/common/components/form/button/button.dart';
import 'package:baby_shop/common/components/form/textfield/custom_text_field.dart';

import 'package:baby_shop/common/components/space_height.dart';
import 'package:baby_shop/data/models/requests/registes_request_model.dart';
import 'package:baby_shop/presentation/auth/signup/bloc/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordlController = TextEditingController();
  final nameController = TextEditingController();
  final confirmedController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordlController.dispose();
    confirmedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("App Bar"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: GoogleFonts.lobster(
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SpaceHeight(20.0),
                      CustomTextField(
                        controller: nameController,
                        label: "Username",
                        suffixIcon: Icons.person,
                        value: null,
                        onChanged: (value) {},
                      ),
                      CustomTextField(
                        controller: emailController,
                        label: "Email",
                        suffixIcon: Icons.email,
                        value: null,
                        onChanged: (value) {},
                      ),
                      CustomTextField(
                        controller: passwordlController,
                        label: "Password",
                        suffixIcon: Icons.password,
                        value: null,
                        onChanged: (value) {},
                      ),
                      CustomTextField(
                        controller: confirmedController,
                        label: "Confirmasi Password",
                        suffixIcon: Icons.password,
                        value: null,
                        onChanged: (value) {},
                      ),
                      BlocConsumer<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            success: (data) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Berhasil mendaftar"),
                                  backgroundColor: Colors.amber,
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
                                label: "Sign Up",
                                onPressed: () {
                                  final data = RegisterRequestModel(
                                    name: nameController.text,
                                    password: passwordlController.text,
                                    email: emailController.text,
                                    username:
                                        nameController.text.replaceAll(' ', ''),
                                  );
                                  context
                                      .read<RegisterBloc>()
                                      .add(RegisterEvent.register(data));
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
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
