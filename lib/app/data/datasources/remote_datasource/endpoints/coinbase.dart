class Coinbase {
  static String getAllCoins() =>
      "https://api.coinbase.com/v2/assets/search?base=BRL";

  static String getCoinPrices(String coinId) =>
      "https://api.coinbase.com/v2/assets/prices/$coinId?base=BRL";
}
