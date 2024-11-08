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

