import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/core/firebase_options.dart';
import 'package:sneaker_shop/data/datasources/firebase_api.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/presentation/pages/intro_page.dart';
import 'package:sneaker_shop/presentation/pages/notification_page.dart';
import 'package:sneaker_shop/utils/consts.dart';

final naviagtorKey = GlobalKey<NavigatorState>();
void main() async  {
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, 
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  await _setup();
  runApp(const MyApp());
}
Future<void> _setup()async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
 
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context,child)=>  MaterialApp(
        navigatorKey: naviagtorKey,
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: AppBarTheme(color: Colors.grey[300])),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/notificationScreen': (context)=> const NotificationPage(),
      },
    ),
    );
  }
}

  