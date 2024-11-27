import 'dart:math';
import 'package:ecommerce/ui_helper/widget_page.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_bloc.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_event.dart';
import 'package:ecommerce/ui_page/signup/bloc/signup_state.dart';
import 'package:ecommerce/ui_page/signup/model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isLoading = false;
  bool isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController mobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register Your Account",
          style: myTextStyle25(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length - 1)]
                .shade100,
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTextfields(
                keyboardType: TextInputType.name,
                hintText: "Enter Your Name...",
                textEditingController: nameController,
                suffixIcon: Icons.account_circle,
              ),
              MyTextfields(
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter Your Email...",
                textEditingController: emailController,
                suffixIcon: Icons.email,
              ),
              MyTextfields(
                keyboardType: TextInputType.phone,
                hintText: "Enter Your Mobile...",
                textEditingController: mobController,
                suffixIcon: Icons.person,
              ),
              MyTextfields(
                keyboardType: TextInputType.text,
                hintText: "Enter Your Password...",
                textEditingController: passController,
                suffixIcon: Icons.visibility_off,
                isVisible: false,
                isPassword: true,
              ),
              BlocListener<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpLoadingState) {
                      isLoading = true;
                      setState(() {});
                    }
                    if (state is SignUpFailureState) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${state.errorMsg}")));
                    }
                    if (state is SignUpSuccessState) {
                      isLoading = false;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Account Created Successfully")));
                      Navigator.pop(context);
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      var name = nameController.text;
                      var email = emailController.text;
                      var mob = mobController.text;
                      var pass = passController.text;
                      if (name.isNotEmpty &&
                          email.isNotEmpty &&
                          mob.isNotEmpty &&
                          pass.isNotEmpty) {
                        context.read<SignUpBloc>().add(SignUpUserEvent(
                                signUpModel: SignUpModel(
                              name: name,
                              email: email,
                              password: pass,
                              mobile_number: mob,
                            )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Fill the all blanks fields",
                          style: myTextStyle15(mFontWeight: FontWeight.bold),
                        )));
                      }
                    },
                    child: CoustomButton(
                      btnname: "SignUp",
                      mwidget: isLoading
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text("Loading...")
                                ],
                              ),
                            )
                          : null,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I Have Already Account",
                    style: myTextStyle15(),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login Now",
                      style: myTextStyle20(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
