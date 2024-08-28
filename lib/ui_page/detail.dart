import 'dart:ui';

import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget
{
  TextEditingController abc =TextEditingController();
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.white,
    leading:  WidgetPage(micon: Icons.arrow_back_ios_new,mcolor: Colors.white,),
      actions: [
        WidgetPage(micon: Icons.share,mcolor: Colors.white,),
        SizedBox(width: 20,),
        WidgetPage(micon: Icons.favorite_border,mcolor: Colors.white,),

      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
          margin:EdgeInsets.symmetric(horizontal: 10),
            height:300,width:450,
              color: Color(0xffF5F5F5),
          child:
          Image.asset('assets/images/head.jpg',fit: BoxFit.fill,),

          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 600,width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
             color:Color(0xffFFFFFF),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Wireless Headphone',style: myfont20(),),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('\$520.00',style: myfont20(),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                      Container(height: 30,width: 60,
                      child:
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.star,color: Colors.white,),
                        Text('4:8',style: TextStyle(color: Colors.white),)
                      ],),
                      decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(width: 5,),
                      Text('(350 Review)')
                    ],)
                  ],),
                  Text('Seller :Tariui islam',style: myfont15(),)

                ],),
                SizedBox(height: 10,),
                Text('Color',style: myfont20(),),
                Container(
                  width: 250,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   mycont(mycolor:Color(0xff911D30) ),
                    mycont(mycolor: Colors.black),
                    mycont(mycolor: Color(0xff1D4491)),
                    mycont(mycolor: Colors.brown),
                    mycont(mycolor: Colors.grey),
                  ],),
                ),
                SizedBox(height: 20,),
                Container(height: 50,width: 450,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Deascription',style: myfont15(),),
                    Text('Specifications',style: myfont15(),),
                    Text('Reviews',style: myfont15(),),
                  ],
                  ),
                ),
                SizedBox(height: 10,),
                mytext(),
                SizedBox(height: 20,),
                Container(width: 450,height: 60,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 100,height: 30,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('-',style: TextStyle(fontSize: 15,color: Colors.white),),
                        Text('1',style: TextStyle(fontSize: 15,color: Colors.white),),
                        Text('+',style: TextStyle(fontSize: 15,color: Colors.white),),
                      ],
                      ),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.white)
                      ),
                      ),
                      Container(width: 150,height: 40,
                      child: TextButton(onPressed: (){},child: Text('Add to Cart',style: TextStyle(fontSize: 15,color: Colors.white)),),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.orange,),),
                    ],
                  ),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.black,),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }

}