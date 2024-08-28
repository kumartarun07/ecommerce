import 'package:ecommerce/cart_page.dart';
import 'package:ecommerce/detail.dart';
import 'package:ecommerce/myhome.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget
{

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage>
{
  int selectedIndex =0;
  List<Widget> navPages =[

    MyHome(),
    Detail(),
    CartPage()
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:navPages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.orange,
        destinations:
     [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: Icon(Icons.favorite_border), label: "Favourite"),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: "My Cart"),
        NavigationDestination(icon: Icon(Icons.account_circle_sharp), label: "My Profile")
      ],
      selectedIndex: selectedIndex,
        onDestinationSelected: (value)
        {
          selectedIndex = value;
          setState(() {

          });
        },
      ),
    );

  }
}