import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/helpers/helper.dart';
import 'package:perfume_store/models/product_details.dart';
import 'package:perfume_store/prefs/shared_pref.dart';
import 'package:perfume_store/widget/constants.dart';

class ProductDetailsScreen extends StatefulWidget {


  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with Helper {
  final List<String> imgList = [
    'images/p10.jpg',
    'images/p2.jpg',
    'images/p3.jpg',
    'images/p4.jpg',
    'images/p5.jpg',
    'images/p8.jpg'
  ];
  void initState() {
    super.initState();
  }

  int cardIncrement = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: mainColor,
          title:  Text(
            'Proudct details',
            style: GoogleFonts.poppins( fontWeight: FontWeight.bold, color: Colors.white,),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [

            Container(
              margin: EdgeInsets.only(top: 25.h),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map(
                      (item) => Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.asset(
                        item,
                        fit: BoxFit.contain,
                        width: 500.w,
                        height: 260.h,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 380,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            SharedPrefController().languageCode == 'en' ? 'nameEn' : 'nameAr',
                            style:  GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Price:\$ 25',
                        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 20.sp, fontFamily: 'Poppins'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Text(
                        'Description:',
                        style: GoogleFonts.poppins(fontSize: 20, color: secoundColor, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          SharedPrefController().languageCode == 'en' ? 'infoEn' : 'infoAr',
                          style:  TextStyle(
                            color: textColor2,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
