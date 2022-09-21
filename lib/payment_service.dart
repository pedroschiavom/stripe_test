import 'package:stripe_payment/stripe_payment.dart';

class PaymentService {
  final int amount;
  final String url;

  PaymentService({
    this.amount = 10,
    this.url = '',
  });

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: 'pk_test_51LELMPJ7feOkBDjIGQjGdU7mERdVhgI5qzIY0B7GUfans3hfKvDmWVQWHlXWPsdMqxjaXmX9dwkTWJ4x0kuDXJgk00UY8Fjayg',
        androidPayMode: 'test',
        merchantId: 'test'));
  }


  Future<PaymentMethod?> createPaymentMethod() async{
    print('The transaction amount to be charged is: $amount');

    PaymentMethod paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );

    return paymentMethod;
  }

   Future<void> processPayment(PaymentMethod paymentMethod) async{}
}
