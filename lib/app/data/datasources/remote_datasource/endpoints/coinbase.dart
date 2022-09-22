class Coinbase {
  static String baseUrl = "http://api.coinbase.com/v2/assets";
  static String getAllCoins = "$baseUrl/search?base=BRL";
  static String getCoinPrices(String coinId) =>
      "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart/range?vs_currency=brl&from=1663815813&to=1663816813";
}
