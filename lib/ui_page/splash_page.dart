import 'dart:async';
import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:ecommerce/ui_page/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/bottom_page.dart';

class SplashPage extends StatefulWidget
{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), ()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var check = prefs.getString(photos.PREFS_UID_KEY)??"";
      Widget nextPage=LoginPage();
      if(check !=""){
        nextPage=BottomPage();
      }
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>nextPage));
    }
    );
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image(image: AssetImage("assets/splash/ecom.png"),fit: BoxFit.cover,),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      },child: Icon(Icons.arrow_forward_sharp,size: 25,),),
    );
  }
}
