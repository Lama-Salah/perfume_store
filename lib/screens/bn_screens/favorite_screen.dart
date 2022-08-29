import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perfume_store/models/product_details.dart';
import 'package:perfume_store/screens/bn_screens/product_details_screen.dart';
import 'package:perfume_store/widget/constants.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<ProudctDetails> _favourite = <ProudctDetails>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          'favourite ',
          style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        elevation: 0,
        backgroundColor: mainColor,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/main_screen');
          },
        ),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        itemCount:10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
            },
            child: SizedBox(
              height: 350,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                child: Image.asset(
                  'images/p10.jpg',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
