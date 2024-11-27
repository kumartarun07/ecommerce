import 'dart:convert';
import 'dart:io';
import 'package:ecommerce/data/remote/app_exception.dart';
import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:http/http.dart' as httpApi;
import 'package:shared_preferences/shared_preferences.dart';
class ApiHelper
{
  Future<dynamic> getApi({required String Url})
  async{
    var uri = Uri.parse(Url);
    try{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      String uid = prefs.getString(photos.PREFS_UID_KEY)??"";
      var res = await httpApi.get(uri,headers:
      {
        "Authorization":"Bearer $uid"
      });
      return returnJsonRes(res);
    }on SocketException catch(e){
      throw FetchException(errorMsg: "No Internet...!!");

    }

  }


  Future<dynamic> postApi({required String url ,
    bool isHeaderRequired=true,
    Map<String,String>? mHeaders,
    Map<String,dynamic>? mBodyParams
  })
  async{
    var uri = Uri.parse(url);
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uid = prefs.getString(photos.PREFS_UID_KEY)??"";
      var res = await httpApi.post(
          uri,
          headers:isHeaderRequired? {
            "Authorization" : "Bearer $uid",
          } : null,
          body: mBodyParams!=null ? jsonEncode(mBodyParams) : null
      );
      return returnJsonRes(res);
    }on  SocketException catch (e){
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