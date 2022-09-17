// import 'dart:convert';

// class Coin {
//   final String image;
//   final String name;
//   final String symbol;
//   final String latest;
//   final String amount;
//   Coin({
//     required this.image,
//     required this.name,
//     required this.symbol,
//     required this.latest,
//     required this.amount,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'image': image});
//     result.addAll({'name': name});
//     result.addAll({'symbol': symbol});
//     result.addAll({'latest': latest});

//     return result;
//   }

//   factory Coin.fromMap(Map<String, dynamic> map) {
//     return Coin(
//       image: map['image'] ?? '',
//       name: map['name'] ?? '',
//       symbol: map['symbol'] ?? '',
//       latest: map['latest'] ?? '',
//       amount: map['amount'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));
// }
