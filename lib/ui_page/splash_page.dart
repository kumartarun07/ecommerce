import 'dart:async';

import 'package:ecommerce/ui_page/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget
{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), ()=>
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginPage()))
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
