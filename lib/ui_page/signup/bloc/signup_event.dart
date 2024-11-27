import 'package:ecommerce/ui_page/signup/model/signup_model.dart';

abstract class SignUpEvent{}
class SignUpUserEvent extends SignUpEvent
{
  SignUpModel signUpModel;
  SignUpUserEvent({required this.signUpModel});
}