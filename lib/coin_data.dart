import 'network.dart';

const apiKey = 'B65B2E27-E740-4A79-9F8A-08ACBFD329AB';
const apiKeyb = 'FC05A8D9-9CBE-4661-B819-BF5FB0F617FD';
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
//TODO : you can add you crypto to this list
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'ADA',
  'DOGE',
  'MATIC',
  'SOL',
  'SHIB',
];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';

      var decodedData = await Network(uri: requestURL).getHttpData();
      double price = decodedData['rate'];
      cryptoPrices[crypto] = price.toStringAsFixed(2);
    }

    return cryptoPrices;
  }
}
