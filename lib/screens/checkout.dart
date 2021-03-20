import 'package:flutter/material.dart';
import './../config/palette.dart' as palette;
import './../models/card.dart';
import './../models/location.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedCard = 'Mastercard';
  String selectedLocation = 'Work';

  final List<CardModel> cards = [
    CardModel(name: 'Mastercard', image: 'assets/images/mastercard.png'),
    CardModel(name: 'Wallet', image: 'assets/images/wallet.png'),
    CardModel(name: 'COD', image: 'assets/images/money.png'),
  ];

  final List<LocationModel> locations = [
    LocationModel(
        id: 'Work',
        name: 'Work Location',
        contact: '9876543210',
        address: '1838 George Street, Yankeetown, FL'),
    LocationModel(
        id: 'Home',
        name: 'Home Location',
        contact: '9876543210',
        address: '1017 Hemlock Lane, San Benito, TX')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(15.0),
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
          locationsBuilder(),
          SizedBox(height: 20),
          Text(
            'Select Card:',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 15),
          cardsBuilder(),
        ],
      ),
    );
  }

  ListView locationsBuilder() {
    return ListView.separated(
      itemCount: locations.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedLocation = locations[index].id;
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
                    value: locations[index].id,
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
                        locations[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(locations[index].contact),
                      SizedBox(height: 8.0),
                      Text(locations[index].address),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 15.0),
    );
  }

  ListView cardsBuilder() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCard = cards[index].name;
            });
          },
          child: Row(
            children: [
              Padding(
                padding: index == 0
                    ? const EdgeInsets.symmetric(horizontal: 0)
                    : const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image(
                  image: AssetImage(cards[index].image),
                  width: index == 0 ? 35 : 25,
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(child: Text(cards[index].name)),
              SizedBox(
                width: 25,
                height: 25,
                child: Radio(
                  value: cards[index].name,
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
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 15),
    );
  }
}
