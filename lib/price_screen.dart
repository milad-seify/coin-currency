import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "coin_data.dart";
import 'show_card_currency.dart';
import 'dart:io' show Platform;

//we could use for another decision ... show/as/hide

//const uri = 'https://rest.coinapi.io/v1/exchangerate/BTC/$selectCurrency?apikey=B65B2E27-E740-4A79-9F8A-08ACBFD329AB';
class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  String selectCurrency = 'USD';
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  DropdownButton<String> getAndroidDropDownBotton() {
    List<DropdownMenuItem<String>> dropDownMenuItem = [];
    for (String currency in currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownMenuItem.add(newItem);
    }
    return DropdownButton<String>(
      value: selectCurrency,
      icon: Icon(
        Icons.currency_exchange,
        color: Colors.blue[900],
      ),
      elevation: 40,
      style: const TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      // underline: Container(
      //   height: 2,
      //   color: Colors.blue.shade300,
      // ),
      items: dropDownMenuItem,
      onChanged: (value) {
        setState(() {
          selectCurrency = value!;
          getData();
        });
      },
    );
  }

  CupertinoPicker getIosPicker() {
    List<Text> pick = [];
    for (String currency in currenciesList) {
      pick.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: true,
      itemExtent: 32.0,
      onSelectedItemChanged: (int itemSelect) {
        setState(() {
          selectCurrency = currenciesList[itemSelect];
          getData();
        });
      },
      children: pick,
    );
  }

  void getData() async {
    isWaiting = true;
    try {
      Map<String, String> data = await CoinData().getCoinData(selectCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<ShowCurrency> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        ShowCurrency(
          selectCoin: crypto,
          selectCurrency: selectCurrency,
          price: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 8, child: makeCards()),
          Expanded(
            flex: 1,
            child: Container(
              height: 50.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.blueGrey,
              child:
                  Platform.isIOS ? getIosPicker() : getAndroidDropDownBotton(),
            ),
          ),
        ],
      ),
    );
  }
}
