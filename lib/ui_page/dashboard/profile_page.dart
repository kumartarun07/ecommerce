import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:ecommerce/ui_page/login/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget
{
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color(0xffF5F5F5),
      appBar: AppBar(backgroundColor:Color(0xffF5F5F5),
        leadingWidth: 60,
        leading:Padding(
          padding: const EdgeInsets.only(left: 10.0,bottom: 3,top: 3),
          child: WidgetPage(micon: Icons.arrow_back_ios_new,mcolor: Colors.white,),
        ),
              title: Text(
          "Profile Page",
          style:myTextStyle25(mFontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Text(
            "General",
            style: myTextStyle20(mFontWeight: FontWeight.bold),
          ),
          CardWiddget(
            title: "Edit Profile",
            callBack: () {},
            myIcon: Icons.account_circle_outlined,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "Change Password",
            callBack: () {},
            myIcon: Icons.lock_outline,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "Notifications",
            callBack: () {},
            myIcon: Icons.notifications_none_outlined,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "Security",
            callBack: () {},
            myIcon: Icons.security_outlined,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "Language",
            callBack: () {},
            myIcon: Icons.language,
            secIcon: Icons.arrow_forward_ios,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Preferencess",
            style: myTextStyle20(mFontWeight: FontWeight.bold),
          ),
          CardWiddget(
            title: "Legal and Policies",
            callBack: () {},
            myIcon: Icons.policy_outlined,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "Legal and Policies",
            callBack: () {},
            myIcon: Icons.live_help_outlined,
            secIcon: Icons.arrow_forward_ios,
          ),
          CardWiddget(
            title: "LogOut",mColor: Colors.red,
            callBack: () {
              showDialog(context: context, builder: (context)=> AlertDialog(
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: Text("Logout",style: myTextStyle20(mFontWeight: FontWeight.bold),),
                content: Text("Are you sure you want to logout?",style: myTextStyle20(mFontWeight: FontWeight.bold),),
                actions: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CoustomButton(btnname: "Cancel",btnColor: Colors.blueAccent,btnTextColor: Colors.white,)),
                  SizedBox(height: 15,),
                  InkWell(
                      onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
                      child: CoustomButton(btnname: "Logout",btnTextColor: Colors.red,)),
                ]
                     ));
                 },
            myIcon: Icons.logout,
            secIcon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
