import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/remote/api_helper.dart';
import 'package:ecommerce/data/remote/urls.dart';
import 'package:ecommerce/ui_helper/app_containts.dart';
import 'package:ecommerce/ui_page/login/bloc/login_event.dart';
import 'package:ecommerce/ui_page/login/bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>
{
  ApiHelper apiHelper;
  LoginBloc({required this.apiHelper}):super(LoginInitialState()){
    on<LoginUserEvent>((event,emit)async{
      emit(LoginLoadingState());
      try{
        dynamic res = await apiHelper.postApi(
          url: Urls.Login_Url,
          isHeaderRequired: false,
          mBodyParams: {
            "email":event.email,
            "password":event.password
          });
        if(res["status"]){
          var uid = res["tokan"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(photos.PREFS_UID_KEY, uid);
          emit(LoginSuccessState());
        }else{
          emit(LoginFailureState(errorMsg: res["message"]));
        }
      }catch(e){
        emit(LoginFailureState(errorMsg: e.toString()));
      }
    });
  }
}