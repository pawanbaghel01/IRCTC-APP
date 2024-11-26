import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/feature/signuppage/signup_controller.dart';

import '../../helper/UiHelper.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create a new account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Row(
                children: [
                  Text(
                    "Hello ,welcome back !",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(Icons.front_hand_outlined, color: Colors.yellow)
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('assets/logo3.png'),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Form(
                  key: controller.signupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child:customTextField('Name','Enter Name',TextInputType.name,Icons.person,controller.nameController),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: customTextField('Email ID','Enter Email',TextInputType.emailAddress,Icons.email,controller.emailController),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: customTextField('Mobile','Enter Mobile',TextInputType.phone,Icons.phone,controller.mobileController),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),
                        child:  Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: controller.isSet.value,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                label: const Text("Password"),
                                prefixIcon:const Icon(Icons.lock),
                                hintText: "Enter password",
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.elliptical(12, 12)),
                                ),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.isSet.value =
                                      !controller.isSet.value;
                                    },
                                    icon: controller.isSet.value
                                        ? const Icon(FeatherIcons.eyeOff)
                                        : const Icon(FeatherIcons.eye))),
                              validator: (value) {
                                if(value == ''){
                                 return 'Please Enter Password';
                                }
                                if(value!.length < 6){
                                  return 'Password should be contains 6 character';
                                }
                                return null;
                              },
                        ),)
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: SizedBox(
                          width: 400,
                          child: ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                controller.checkValidation();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo.shade900,
                                fixedSize: Size(400, 60)
                              ),
                              child: const Text(" SignUp ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25))),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25.0, bottom: 23),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Divider(
                              indent: 5,
                              endIndent: 5,
                            )),
                            Text("or SignUp with",
                                style: TextStyle(fontSize: 14)),
                            Expanded(
                                child: Divider(
                              indent: 5,
                              endIndent: 5,
                            )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0, left: 25, right: 25, bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 75,
                                height: 45,
                                child: InkWell(
                                    onTap: () {
                                      controller.signUpWithFacebook();
                                    },
                                    child: const Center(
                                      child: Icon(Icons.facebook,size: 40,)))
                                      ),
                            SizedBox(
                                width: 75,
                                height: 45,
                                child: InkWell(
                                    onTap: () {
                                      controller.signUpWithGoogle();
                                    },
                                    child: Center(
                                        child: Image.asset(
                                      "assets/googleicon.png",
                                      height: 32,
                                    )))),
                            SizedBox(
                                width: 75,
                                height: 45,
                                child: InkWell(
                                    onTap: () {
                                      controller.signUpWithPhone();
                                    },
                                    child:
                                        const Center(child: Icon(Icons.phone,size: 32,)))),
                          ],
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),
                            ),
                            InkWell(
                                onTap: () {
                                  controller.gotoLoginPage();
                                },
                                child: (const Text(" Login ",
                                    style: TextStyle(color: Colors.blue,fontSize: 16),
                                    textAlign: TextAlign.start)))
                          ],
                        ),
                      ),
                    const  SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
