import 'dart:math';

import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:ecommerce/ui_page/bottom_page.dart';
import 'package:ecommerce/ui_page/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget
{
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page",style: TextStyle(fontSize: 25),),centerTitle: true,),
      body: Center(
        child: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100,
          ),
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login Your Account",style: TextStyle(fontSize: 25),),
              SizedBox(height: 20,),
              WidgetPage.CoustomTextfield(emailController, "Enter Your Email...",Icon(Icons.email)),
              SizedBox(height: 20,),
              WidgetPage.CoustomTextfield(passController, "Enter Your Password...",Icon(Icons.lock)),
              SizedBox(height: 30,),
              Center(
                child:  WidgetPage.CoustomButton((){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomPage()));
                }, "Login"),),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create Your Account",style: TextStyle(fontSize: 15),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                     }, child: Text("SignUp",style: TextStyle(fontSize: 20),),),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
