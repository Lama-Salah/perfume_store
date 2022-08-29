import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/helpers/helper.dart';
import 'package:perfume_store/models/contact_request.dart';
import 'package:perfume_store/widget/constants.dart';
import 'package:perfume_store/widget/custom_text_feild.dart';
import 'package:perfume_store/widget/widget_button.dart';

class ContactRequest extends StatefulWidget {
  const ContactRequest({Key? key}) : super(key: key);

  @override
  _ContactRequestState createState() => _ContactRequestState();
}

class _ContactRequestState extends State<ContactRequest> with Helper {
  late TextEditingController _subjectTextEditingController;
  late TextEditingController _messageTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subjectTextEditingController = TextEditingController();
    _messageTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _subjectTextEditingController.dispose();
    _messageTextEditingController.dispose();
    // TODO: implement dispose
    super.dispose();
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
          'Contact Us',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  'images/logo.png',
                  height: 180.h,
                  width: 180.w,
                  color: mainColor,
                ),
                Text(
                  'Send a message for us !  ',
                  style: GoogleFonts.poppins(
                    color: secoundColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppTextField(
                  hint: 'Subject',
                  controller: _subjectTextEditingController,
                  prefixIcon: Icons.subject,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 16.h,
                ),
                AppTextField(
                  hint: 'Message',
                  controller: _messageTextEditingController,
                  prefixIcon: Icons.message,
                ),
                SizedBox(
                  height: 20.h,
                ),
                WidgetButton(
                  onPress: () async => await performContactRequest(),
                  text: 'Send ',
                  color: mainColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performContactRequest() async {
    if (checkData()) {
      await Request();
    }
  }

  bool checkData() {
    if (_subjectTextEditingController.text.isNotEmpty && _messageTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> Request() async {
    Navigator.pop(context);
  }

  ContactRequestModel get contactRequest {
    ContactRequestModel contact = ContactRequestModel();
    contact.message = _messageTextEditingController.text;
    contact.subject = _subjectTextEditingController.text;
    return contact;
  }
}
