import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:sneaker_shop/utils/consts.dart';

class StripeService{
  StripeService._();
  
  static final StripeService instance = StripeService._();

  Future<void> makePayment(int totalPrice) async{
    try {
      //we can also get whole response as String  result = await _creatPaymentIntent(10,usd);
      // and in function createPaymentIntent  we will  return if(response.data != null){return print(response.data); return response.data;}
      
      String? paymentIntentClientSecret = await _createPaymentIntent(totalPrice , "usd");
      //the total price passed here is the amount which will showed on the payment sheet pay button
      if(paymentIntentClientSecret == null) return;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
         paymentIntentClientSecret: paymentIntentClientSecret,
         merchantDisplayName: "Sneaker Shop",
         googlePay:const PaymentSheetGooglePay(
           merchantCountryCode: "IN",
           currencyCode: "INR",
           testEnv: true,
          )
        ),
      );
      await _processPayment();
     
    } catch (e) {
      print(e);
      
    }
  }
  
  Future<String?> _createPaymentIntent(int amount,String currency) async{
    try {
      final Dio dio = Dio();
      Map<String,dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency":currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":"Bearer $stripeSecretKey",
            "Content-Type":'application/x-www-form-urlencoded',
          },
        ),
      );
      if(response.data!=null){
        return response.data["client_secret"];
      }
       return null;

    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> _processPayment() async{
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  String _calculateAmount(int amount){
      final calculatedAmount = amount* 100;
      return calculatedAmount.toString();
    }
}