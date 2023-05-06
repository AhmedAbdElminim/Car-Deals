import 'package:car_deals/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String paymentScreenId = 'PaymentScreenId';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Credit Card',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/images/payment/visa.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/images/payment/mastercard.svg',
                          width: 35,
                          height: 35,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Card Number',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: defaultColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Card Holder Name',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: defaultColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Exp. Month',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: defaultColor,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Exp. Year',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: defaultColor,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'CVV',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: defaultColor,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () {},
                        color: defaultColor,
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Powered By ',style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),),

                        Text(
                          'PayMob',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: defaultColor,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
