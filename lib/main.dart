import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:perfume_store/prefs/shared_pref.dart';
import 'package:perfume_store/screens/auth/exploreus_screen.dart';
import 'package:perfume_store/screens/auth/forget_password_screen.dart';
import 'package:perfume_store/screens/auth/launch.dart';
import 'package:perfume_store/screens/auth/on_boarding.dart';
import 'package:perfume_store/screens/auth/signin_screen.dart';
import 'package:perfume_store/screens/auth/signup_screen.dart';
import 'package:perfume_store/screens/bn_screens/categories_screen.dart';
import 'package:perfume_store/screens/bn_screens/favorite_screen.dart';
import 'package:perfume_store/screens/bn_screens/home_screen.dart';
import 'package:perfume_store/screens/bn_screens/product_details_screen.dart';
import 'package:perfume_store/screens/bn_screens/products_screen.dart';
import 'package:perfume_store/screens/bn_screens/sub_categories_screen.dart';
import 'package:perfume_store/screens/main_screen.dart';
import 'package:perfume_store/screens/profile/contact_request.dart';
import 'package:perfume_store/screens/profile/faq.dart';
import 'package:perfume_store/screens/profile/personal_info.dart';
import 'package:perfume_store/screens/profile/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', ''), Locale('ar', '')],
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            initialRoute: '/launch_screen' ,
            //initialRoute: '/verify_code',
            routes: {
              /*    AUTH SCREENS     */
              '/launch_screen': (context) => LaunchScreen(),
              '/OnBoarding': (context) => OnBoarding(),
              '/Explore_screen': (context) => Explore(),
              '/Sign_in': (context) => SignIn(),
              '/create_account': (context) => CreateAccount(),
              '/forget_password': (context) => ForgetPassword(),
              '/home_screen': (context) => Home(),
              '/main_screen': (context) => MainScreen(),
              '/personal_info': (context) => PersonalInfo(),
              '/settings': (context) => Settings(),
              '/faq': (context) => FAQ(),
              '/contact_request': (context) => ContactRequest(),
              '/categories_screen': (context) => CategoriesScreen(),
              '/sub_category_screen' : (context)=> SubCategoriesScreen(),
              '/product_details' : (context) =>  ProductDetailsScreen(),
              '/fav_screen' : (context) => FavouriteScreen(),
              '/product_screen' : (context) => ProudctScreen()
            },
          );
        });
  }
}
