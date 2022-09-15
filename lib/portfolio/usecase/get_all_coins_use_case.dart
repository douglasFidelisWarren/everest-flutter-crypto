import '../../../../domain/entities/coin.dart';
import '../../../../domain/repositories/coin_repository.dart';

class GetAllCoinsUseCase {
  final CoinRepository repository = CoinRepository();

  List<Coin> getAllCoins() {
    return repository.getAllCoins();
  }
}
