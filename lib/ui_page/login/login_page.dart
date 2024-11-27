import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:ecommerce/ui_page/dashboard/bottom_page.dart';
import 'package:ecommerce/ui_page/login/bloc/login_bloc.dart';
import 'package:ecommerce/ui_page/login/bloc/login_event.dart';
import 'package:ecommerce/ui_page/login/bloc/login_state.dart';
import 'package:ecommerce/ui_page/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MediaQueryData? mqData;

  bool isLoading = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/login/login.jpeg"),
            fit: BoxFit.cover,
          ),
          Container(
            width: mqData!.orientation == Orientation.portrait
                ? mqData!.size.width * 1
                : mqData!.size.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login Your Account",
                  style: myTextStyle25(),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfields(
                    hintText: "Enter ",
                    suffixIcon: Icons.email,
                    textEditingController: emailController,
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 15,
                ),
                MyTextfields(
                    hintText: "Enter Your Password",
                    isVisible: false,
                    isPassword: true,
                    suffixIcon: Icons.visibility_off,
                    textEditingController: passController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if(state is LoginLoadingState){
                        isLoading=true;
                        setState(() {

                        });
                      }
                      if(state is LoginFailureState){
                        isLoading=false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
                        setState(() {

                        });
                      }
                      if(state is LoginSuccessState){
                        isLoading=false;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomPage()));
                      }
                    },
                    child: InkWell(
                        onTap: (){
                          if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
                            context.read<LoginBloc>().add(LoginUserEvent(
                                password: passController.text,
                                email: emailController.text));
                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Please enter email and password")));
                          }
                        },
                        child: CoustomButton(btnname: "Login Now",btnColor: Colors.orange.shade200,
                          mwidget: isLoading?Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircularProgressIndicator(color: Colors.blue,)),
                              Text("Loading...")
                            ],
                          ):null,))
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Your Account",
                      style: myTextStyle15(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text(
                        "SignUp",
                        style: myTextStyle20(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
