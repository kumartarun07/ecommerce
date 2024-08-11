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
      child: IconButton(onPressed: (){},icon: Icon(micon,size: (30),color: Colors.black,),)
    );
  }
}

Container mycont({Color ? mycolor})
{

  return Container(height: 30,width: 30,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:mycolor??Color(0xffFFFFFF),),
  );
}



