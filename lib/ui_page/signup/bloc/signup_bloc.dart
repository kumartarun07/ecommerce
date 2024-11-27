import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/remote/api_helper.dart';
import 'package:ecommerce/data/remote/urls.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_event.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_state.dart';
class SignUpBloc extends Bloc<SignUpEvent,SignUpState>
{
  ApiHelper apiHelper;
  SignUpBloc({required this.apiHelper}):super(SignUpInitialState()){
    on<SignUpUserEvent>((event,emit)async{
      emit(SignUpLoadingState());
      try{
        dynamic res = await apiHelper.postApi(url: Urls.Register_Url,isHeaderRequired: false,
        mBodyParams: {
          "name":event.signUpModel.name,
          "mobile_number":event.signUpModel.mobile_number,
          "email":event.signUpModel.email,
          "password":event.signUpModel.password,
        },);
        if(res["status"]){
          emit(SignUpSuccessState());
        }else{
          emit(SignUpFailureState(errorMsg: res["message"]));
        }
      }catch(e){
        emit(SignUpFailureState(errorMsg: e.toString()));
      }
    });
  }
}