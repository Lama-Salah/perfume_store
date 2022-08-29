import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/screens/bn_screens/categories_screen.dart';
import 'package:perfume_store/screens/bn_screens/sub_categories_screen.dart';
import 'package:perfume_store/widget/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://www.pngall.com/wp-content/uploads/2016/05/Perfume-Free-PNG-Image.jpg',
    'https://m.media-amazon.com/images/I/41Bsz3INsQL._SX425_.jpg',
    'https://m.media-amazon.com/images/I/716rEXN4htL._SX425_.jpg',
    'https://m.media-amazon.com/images/I/41VIkN0BOML._SX522_.jpg',
    'https://m.media-amazon.com/images/I/51ArsfYDUQL._AC_UL320_.jpg',
    'https://www.sephora.com/productimages/sku/s513176-main-zoom.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150.h,
              width: 500.w,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map(
                      (item) => Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
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
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Text(
              'Categories',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/categories_screen');
              },
              child: Text(
                'see all  >',
                style: GoogleFonts.poppins(
                  color: mainColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 120,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/sub_category_screen');
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                    left: 10,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  height: 180,
                  width: 180,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJQef1UwXPNSPZF9s3dOA6supmr5EVUZ7XCoDQ8pCeeA-ekc_qiGgZDA5vrhzDoVdi4tA&usqp=CAU',
                        fit: BoxFit.contain,
                        width: double.infinity,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      // Container(
                      //   color: Colors.black.withOpacity(0.4),
                      //   alignment: Alignment.center,
                      //   height: 30,
                      //   child: Text(
                      //     'Coco Chanel',
                      //     style: GoogleFonts.poppins(
                      //         color: Colors.white,
                      //         fontSize: 10,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          '   Latest Products ',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/product_screen');
                },
                child: Container(
                  margin: EdgeInsets.only(
                    right: 5.w,
                    left: 5.w,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 250,
                  width: 180,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/product_details');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.icanvas.com/GRE11?d=3&sh=s&s=xl&p=1&bg=g&t=1623525259',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(bottom: 10),
                      //   color: Colors.black.withOpacity(0.4),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Center(
                      //         child: Text(
                      //           'nameEn',
                      //           style: TextStyle(
                      //               fontSize: 15.sp,
                      //               color: Colors.white.withOpacity(0.5),
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //       Center(
                      //         child: Text(
                      //           '100 \$',
                      //           style: TextStyle(
                      //               fontSize: 17.sp,
                      //               color: Colors.white.withOpacity(0.5),
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          '   Famous Products ',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
        Container(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 250,
                  width: 180,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/fav_screen');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://cdn.flaconi.de/media/catalog/product/l/a/lacoste-eau-de-lacoste-l-12-12-pour-elle-magnetic-eau-de-parfum-25-ml-8005610266398.jpg',
                            fit: BoxFit.contain,
                            width: double.infinity,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Text(
                              'nameEn',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Text(
                              '100 \$',
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )),
      ]),
    );
  }
}
