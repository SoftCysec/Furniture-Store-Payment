import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

void main() {
  MpesaFlutterPlugin.setConsumerKey('GYRoc1hrKuGo6Pr5719svdHrqrfAHev2');
  MpesaFlutterPlugin.setConsumerSecret('RCiLzAzdp0CY5NU2');

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  // ignore: annotate_overrides
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // ignore: non_constant_identifier_names
  RaisedButton() => null;

  Future<void> lipaNaMpesa() async {
    dynamic transactionInitialisation;
    try {
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
              businessShortCode: "174379",
              transactionType: TransactionType.CustomerPayBillOnline,
              amount: 1.0,
              partyA: "254704860552",
              partyB: "174379",
//Lipa na Mpesa Online ShortCode
              callBackURL: Uri(
                  scheme: "https",
                  host: "mpesa-requestbin.herokuapp.com",
                  path: "/143yiy21"),
//This url has been generated from http://mpesa-requestbin.herokuapp.com/?ref=hackernoon.com for test purposes
              accountReference: "Okware Dedan onyanga",
              phoneNumber: "254704860552",
              baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
              transactionDesc: "purchase",
              passKey:
                  "SLJ7a8GeVLqrgp27h2B5VbnKT1nMy/ZekF9STolIxyhVtM6BOZDQamMfXmPs/oDqaOIu/F14EJX2DWK0IbYnpV0bznaJquLU7KX7FnuebZUyGu0qO7GV7olg1lKacplxqzuWiV0YTiK7t+snH+W13zw1kMpNwPnz0nMyBzTuni5Uj0YojnqFXpPqYOk7XuC4RcAbK+X8CyF4lDxW9pauz+6zhoDokav+sLgoP6j11DITniElWHGBUi5V7BR7fL0bQhrhEZfec8IgavxJWX8DQrnkGmmZcN1OPGVl5mq/VYF1d4xh2fhtjvfLhudPT0jY17lReBGsYby7u9gcQOcJQQ==");
//This passkey has been generated from Test Credentials from Safaricom Portal
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("TRANSACTION RESULT: " + transactionInitialisation.toString());
      //lets print the transaction results to console at this step
      return transactionInitialisation;
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("CAUGHT EXCEPTION: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: const Color(0xFF481E4D)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Mpesa Payment Demo'),
              centerTitle: true,
            ),
            body: Center(
                child: RaisedButton()(
                    color: const Color(0xFF481E4D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      lipaNaMpesa();
                    },
                    child: const Text(
                      "Lipa na Mpesa",
                      style: TextStyle(color: Colors.white),
                    )))));
  }
}
