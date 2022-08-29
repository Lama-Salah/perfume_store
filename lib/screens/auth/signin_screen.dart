import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfume_store/helpers/helper.dart';
import 'package:perfume_store/widget/constants.dart';
import 'package:perfume_store/widget/custom_text_feild.dart';
import 'package:perfume_store/widget/widget_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with Helper {
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passwordTextEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _phoneTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = navigateToRegisterScreen;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/create_account');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 180.h,
                  width: 180.w,
                  color: mainColor,
                ),
                Text(
                  'Welcome back ...',
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                Text(
                  'Sign In ',
                  style: GoogleFonts.poppins(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: secoundColor,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                  hint: 'Phone number',
                  controller: _phoneTextEditingController,
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                AppTextField(
                  hint: 'password',
                  controller: _passwordTextEditingController,
                  prefixIcon: Icons.remove_red_eye_rounded,
                  obscureText: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forget_password');
                  },
                  child:  Align(
                    alignment: Alignment.topRight,
                    child: Text('Forget Password ? ', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: secoundColor)),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                WidgetButton(
                  onPress: () async => await performLogin(),
                  text: 'Sign In',
                  color: mainColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style:  TextStyle(
                      color: textColor,
                    ),
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(
                        recognizer: _tapGestureRecognizer,
                        text: 'Create Now!',
                        style:  TextStyle(color: secoundColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty && _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    Navigator.pushReplacementNamed(context, '/main_screen');
  }
}
