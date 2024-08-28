import 'dart:convert';
import 'dart:io';

import 'package:ecommerce/data/remote/app_exception.dart';
import 'package:http/http.dart' as httpApi;
class ApiHelper
{

  Future<dynamic> getApi({required String Url})
  async{
    var uri = Uri.parse(Url);
    try{
      var res = await httpApi.get(uri,headers: {
        "":""
      });
      return returnJsonRes(res);
    }on SocketException catch(e){
      throw FetchException(errorMsg: "No Internet...!!");

    }

  }
}


   dynamic returnJsonRes(httpApi.Response response)
   {
     switch(response.statusCode)
     {
       case 200:{ var mData =jsonDecode(response.body);
         return mData;}
       case 400: throw BadRequestException(errorMsg: response.body.toString());
       case 403: throw UnAuthorisedException(errorMsg: response.body.toString());
       default:throw FetchException(errorMsg: response.body.toString());
     }
   }