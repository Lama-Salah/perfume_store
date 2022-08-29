import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/widget/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications_active,
                      color: secoundColor,
                    ),
                    Text(
                      'Notification',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.payment,
                      color: secoundColor,
                    ),
                    Text(
                      'Payment Method',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.block,
                      color: secoundColor,
                    ),
                    Text(
                      'Blocked User',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.language,
                      color: secoundColor,
                    ),
                    Text(
                      'Langouges',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.local_police_outlined,
                      color: secoundColor,
                    ),
                    Text(
                      'Privacy Shortcuts',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.local_police_outlined,
                      color: secoundColor,
                    ),
                    Text(
                      'Privacy Shortcuts',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 110.h,
            child: Card(
              color: Colors.grey.shade100,
              margin: EdgeInsets.all(20),
              elevation: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.logout,
                      color: secoundColor,
                    ),
                    Text(
                      'Logout',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios, color: mainColor,))
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, '/Sign_in');
  }
}
