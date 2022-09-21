// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:test_stripe/payment_service.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentMethod? paymentMethod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PaymentService.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stripe Simple Tutorial')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '10\$',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              child: Text('Add a Payment Method'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40),
              ),
              onPressed: () async {
                paymentMethod = await PaymentService().createPaymentMethod();
                print(paymentMethod!.id);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Complete Payment Now'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40),
              ),
              onPressed: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
