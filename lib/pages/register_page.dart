import 'package:budget_tracker_ui/constant.dart';
import 'package:budget_tracker_ui/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF000000);

const Color primary = Color(0xFF92A3FD);
const Color secondary = Color(0xFF9DCEFF);
const Color bgTextField = Color(0xFFF7F8F8);

const Color facebookColor = Color(0xFF3b5998);
const Color googleColor = Color(0xFFDB4437);

class RegisterScreen extends StatelessWidget {
  RegisterScreen({key}) : super(key: key);
  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hey there,",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bgTextField,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.user,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextField(
                                controller: userNameController,
                                cursorColor: black.withOpacity(0.5),
                                decoration: InputDecoration(
                                    hintText: "Name", border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bgTextField,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.envelope,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextField(
                                controller: emailTextController,
                                cursorColor: black.withOpacity(0.5),
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: bgTextField,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              LineIcons.lock,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Flexible(
                              child: TextField(
                                controller: passwordController,
                                cursorColor: black.withOpacity(0.5),
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  LineIcons.eyeAlt,
                                  color: black.withOpacity(0.5),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: Text(
                            "Already have an Account?",
                            style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Expanded(child: Container()),
                // login button and social login
                Column(
                  children: [
                    GetBuilder<LoginController>(
                        init: LoginController(),
                      id: 'registerButton',
                      builder: (value) {
                        return value.isApiCalling? Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ):InkWell(
                          onTap: () async {
                            if (userNameController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Name");
                            } else if (emailTextController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Email");
                            } else if (passwordController.text.isEmpty) {
                              Fluttertoast.showToast(msg: "Enter Password");
                            } else {
                              bool result = await loginController.register(
                                  userNameController.text,
                                  emailTextController.text,
                                  passwordController.text);

                              if (result) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/rootApp", (route) => false);
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient:
                                    LinearGradient(colors: [secondary, primary]),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
