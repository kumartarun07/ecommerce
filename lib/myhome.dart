import 'package:ecommerce/detail.dart';
import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:flutter/material.dart';

import 'widgets/widget_page.dart';

class MyHome extends StatelessWidget
{
  TextEditingController abc =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        title:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetPage(micon: Icons.menu,mcolor: Color(0xfff5f5f5)),
          WidgetPage(micon: Icons.notifications,mcolor: Color(0xfff5f5f5),),

        ],),),
      body:
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child:
            Container(height:50 ,width: 400,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(35),color: Color(0xfff5f5f5)),
              child:
              TextField(
                controller: abc,
                decoration: InputDecoration(hintText: 'Search...',hintStyle:TextStyle(fontSize: 15,),
                  border: OutlineInputBorder(borderSide: BorderSide(),borderRadius:BorderRadius.circular(35)),
                  prefixIcon:IconButton(onPressed: (){},icon:Icon(Icons.search,size: (25),),),
                  suffixIcon: IconButton(onPressed: (){},icon:Icon(Icons.menu,size: (25),),),
                  )
                ,),

            )),
            SizedBox(height: 10),
            Stack(alignment: Alignment.centerLeft,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 250,width: 400,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xfff5f5f5)),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/shoes.webp',fit: BoxFit.cover)),
                ),
                Positioned(left: 30,
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Super Sale',style: myfont25(),),
                    Text('Discount',style: myfont25(),),
                    Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Up to',style: myfont15(),),
                        SizedBox(width: 10,),
                        Text('50%',style: myfont25(),),
                      ],
                    ),
                      Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 35,width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.orange,),
                        child: TextButton(

                            onPressed: (){}, child: Text('Shop Now',style: TextStyle(fontSize: 12,color: Colors.white),)),
                      ),
                  ],),
                )
              ],
            ),
            SizedBox(height: 15),
            SizedBox(height: 100,
              child: ListView.builder(
                itemCount: photos.pic.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Column(children: [
                  Container(height: 60,width: 60,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(photos.pic[index]['pic']),fit: BoxFit.cover)
                  ),
                  ),
                  Text(photos.pic[index]['name']??"default",textAlign: TextAlign.justify,)
                ],);
              },),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 400,height: 400,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Special For You',style: myfont20(),),
                  Text('See all',style: TextStyle(fontSize: 15),),
                ],),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail()));
                    },
                    child: Container(height:300,color: Color(0xffF5F5F5),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            mainAxisSpacing: 15,
                            childAspectRatio: 9/16,
                            crossAxisSpacing: 20,
                            mainAxisExtent:250
                        ),
                        itemCount: photos.pic.length,
                        itemBuilder: (_, index)
                        {
                          return Stack(alignment: Alignment.topRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(image: AssetImage(earbuds.pic[index]['pic']??"default",),fit: BoxFit.cover)
                                ),
                              ),
                              Container(height: 50,width: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),bottomLeft: Radius.circular(15)),
                                  color: Colors.orange),
                                child: Icon(Icons.favorite_border),
                              )
                            ],
                          );
                        },),
                    ),
                  ),
              ],),
            ),
          ],
        ),
      ),
    );
  }

}