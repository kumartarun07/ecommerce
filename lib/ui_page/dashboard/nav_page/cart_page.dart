import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget
{
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int count = 1;

  TextEditingController abc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(backgroundColor:Color(0xffF5F5F5),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0,bottom: 3,top: 3),
          child: WidgetPage(micon: Icons.arrow_back_ios_new,mcolor: Colors.white,),
        ),
        leadingWidth: 60,
        title: Text('My Cart',style: myTextStyle25(),),centerTitle: true,),
      body:
      Column(
        children: [
          Expanded(flex: 2,
            child: ListView.builder(
              itemCount: Cart.list.length,
              itemBuilder:(context, index)
              {
                return Container(height: 120,width: 300,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Container(width: 120,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Cart.list[index]['pic']),fit: BoxFit.fill),
                     borderRadius: BorderRadius.circular(20)
                      ),),
                    Container(width: 210,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Cart.list[index]['name'],style: myTextStyle15(),),
                              Icon(Icons.delete,size: 30,color: Color(0xffFF7532)),
                            ],
                          ),
                          Text(Cart.list[index]['text']),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Cart.list[index]['rupay'],style:myTextStyle15(),),
                              Container(height: 30,width: 120,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffF5F5F5)),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  IconButton(onPressed: (){
                                    if(count>1)
                                      {
                                        count--;
                                      }
                                    setState(() {

                                    });
                                  }, icon:Icon(Icons.arrow_back,color: Colors.black,size: 15,)),
                                  Text("$count"),
                              IconButton(onPressed: (){
                                count++;
                                setState(() {

                                });
                              }, icon: Icon(Icons.add,color: Colors.black,size: 15,))
                                ],),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                                  ],),
                );

            },),
          ),
          Expanded(flex: 1,
              child: Container(width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(height: 60,width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Color(0xfff5f5f5),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text('Enter Discount Code',style:myTextStyle15(),),
                    TextButton(onPressed: (){}, child: Text('Apply',style:myTextStyle20(mColor: Colors.orange),))
                  ],
                  ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subtotal',style:TextStyle(fontSize: 20),),
                          Text('\$245.00',style: myTextStyle20(),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total',style:myTextStyle20(),),
                          Text('\$245.00',style:myTextStyle20(),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(height: 50,width: double.infinity,
                    child: TextButton(onPressed: (){},child: Text('Checkout',style:myTextStyle20(mColor: Colors.white),),),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.orange),
                    )
                ],),
              ),)
        ],
      ),
    );
  }
}