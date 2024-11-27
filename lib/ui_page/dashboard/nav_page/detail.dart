import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget
{
  String? text;
  String? imgPath;
  String? price;
  int mIndex;
  Detail({this.text,this.imgPath,this.mIndex=0,this.price});
  TextEditingController abc =TextEditingController();
  @override
  Widget build(BuildContext context)
  {
  return Scaffold(
    backgroundColor:Color(0xffF5F5F5),
    appBar: AppBar(backgroundColor:Color(0xffF5F5F5),
    leading:  Padding(
      padding: const EdgeInsets.only(left: 10.0,bottom: 3,top: 3),
      child: WidgetPage(micon: Icons.arrow_back_ios_new,mcolor: Colors.white,),
    ),
      leadingWidth: 60,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            children: [
              WidgetPage(micon: Icons.share,mcolor: Colors.white,),
              SizedBox(width: 20,),
              WidgetPage(micon: Icons.favorite_border,mcolor: Colors.white,),

            ]),
        )

      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
          margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            height:300,width:450,
          child:
          Hero(
              tag: mIndex,
              child:imgPath!=null? Image.network("${imgPath}",):Image.asset('assets/images/shoes.webp',fit: BoxFit.fill,)),

          ),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top:Radius.circular(35)),
             color:Color(0xffFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(text.toString(),style:myTextStyle20(mFontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('\u{20B9}${price}',style:myTextStyle20(),),
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
                    Text('Seller :Tariui islam',style:myTextStyle15(),)

                  ],),
                  SizedBox(height: 10,),
                  Text('Color',style:myTextStyle20(mFontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
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
                  SizedBox(height: 10,),
                  Container(height: 30,width: 450,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Description',style:myTextStyle15(mFontWeight: FontWeight.bold),),
                      Text('Specifications',style:myTextStyle15(mFontWeight: FontWeight.bold),),
                      Text('Reviews',style:myTextStyle15(mFontWeight: FontWeight.bold),),
                    ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  mytext(),
                  SizedBox(height: 15,),
                  Container(width: 450,height: 60,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(width: 100,height: 30,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('-',style:myTextStyle20(mColor: Colors.white),),
                          Text('1',style:myTextStyle20(mColor: Colors.white),),
                          Text('+',style:myTextStyle20(mColor: Colors.white),),
                        ],
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2,color: Colors.white)
                        ),
                        ),
                        Container(width: 200,height: 50,
                        child: TextButton(onPressed: (){},child: Text('Add to Cart',style:myTextStyle20(mColor: Colors.white,mFontWeight: FontWeight.bold)),),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.orange,),),
                      ],
                    ),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.black,),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }

}