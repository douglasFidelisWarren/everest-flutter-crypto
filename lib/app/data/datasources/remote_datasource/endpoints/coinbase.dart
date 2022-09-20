class Coinbase {
  static String baseUrl = "http://api.coinbase.com/v2/assets";
  static String getAllCoins = "$baseUrl/search?base=BRL";
  static String getCoinPrices(String coinId) =>
      "$baseUrl/prices/$coinId?base=BRL";
}
