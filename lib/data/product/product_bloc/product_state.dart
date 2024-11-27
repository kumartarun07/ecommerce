import '../product_model/product_model.dart';

abstract class ProductState{}
class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductSuccessState extends ProductState{
  ProductModel productModel;
  ProductSuccessState({required this.productModel});
}
class ProductFailureState extends ProductState{
  String errorMsg;
  ProductFailureState({required this.errorMsg});
}