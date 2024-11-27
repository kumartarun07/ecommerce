import 'package:ecommerce/data/category/cat_bloc/cat_bloc.dart';
import 'package:ecommerce/data/remote/api_helper.dart';
import 'package:ecommerce/ui_page/login/bloc/login_bloc.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_bloc.dart';
import 'package:ecommerce/ui_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/product/product_bloc/product_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SignUpBloc(apiHelper: ApiHelper()),
      ),
      BlocProvider(create: (context)=>LoginBloc(apiHelper: ApiHelper())),
      BlocProvider(create: (context)=>ProductBloc(apiHelper: ApiHelper())),
      BlocProvider(create: (context)=>CatBloc(apiHelper: ApiHelper()))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage()
    );
  }

}

