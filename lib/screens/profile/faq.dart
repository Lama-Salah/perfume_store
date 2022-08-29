import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/models/faq.dart';
import 'package:perfume_store/widget/constants.dart';
class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<FAQL> _faq = <FAQL>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'FAQ',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),

      body: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(20),
                 itemCount:20,
                itemBuilder: (context , index){
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         'question',
                          style:  GoogleFonts.poppins(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 20.h),
                        Text(
                          'answerEn',
                          style:  GoogleFonts.poppins(
                            color: textColor2,

                          ),
                        ),
                        SizedBox(height: 20.w,)
                      ],
                    ),
                  );

                }),

    );
  }
}
