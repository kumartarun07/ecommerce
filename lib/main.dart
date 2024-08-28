import 'package:ecommerce/ui_page/bottom_page.dart';
import 'package:ecommerce/ui_page/cart_page.dart';
import 'package:ecommerce/ui_page/detail.dart';
import 'package:ecommerce/ui_page/login_page.dart';
import 'package:ecommerce/ui_page/myhome.dart';
import 'package:ecommerce/ui_page/signup_page.dart';
import 'package:ecommerce/ui_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main ()
{
  runApp(Home());
}

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage()
  );
  }

}

