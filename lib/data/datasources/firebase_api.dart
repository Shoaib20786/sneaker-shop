import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sneaker_shop/main.dart';


class FirebaseApi {

  //create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotifications() async{
    //request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device
    final fCMToken = await _firebaseMessaging.getToken();

    //print the FCM token (normally you would send this to your server)
    // ignore: avoid_print
    print('Token:$fCMToken');  
  }

  // function to handle recieved messages
  void handleMessage(RemoteMessage? message){
    //if the message is null do nothing
    if(message == null){
      return;
    }

    //navigate to new screen when message is received and user taps notification
    naviagtorKey.currentState?.pushNamed(
      "/notification_screen",
      arguments: message,
    );
    
  }

  //functon to initailize foreground and background settings 
  Future initPushNotifications() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  
}