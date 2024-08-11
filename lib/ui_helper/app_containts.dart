import 'dart:ui';

import 'package:flutter/material.dart';

class photos
{
  static final List<Map<String,dynamic>>pic=[

    {'name':'Shoes','pic':'assets/images/shoes.webp'},
    {'name':'Beauty','pic':'assets/images/beauty.png'},
    {'name':'Women Fashion','pic':'assets/images/women_fasion.webp'},
    {'name':'Jewelry','pic':'assets/images/jewellary.webp'},
    {'name':'Men Fashion','pic':'assets/images/mens.webp'},
    {'name':'Earbuds','pic':'assets/images/head.jpg'},
    {'name':'jewellary','pic':'assets/images/jewellary2.jpg'},
    {'name':'Headphones','pic':'assets/images/headphone.jpg'},
    {'name':'Perfume','pic':'assets/images/perfume.jpg'},
    {'name':'Nackless','pic':'assets/images/neckless.jpg'},
    {'name':'Shoes','pic':'assets/images/shoes2.webp'},
  ];
}

class earbuds
{
  static final List<Map<String,dynamic>>pic=[

    {'name':'Shoes','pic':'assets/images/earbuds.webp'},
    {'name':'Beauty','pic':'assets/images/sweter.webp'},
    {'name':'Women Fashion','pic':'assets/images/women_fasion.webp'},
    {'name':'Jewelry','pic':'assets/images/jewellary.webp'},
    {'name':'Men Fashion','pic':'assets/images/mens.webp'},
    {'name':'Shoes','pic':'assets/images/shoes.webp'},
    {'name':'Earbuds','pic':'assets/images/head.jpg'},
    {'name':'jewellary','pic':'assets/images/jewellary2.jpg'},
    {'name':'Shoes','pic':'assets/images/watch.webp'},
    {'name':'Perfume','pic':'assets/images/perfume.jpg'},
    {'name':'Shoes','pic':'assets/images/shoes.webp'},
    {'name':'Nackless','pic':'assets/images/neckless.jpg'},
    {'name':'Shoes','pic':'assets/images/shoes2.webp'},
    {'name':'Sweater','pic':'assets/images/sweter.webp'},
  ];
}


class Cart
{
  static final List<Map<String,dynamic>>list =
      [

        {'name':'Women Sweter','text':'Women Fashion','rupay':'\$70.00','pic':'assets/images/sweter.webp'},
        {'name':'Smart Watch','text':'Electronics','rupay':'\$55.00','pic':'assets/images/watch.webp'},
        {'name':'Wireless Headphone','text':'Electronics','rupay':'\$120.00','pic':'assets/images/earbuds.webp'},
        {'name':'Women Sweter','text':'Women Fashion','rupay':'\$100.00','pic':'assets/images/sweter.webp'},
        {'name':'Women Sweter','text':'Women Fashion','rupay':'\$120.00','pic':'assets/images/sweter.webp'},
      ];
}

 TextStyle myfont25()
{
  return TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black);
}

TextStyle myfont20()
{
  return TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black);
}

TextStyle myfont15()
{
  return TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black);
}

Text mytext()
{
  return Text('Lorem ipsum dolor sit amet consectetur .palcerat in '
             'semper vitae a. Blandit amet purus eget sed vitae '
             'morbi tellus. integer ornare.purus risus urna sed '
              'fermentum.Neque dolor tempus egestats nunc '
      'volutpat ullamcorper aligugam yelit',style: TextStyle(fontSize: 17),);
}
