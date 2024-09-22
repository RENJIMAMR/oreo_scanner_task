import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/utils/constants/color_constants.dart';
import 'package:oreo_scanner_task/utils/constants/image_constants.dart';
import 'package:oreo_scanner_task/view/bottom_nav_bar_screen/botttom_nav_bar_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  late final SharedPreferences prefs;
  bool checked = false;
  @override
  void initState() {
    login();

    super.initState();
  }

  login() async {
    prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = await prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBarScreen(),
          ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                height: 330,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.loginBg),
                        fit: BoxFit.cover)),
                // child: Image.asset(ImageConstants.loginOreo),
              ),
              Positioned(
                top: 100,
                left: 40,
                child: Container(
                  height: 110,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ImageConstants.loginBg,
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 27, right: 31),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 35,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      controller: mailcontroller,
                      validator: (value) {
                        if (mailcontroller.text != null &&
                                mailcontroller.text.isNotEmpty &&
                                mailcontroller.text.contains('@gmail') ||
                            mailcontroller.text.contains('.in')) {
                          return null;
                        } else {
                          return 'Enter Valid Email';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter the mail Id',
                          hintStyle: TextStyle(
                              color: ColorConstants.greyMain, fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color:
                                      ColorConstants.greyMain.withOpacity(.3),
                                  width: 1))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (passcontroller.text != null ||
                            passcontroller.text.isNotEmpty ||
                            mailcontroller.text.length >= 5 ||
                            mailcontroller.text.length <= 12) {
                          return null;
                        } else {
                          return 'Enter Valid Password';
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter the password',
                          hintStyle: TextStyle(
                              color: ColorConstants.greyMain, fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color:
                                      ColorConstants.greyMain.withOpacity(.3),
                                  width: 1))),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checked,
                          onChanged: (value) async {
                            setState(() {
                              checked = value!;
                            });
                            if (checked) {
                              await prefs.setString(
                                  'uname', mailcontroller.text);
                              await prefs.setString(
                                  'pass', passcontroller.text);
                              await prefs.setBool('isLoggedIn', true);
                            }
                          },
                        ),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                              color: ColorConstants.blackMain,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'Forgot Password? ',
                          style: TextStyle(
                              color: ColorConstants.blueMain,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BottomNavBarScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: ColorConstants.pink,
                                content: Text(
                                  'Invalid Crdentials',
                                  style: TextStyle(
                                      color: ColorConstants.whiteMain,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )));
                          }
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 70,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(ImageConstants.loginBg),
                                  fit: BoxFit.cover)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: ColorConstants.whiteMain,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
