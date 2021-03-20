import 'package:flutter/material.dart';
import './../config/palette.dart' as palette;

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedCard = 'Mastercard';
  String selectedLocation = 'Work';

  final List<String> cards = ['Mastercard', 'Wallet', 'COD'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(
              'Checkout',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                letterSpacing: .1,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping To:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  'Add location',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: .1,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLocation = 'Work';
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: palette.background.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Radio(
                        value: 'Work',
                        groupValue: selectedLocation,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                        activeColor: palette.background,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Work Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('9876543210'),
                          SizedBox(height: 8.0),
                          Text('1838  George Street, Yankeetown, FL'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedLocation = 'Home';
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: palette.background.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                      width: 25,
                      child: Radio(
                        value: 'Home',
                        groupValue: selectedLocation,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                        activeColor: palette.background,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('9876543210'),
                          SizedBox(height: 8.0),
                          Text('1017 Hemlock Lane, San Benito, TX'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 35),
            Text(
              'Select Card:',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'Mastercard';
                });
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/mastercard.png'),
                    width: 35,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(child: Text('Mastercard')),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Radio(
                      value: 'Mastercard',
                      groupValue: selectedCard,
                      onChanged: (value) {
                        setState(() {
                          selectedCard = value;
                        });
                      },
                      activeColor: palette.background,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'Wallet';
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image(
                      image: AssetImage('assets/images/wallet.png'),
                      width: 25,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(child: Text('Wallet')),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Radio(
                      value: 'Wallet',
                      groupValue: selectedCard,
                      onChanged: (value) {
                        setState(() {
                          selectedCard = value;
                        });
                      },
                      activeColor: palette.background,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = 'COD';
                });
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image(
                      image: AssetImage('assets/images/money.png'),
                      width: 25,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(child: Text('Cash on Delivery')),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Radio(
                      value: 'COD',
                      groupValue: selectedCard,
                      onChanged: (value) {
                        setState(() {
                          selectedCard = value;
                        });
                      },
                      activeColor: palette.background,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
