import 'package:ecommerce/ui_page/dashboard/bottom_page.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget {
  var micon;
  var mcolor;

  WidgetPage({this.micon, this.mcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: mcolor),
        child: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BottomPage()));
          },
          icon: Icon(
            micon,
            size: (30),
            color: Colors.black,
          ),
        ));
  }

  static CoustomTextfield(bool isVisible, TextInputType keyboardType,
      TextEditingController controller, String text, Widget widget) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isVisible ? false : true,
      decoration: InputDecoration(
          hintText: text,
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: widget),
    );
  }

  static CircleAvatar myCircle({Color? myColor}) {
    return CircleAvatar(
      backgroundColor: myColor,
      maxRadius: 8,
    );
  }
}

Container mycont({Color? mycolor}) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: mycolor ?? Color(0xffFFFFFF),
    ),
  );
}

TextStyle myTextStyle25(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(fontSize: 25, fontWeight: mFontWeight, color: mColor);
}

TextStyle myTextStyle20(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(fontSize: 20, fontWeight: mFontWeight, color: mColor);
}

TextStyle myTextStyle15(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(fontSize: 15, fontWeight: mFontWeight, color: mColor);
}

TextStyle myTextStyle12(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(fontSize: 12, fontWeight: mFontWeight, color: mColor);
}

TextStyle myTextStyle10(
    {FontWeight mFontWeight = FontWeight.normal, Color mColor = Colors.black}) {
  return TextStyle(fontSize: 10, fontWeight: mFontWeight, color: mColor);
}

class MyTextfields extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  TextInputType? keyboardType;
  String hintText;
  IconData suffixIcon;
  bool isVisible;
  VoidCallback? callBack;
  bool isPassword;

  MyTextfields(
      {required this.hintText,
      this.callBack,
      this.isPassword = false,
      required this.suffixIcon,
      this.isVisible = true,
      required this.textEditingController,
      required this.keyboardType});

  @override
  State<MyTextfields> createState() => _MyTextfieldsState();
}

class _MyTextfieldsState extends State<MyTextfields> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      controller: widget.textEditingController,
      obscureText: widget.isVisible ? false : true,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.black)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.black)),
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  widget.isVisible = !widget.isVisible;
                  setState(() {});
                },
                child: widget.isVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off))
            : Icon(widget.suffixIcon),
      ),
    );
  }
}

class CoustomButton extends StatelessWidget {
  var btnColor;
  var btnname;
  var btnTextColor;
  var btnHeight;
  var btnWidth;
  Widget? mwidget;

  CoustomButton(
      {this.btnColor,
       required this.btnname,
      this.btnTextColor,
      this.btnHeight,
      this.btnWidth,
      this.mwidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight ?? 50,
      width: btnWidth ?? 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
      color: btnColor ?? Colors.white
      ),
      child: mwidget ??
          Center(
            child: Text(
              btnname??"Login",
              style:myTextStyle20(mColor: btnTextColor ?? Colors.black),
            ),
          ),
    );
  }
}


class CardWiddget extends StatelessWidget
{
  VoidCallback? callBack;
  String title;
  IconData? myIcon;
  IconData? secIcon;
  Color mColor;
  CardWiddget({this.mColor=Colors.black,required this.title, this.myIcon,required this.callBack,this.secIcon});
  @override
  Widget build(BuildContext context)
  {
   return Container(
     height: 80,
     child: GestureDetector(
       onTap: callBack,
       child: Card(elevation: 10,
           margin: EdgeInsets.all(10),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10.0),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   Icon(myIcon??Icons.arrow_back_ios_new,size: 30,),
                   SizedBox(width: 10,),
                   Text(title,style: myTextStyle15(mFontWeight: FontWeight.bold,mColor: mColor),)
                 ],
               ),
               Icon(secIcon,size: 30,)
             ],
           ),
         )
       ),
     ),
   );
  }

}
