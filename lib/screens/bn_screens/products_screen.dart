import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/prefs/shared_pref.dart';
import 'package:perfume_store/screens/bn_screens/product_details_screen.dart';
import 'package:perfume_store/widget/constants.dart';

class ProudctScreen extends StatefulWidget {
  @override
  _ProudctScreenState createState() => _ProudctScreenState();
}

class _ProudctScreenState extends State<ProudctScreen> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          'Products',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 24,
          childAspectRatio: 146 / 300,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/product_details');
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
              ),
              height: 220,
              width: 146,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 240.h,
                      child: CachedNetworkImage(
                        imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/31yPjqtXPnL._SX300_SY300_QL70_FMwebp_.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    SharedPrefController().languageCode == 'en' ? 'nameEn' : 'nameAr',
                    style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$20",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '20 product_available'.tr,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
