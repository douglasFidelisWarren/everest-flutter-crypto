import '../model/coin.dart';
import '../repositories/coin_repository.dart';

class GetAllCoinsUseCase {
  final CoinRepository repository = CoinRepository();

  List<Coin> getAllCoins() {
    return repository.getAllCoins();
  }
}
