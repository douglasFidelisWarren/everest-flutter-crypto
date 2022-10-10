import 'package:faker/faker.dart';

class ApiFactory {
  static Map<String, dynamic> getPrices() => {
        "prices": [
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
        ],
        "market_caps": [
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
        ],
        "total_volumes": [
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
          [
            faker.randomGenerator.integer(32),
            faker.randomGenerator.decimal(),
          ],
        ],
      };
  static List<Map<String, dynamic>> getCoinsWallet() => [
        {
          "id": faker.guid.guid(),
          "symbol": faker.lorem.word(),
          "name": faker.lorem.word(),
          "image": faker.internet.httpUrl(),
          "current_price": faker.randomGenerator.decimal(),
          "market_cap": faker.randomGenerator.integer(32),
          "market_cap_rank": faker.randomGenerator.integer(32),
          "fully_diluted_valuation": faker.randomGenerator.integer(32),
          "total_volume": faker.randomGenerator.integer(32),
          "high_24h": faker.randomGenerator.decimal(),
          "low_24h": faker.randomGenerator.decimal(),
          "price_change_24h": faker.randomGenerator.decimal(),
          "price_change_percentage_24h": faker.randomGenerator.decimal(),
          "market_cap_change_24h": faker.randomGenerator.integer(32),
          "market_cap_change_percentage_24h": faker.randomGenerator.decimal(),
          "circulating_supply": faker.randomGenerator.decimal(),
          "total_supply": faker.randomGenerator.decimal(),
          "max_supply": faker.randomGenerator.decimal(),
          "ath": faker.randomGenerator.decimal(),
          "ath_change_percentage": faker.randomGenerator.decimal(),
          "ath_date": faker.date.toString(),
          "atl": faker.randomGenerator.decimal(),
          "atl_change_percentage": faker.randomGenerator.decimal(),
          "atl_date": faker.date.toString(),
          "roi": faker.currency.random.decimal(scale: 15, min: 1),
          "last_updated": faker.date.toString(),
        }
      ];
  static List<Map<String, dynamic>> getAllCoins() => [
        {
          "id": faker.lorem.word(),
          "symbol": faker.lorem.word(),
          "name": faker.lorem.word(),
          "image": faker.internet.httpUrl(),
          "current_price": faker.randomGenerator.decimal(),
          "market_cap": faker.randomGenerator.integer(32),
          "market_cap_rank": faker.randomGenerator.integer(32),
          "fully_diluted_valuation": faker.randomGenerator.integer(32),
          "total_volume": faker.randomGenerator.integer(32),
          "high_24h": faker.randomGenerator.decimal(),
          "low_24h": faker.randomGenerator.decimal(),
          "price_change_24h": faker.randomGenerator.decimal(),
          "price_change_percentage_24h": faker.randomGenerator.decimal(),
          "market_cap_change_24h": faker.randomGenerator.integer(32),
          "market_cap_change_percentage_24h": faker.randomGenerator.decimal(),
          "circulating_supply": faker.randomGenerator.decimal(),
          "total_supply": faker.randomGenerator.decimal(),
          "max_supply": faker.randomGenerator.decimal(),
          "ath": faker.randomGenerator.decimal(),
          "ath_change_percentage": faker.randomGenerator.decimal(),
          "ath_date": faker.date.toString(),
          "atl": faker.randomGenerator.decimal(),
          "atl_change_percentage": faker.randomGenerator.decimal(),
          "atl_date": faker.date.toString(),
          "roi": null,
          "last_updated": faker.date.toString(),
        }
      ];
}
