import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfume_store/helpers/helper.dart';
import 'package:perfume_store/widget/constants.dart';
import 'package:perfume_store/widget/custom_text_feild.dart';
import 'package:perfume_store/widget/widget_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with Helper {
  late TextEditingController _phoneTextEditingController;
  String? _code;

  @override
  void initState() {
    // TODO: implement initState
    _phoneTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: mainColor),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    height: 180.h,
                    width: 180.w,
                    color: mainColor,
                  ),
                  Text(
                    'Forget Password..? ',
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      color: secoundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Text(
                      'Please enter your phone number, we will send an verify code.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: textColor2,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppTextField(
                    hint: 'Phone number',
                    controller: _phoneTextEditingController,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  WidgetButton(onPress: () async => await performForgetPassword(), text: ' Send', color: mainColor),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Future<void> performForgetPassword() async {}

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }
}
