class Coinbase {
  static String getAllCoins() =>
      "http://api.coinbase.com/v2/assets/search?base=BRL";

  static String getCoinPrices(String coinId) =>
      "http://api.coinbase.com/v2/assets/prices/$coinId?base=BRL";
}
