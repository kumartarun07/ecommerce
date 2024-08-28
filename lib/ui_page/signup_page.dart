import 'dart:math';
import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget 
{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(title: Text("Register Your Account",style: TextStyle(fontSize: 25),),centerTitle: true,),
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade100,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WidgetPage.CoustomTextfield(emailController, "Enter Your Email....",Icon(Icons.email)),
            WidgetPage.CoustomTextfield(nameController, "Enter Your Name....",Icon(Icons.account_circle)),
            WidgetPage.CoustomTextfield(passController, "Enter Your Password....",Icon(Icons.lock)),
            WidgetPage.CoustomTextfield(mobController, "Enter Your Mob....",Icon(Icons.mobile_screen_share)),
            WidgetPage.CoustomTextfield(genderController, "Enter Your Gender....",Icon(Icons.person_pin_outlined)),
            WidgetPage.CoustomButton((){
              Navigator.pop(context);
            }, "SignUp",),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I Have Already Account",style: TextStyle(fontSize: 15),),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Login Now",style: TextStyle(fontSize: 20),),),

              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
