import 'package:flutter/material.dart';
import 'package:momo_payment_plugin/momo_payment_data.dart';
import 'package:momo_payment_plugin/momo_payment_plugin.dart';
import 'package:momo_payment_plugin/momo_payment_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MomoPaymentResult _momoPaymentResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: Text('Payment with momo'),
                onPressed: () async {
                  MomoPaymentData momoPaymentData = MomoPaymentData(
                    appScheme: 'momoiqa420180417',
                    merchantname: 'MoMoTest',
                    merchantcode: 'MOMOIQA420180417',
                    amount: 2000,
                    orderId: 'aklsdlkasdashdhasd',
                    orderLabel: 'Ma giao dich',
                    merchantnamelabel: "Nha cung cap",
                    description: null,
                    requestId: 'requestId',
                    partnerCode: 'MOMOIQA420180417',
                    isDevelopmentMode: true,
                  );

                  MomoPaymentResult momoPaymentResult =
                      await MomoPaymentPlugin().requestPayment(momoPaymentData);

                  setState(() {
                    _momoPaymentResult = momoPaymentResult;
                  });
                },
              ),
              Text('Phone'),
              Text(_momoPaymentResult?.phonenumber ?? ''),
              Text('Token'),
              Text(_momoPaymentResult?.token ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
