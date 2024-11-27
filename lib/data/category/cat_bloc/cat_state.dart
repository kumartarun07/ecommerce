import 'package:ecommerce/data/category/category_model.dart';

abstract class CatState {}
class CatInitialState extends CatState{}
class CateLoadingState extends CatState{}
class CatSuccessState extends CatState{
  CategoryModel mData;
  CatSuccessState({required this.mData});
}
class CatFailureState extends CatState{
  String errorMsg;
  CatFailureState({required this.errorMsg});
}