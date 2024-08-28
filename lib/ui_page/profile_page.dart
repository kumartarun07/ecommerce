import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget 
{
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile Page",style: TextStyle(fontSize: 30),),centerTitle: true,),
      body: Center(
        child: Text("Profile Page Here !!",style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
