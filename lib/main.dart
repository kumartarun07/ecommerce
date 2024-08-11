import 'package:ecommerce/bottom_page.dart';
import 'package:ecommerce/cart_page.dart';
import 'package:ecommerce/detail.dart';
import 'package:ecommerce/myhome.dart';
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
    home: BottomPage()
  );
  }

}

