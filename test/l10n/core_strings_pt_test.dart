import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/l10n_test_widget.dart';

void main() {
  testWidgets(
    "WHEN the locale is 'pt', THEN all strings are in portuguese",
    (WidgetTester tester) async {
      await tester.pumpWidget(const L10nTestWidget(locale: Locale('pt', '')));
      expect(find.text("Cripto"), findsOneWidget);
      expect(find.text("Valor total de moedas"), findsOneWidget);
      expect(find.text("Portifólio"), findsOneWidget);
      expect(find.text("Comprar"), findsOneWidget);
      expect(find.text("Movimentações"), findsOneWidget);
      expect(find.text("Criptos Disponíveis"), findsOneWidget);
      expect(find.text("Você ainda não possui nenhuma movimentação..."),
          findsOneWidget);
      expect(find.text("Detalhes"), findsOneWidget);
      expect(find.text("Preço atual"), findsOneWidget);
      expect(find.text("Variação em "), findsOneWidget);
      expect(find.text("dias"), findsOneWidget);
      expect(find.text("Quantidade"), findsOneWidget);
      expect(find.text("Valor"), findsOneWidget);
      expect(find.text("Converter moeda"), findsOneWidget);
      expect(find.text("Saldo disponível"), findsOneWidget);
      expect(find.text("insulficiente"), findsOneWidget);
      expect(find.text("Quanto você gostaria de converter?"), findsOneWidget);
      expect(find.text("Total estimado"), findsOneWidget);
      expect(find.text("Revisar"), findsOneWidget);
      expect(find.text("Revise os dados da sua conversão"), findsOneWidget);
      expect(find.text("Converter"), findsOneWidget);
      expect(find.text("Receber"), findsOneWidget);
      expect(find.text("Câmbio"), findsOneWidget);
      expect(find.text("Conversão efetuada"), findsOneWidget);
      expect(find.text("Conversão de moeda efetuada com sucesso!"),
          findsOneWidget);
      expect(find.text("Comprovante"), findsOneWidget);
      expect(find.text("Número do documento"), findsOneWidget);
      expect(find.text("Data"), findsOneWidget);
      expect(find.text("Débito"), findsOneWidget);
      expect(find.text("Crédito"), findsOneWidget);
      expect(find.text("Valor da movimentação"), findsOneWidget);
      expect(find.text("Valor da tarifa"), findsOneWidget);
      expect(find.text("Compartilhar comprovante"), findsOneWidget);
    },
  );
}
