import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perfume_store/widget/widget_button.dart';
class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

            body: Stack(

              children: [
                // Image.asset('images/Pattern.png'),
                SizedBox(height: 20.h,),
                Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/logo.png', width: 80.w,),
                    SizedBox(width: 12.w,),
                    Text('Perfume',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            fontFamily: 'Poppins')),
                    Text('Store',
                        style: TextStyle(
                            color: HexColor("#07BFA5"),
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                            fontFamily: 'Poppins')),
                  ],
                ),),
                Column(

                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: WidgetButton(onPress: (){
                        Navigator.pushNamed(context, '/OnBoarding');
                      }, text: 'Explore Us', color: Colors.black),
                    ),

                  ]
                )
              ],
            )
    );
  }
}
