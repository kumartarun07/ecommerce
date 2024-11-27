import 'package:ecommerce/data/product/product_bloc/product_event.dart';
import 'package:ecommerce/data/product/product_bloc/product_state.dart';
import 'package:ecommerce/data/remote/api_helper.dart';
import 'package:ecommerce/data/remote/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product_model/product_model.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>
{
  ApiHelper apiHelper;
  ProductBloc({required this.apiHelper}):super(ProductInitialState()){
    on<GetProductEvent>((event,emit)async{
      emit(ProductLoadingState());
      try {
        dynamic res = await apiHelper.postApi(url: Urls.Product_Url,);
        if(res["status"]){
          emit(ProductSuccessState(productModel: ProductModel.fromJson(res)));
        }else{
          emit(ProductFailureState(errorMsg:"Error: ${res["message"]}"));
        }
      }catch(e){
        emit(ProductFailureState(errorMsg: e.toString()));
      }
    });
  }
}