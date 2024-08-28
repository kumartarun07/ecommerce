import 'package:ecommerce/ui_page/bottom_page.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget
{
  var micon;
  var mcolor;
  WidgetPage({ this.micon,this.mcolor});
  @override
  Widget build(BuildContext context) {

    return Container(height: 50,width: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: mcolor),
      child: IconButton(onPressed: ()
      {Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomPage()));},
        icon: Icon(micon,size: (30),color: Colors.black,),)
    );
  }
  static CoustomTextfield(TextEditingController controller, String text,Widget widget){
   return TextField(
     controller: controller,
     decoration: InputDecoration(
       hintText: text,
       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
       focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
       suffixIcon: widget
     ),
   );
  }
  
  
  static CoustomButton(VoidCallback callBack,String text){
    return SizedBox(
      height: 50,width: 300,
      child: ElevatedButton(onPressed: callBack, child: Text(text,style: TextStyle(fontSize: 20),)),
    );
  }
}

Container mycont({Color ? mycolor})
{

  return Container(height: 30,width: 30,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
    color:mycolor??Color(0xffFFFFFF),),
  );
}



