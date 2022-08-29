import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/helpers/helper.dart';
import 'package:perfume_store/models/city.dart';
import 'package:perfume_store/models/register_user.dart';
import 'package:perfume_store/screens/auth/verify_code.dart';
import 'package:perfume_store/widget/constants.dart';
import 'package:perfume_store/widget/custom_text_feild.dart';
import 'package:perfume_store/widget/widget_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> with Helper {
  final List<City> _cities = <City>[
    City.newC(1, "غزة", "Gaza"),
    City.newC(2, "خانيونس", "Khanyounes"),
    City.newC(3, "رفح", "Rafah"),
  ];
  bool createDrop = false;
  City dropdownvalue = City.newC(5, "اختر مدينة", "select city");

  String indexcity = '';
  String _gender = 'M';
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _nameTextEditingController;
  late TextEditingController _passwordTextEditingController;

  int _cityId = 1;

  var _selectedCountryId = 1;

  @override
  void initState() {
    // TODO: implement initState
    _phoneTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Welcome New User ...',
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              Text(
                'Sign Up ',
                style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: secoundColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppTextField(
                hint: 'Name',
                controller: _nameTextEditingController,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 15.h,
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
                  prefixIcon: Icons.lock),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: const Text(
                      'Choose Your City :',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: DropdownButton<int>(
                      hint: const Text('Select your Country'),
                      style: GoogleFonts.montserrat(color: Colors.black),
                      onTap: () {},
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // itemHeight: 65,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      // underline: const Divider(
                      //   color: Colors.black,
                      //   thickness: 1,
                      //   height: 0,
                      // ),
                      isExpanded: false,
                      value: _selectedCountryId,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedCountryId = value!;
                        });
                      },
                      items: _cities.map(
                        (country) {
                          return DropdownMenuItem<int>(
                            value: country.id,
                            child: Text(
                              country.nameEn,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                              color: mainColor),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title:
                    const Text('Male', style: TextStyle(fontFamily: 'Poppins')),
                value: 'M',
                groupValue: _gender,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {

                      _gender = value;
                      print(_gender);
                    });
                  }
                },
              ),
              RadioListTile<String>(
                contentPadding: EdgeInsets.zero,
                title: const Text('Female',
                    style: TextStyle(fontFamily: 'Poppins')),
                value: 'F',
                groupValue: _gender,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {

                      _gender = value;
                      print(_gender);
                    });
                  }
                },
              ),
              WidgetButton(
                onPress: () async => await performRegister(),
                text: 'Register',
                color: mainColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account?',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => Navigator.pushReplacementNamed(
                              context,
                              '/Sign_in',
                            ),
                      text: 'Sign In ',
                      style: GoogleFonts.poppins(
                        color: secoundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_phoneTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _cities.isNotEmpty &&
        _gender.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {

    Navigator.pushReplacementNamed(
      context,
      '/Sign_in',
    );
  }

  RegisterUser get user {
    RegisterUser user = RegisterUser();
    user.name = _nameTextEditingController.text;
    user.password = _passwordTextEditingController.text;
    user.mobile = _phoneTextEditingController.text;
    user.gender = _gender;
    user.cityId = _cityId;
    return user;
  }
}
