import 'package:ecommerce/data/category/cat_bloc/cat_event.dart';
import 'package:ecommerce/data/category/cat_bloc/cat_state.dart';
import 'package:ecommerce/data/category/category_model.dart';
import 'package:ecommerce/data/remote/api_helper.dart';
import 'package:ecommerce/data/remote/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class CatBloc extends Bloc<CatEvent,CatState>
{
  ApiHelper apiHelper;
  CatBloc({required this.apiHelper}):super(CatInitialState()){
    on<GetCatEvent>((event,emit)async{
      emit(CateLoadingState());
      try{
        var res = await apiHelper.getApi(Url: Urls.Category_Url);
        if(res["status"]){
          emit(CatSuccessState(mData: CategoryModel.fromJson(res)));
        }else{
          emit(CatFailureState(errorMsg: "Error: ${res["message"]}"));
        }
      }catch(e){
        emit(CatFailureState(errorMsg: e.toString()));
      }
    });
  }

}