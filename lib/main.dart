import 'package:baby_shop/data/datasources/auth_local_datasource.dart';
import 'package:baby_shop/presentation/auth/sigin/bloc/signin_bloc.dart';
import 'package:baby_shop/presentation/auth/sigin/signin_page.dart';
import 'package:baby_shop/presentation/auth/signup/bloc/register_bloc.dart';
import 'package:baby_shop/presentation/home/bloc/product_bloc.dart';

import 'package:baby_shop/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc()..add(const ProductEvent.getAll(),),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FutureBuilder<bool>(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!) {
                return const SplashPage();
              } else {
                return const SignInPage();
              }
            },
          )),
    );
  }
}
