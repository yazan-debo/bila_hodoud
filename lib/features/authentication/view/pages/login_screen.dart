import 'package:bila_hodoud/features/authentication/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/style/color_style_features.dart';
import '../../model/params/login_params.dart';

import '../../../../core/components/most_used_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final LoginController? loginController = Get.find<LoginController>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginParams loginParams = LoginParams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "بلا حدود",
                      style: TextStyle(
                          fontSize: 30.px, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                ),
                SizedBox(
                    width: 80.w,
                    child: Center(
                      child: Text(
                        "لوحة تحكم المنصة",
                        style: TextStyle(
                            fontSize: 25.px, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            height: 0,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.px),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                            fontSize: 24.px, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "أدخل المعلومات الشخصية لحساب المسؤول خاصتك:",
                        style: TextStyle(
                            fontSize: 23.px, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 30.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Row(
                          children: [
                            Text(
                              "اسم المستخدم",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.px),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Center(
                                child: TextFormField(
                                  controller: userName,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 20.px),
                                  ),
                                  onChanged: (value) {},
                                  onSaved: (value) {
                                    loginParams.name = userName.text;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل قيمة';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      width: 30.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Row(
                          children: [
                            Text(
                              "كلمة المرور",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.px),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Expanded(
                              child: Center(
                                child: TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 20.px),
                                  ),
                                  onChanged: (value) {},
                                  obscureText: true,
                                  onSaved: (value) {
                                    loginParams.password = password.text;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'ادخل قيمة';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "نسيت كلمة المرور",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22.px),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 9.h,
                      width: 20.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_loginFormKey.currentState!.validate()) {
                            _loginFormKey.currentState?.save();

                            loginController?.loginApi(loginParams);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ColorStyleFeatures.mostUsedButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // Align children in the center vertically
                          children: [
                            Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.px),
                              textDirection: TextDirection
                                  .rtl, // Set text direction to right-to-left for Arabic
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),

      // Logout screen content
    );
  }
}
