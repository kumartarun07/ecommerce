import 'package:ecommerce/data/category/cat_bloc/cat_bloc.dart';
import 'package:ecommerce/data/category/cat_bloc/cat_event.dart';
import 'package:ecommerce/data/product/product_bloc/product_event.dart';
import 'package:ecommerce/ui_page/dashboard/nav_page/detail.dart';
import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/category/cat_bloc/cat_state.dart';
import '../../../data/product/product_bloc/product_bloc.dart';
import '../../../data/product/product_bloc/product_state.dart';
import '../../../ui_helper/widget_page.dart';

class MyHome extends StatefulWidget
{
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
   context.read<ProductBloc>().add(GetProductEvent());
   context.read<CatBloc>().add(GetCatEvent());
    super.initState();
  }
  MediaQueryData? mqData ;

  TextEditingController abc =TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    mqData = MediaQuery.of(context);
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: WidgetPage(micon: Icons.menu,mcolor: Color(0xfff5f5f5)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: WidgetPage(micon: Icons.notifications,mcolor: Color(0xfff5f5f5),),
          ),
        ],),
      body:
      SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height:50 ,
              width: MediaQuery.of(context).size.width>450?MediaQuery.of(context).size.width*1:MediaQuery.of(context).size.width*1,
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

            ),
            SizedBox(height: 10),
            Stack(alignment: Alignment.centerLeft,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 250,
                  width: mqData!.orientation==Orientation.portrait? mqData!.size.width*1 : mqData!.size.width*1,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xfff5f5f5)),
                  child: ClipRRect(borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/shoes.webp',fit: BoxFit.cover)),
                ),
                Positioned(left: 30,
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Super Sale',style: myTextStyle25(mFontWeight: FontWeight.bold),),
                    Text('Discount',style: myTextStyle25(mFontWeight: FontWeight.bold),),
                    Row(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Up to',style: myTextStyle15(mFontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Text('50%',style: myTextStyle25(mFontWeight: FontWeight.bold),),
                      ],
                    ),
                      Container(margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        height: 35,width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.orange,),
                        child: TextButton(
                            onPressed: (){}, child: Text('Shop Now',style:myTextStyle15(mColor: Colors.white),)),
                      ),
                  ],),
                )
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<CatBloc,CatState>(builder: (_,state){
              if(state is CateLoadingState){
                return Center(child: CircularProgressIndicator(color: Colors.orange,),);
              }
              if(state is CatFailureState){
                return Center(child: Text(state.errorMsg),);
              }
              if(state is CatSuccessState){
                return SizedBox(height: 100,
                  width: mqData!.orientation==Orientation.portrait? mqData!.size.width*1:mqData!.size.width*1,
                  child: ListView.builder(
                    itemCount: state.mData.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var eachData = state.mData.data![index];
                      return InkWell(
                        onTap: (){},
                        child: Column(children: [
                          Container(height: 60,width: 60,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(image: AssetImage(photos.pic[index]['pic']),fit: BoxFit.cover)
                            ),
                          ),
                          Text(eachData.name??"default",textAlign: TextAlign.justify,)
                        ],),
                      );
                    },),
                );
              }
              return Container();
            }),
            BlocBuilder<ProductBloc,ProductState>(builder: (_,state){
              if(state is ProductLoadingState){
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(child: CircularProgressIndicator(color: Colors.orange,),),
                );
              }
              if(state is ProductFailureState){
                return Center(child: Text(state.errorMsg),);
              }
              if(state is ProductSuccessState){
                return  Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: mqData!.orientation==Orientation.portrait?mqData!.size.width*1:mqData!.size.width*1,
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Special For You',style: myTextStyle20(),),
                          Text('See all',style: myTextStyle15(),),
                        ],),
                      SizedBox(height: 10,),
                      Container(
                        color: Color(0xffF5F5F5),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300,
                              mainAxisSpacing: 15,
                              childAspectRatio: 9/16,
                              crossAxisSpacing: 20,
                              mainAxisExtent:200
                          ),
                          itemCount: state.productModel.data!.length,
                          itemBuilder: (_, index)
                          {
                            var eachData = state.productModel.data![index];
                            return Stack(alignment: Alignment.bottomLeft,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(
                                      text:eachData.name,
                                      imgPath: eachData.image,
                                      mIndex: index,
                                      price: eachData.price,
                                    )));
                                  },
                                  child: Hero(
                                    tag:index,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                                          image: DecorationImage(image: NetworkImage(eachData.image.toString(),),)
                                      ),
                                    ),
                                  ),
                                ),
                                Align(alignment: Alignment.topRight,
                                  child: Container(
                                    height: 50,width: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),bottomLeft: Radius.circular(15)),
                                        color: Colors.orange),
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,bottom: 15),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(eachData.name??"default",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\u{20B9}${eachData.price}",style: TextStyle(fontSize: 17,color: Colors.white),),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: Row(
                                              children: [
                                                WidgetPage.myCircle(myColor: Colors.black),
                                                SizedBox(width: 5,),
                                                WidgetPage.myCircle(myColor: Colors.blue),
                                                SizedBox(width: 5,),
                                                WidgetPage.myCircle(myColor: Colors.orange),
                                                SizedBox(width: 5,),
                                                WidgetPage.myCircle(myColor: Colors.white),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },),
                      ),
                    ],),
                );
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}