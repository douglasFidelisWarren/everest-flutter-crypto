import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_strings_en.dart';
import 'core_strings_pt.dart';

/// Callers can lookup localized strings with an instance of CoreStrings
/// returned by `CoreStrings.of(context)`.
///
/// Applications need to include `CoreStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/core_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreStrings.localizationsDelegates,
///   supportedLocales: CoreStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the CoreStrings.supportedLocales
/// property.
abstract class CoreStrings {
  CoreStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreStrings? of(BuildContext context) {
    return Localizations.of<CoreStrings>(context, CoreStrings);
  }

  static const LocalizationsDelegate<CoreStrings> delegate = _CoreStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @crypto.
  ///
  /// In pt, this message translates to:
  /// **'Cripto'**
  String get crypto;

  /// No description provided for @walletTotalAmount.
  ///
  /// In pt, this message translates to:
  /// **'Valor total de moedas'**
  String get walletTotalAmount;

  /// No description provided for @portfolio.
  ///
  /// In pt, this message translates to:
  /// **'Portifólio'**
  String get portfolio;

  /// No description provided for @purchase.
  ///
  /// In pt, this message translates to:
  /// **'Comprar'**
  String get purchase;

  /// No description provided for @movements.
  ///
  /// In pt, this message translates to:
  /// **'Movimentações'**
  String get movements;

  /// No description provided for @availableCoins.
  ///
  /// In pt, this message translates to:
  /// **'Criptos Disponíveis'**
  String get availableCoins;

  /// No description provided for @noMovements.
  ///
  /// In pt, this message translates to:
  /// **'Você ainda não possui nenhuma movimentação...'**
  String get noMovements;

  /// No description provided for @details.
  ///
  /// In pt, this message translates to:
  /// **'Detalhes'**
  String get details;

  /// No description provided for @currentPrice.
  ///
  /// In pt, this message translates to:
  /// **'Preço atual'**
  String get currentPrice;

  /// No description provided for @percentVariation.
  ///
  /// In pt, this message translates to:
  /// **'Variação em '**
  String get percentVariation;

  /// No description provided for @days.
  ///
  /// In pt, this message translates to:
  /// **'dias'**
  String get days;

  /// No description provided for @detailsAmount.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get detailsAmount;

  /// No description provided for @value.
  ///
  /// In pt, this message translates to:
  /// **'Valor'**
  String get value;

  /// No description provided for @converCoin.
  ///
  /// In pt, this message translates to:
  /// **'Converter moeda'**
  String get converCoin;

  /// No description provided for @convertTitle.
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get convertTitle;

  /// No description provided for @balanceAvailable.
  ///
  /// In pt, this message translates to:
  /// **'Saldo disponível'**
  String get balanceAvailable;

  /// No description provided for @insufficient.
  ///
  /// In pt, this message translates to:
  /// **'insulficiente'**
  String get insufficient;

  /// No description provided for @convertQuery.
  ///
  /// In pt, this message translates to:
  /// **'Quanto você gostaria de converter?'**
  String get convertQuery;

  /// No description provided for @estimatedTotal.
  ///
  /// In pt, this message translates to:
  /// **'Total estimado'**
  String get estimatedTotal;

  /// No description provided for @reviewTitle.
  ///
  /// In pt, this message translates to:
  /// **'Revisar'**
  String get reviewTitle;

  /// No description provided for @reviewAlert.
  ///
  /// In pt, this message translates to:
  /// **'Revise os dados da sua conversão'**
  String get reviewAlert;

  /// No description provided for @convert.
  ///
  /// In pt, this message translates to:
  /// **'Converter'**
  String get convert;

  /// No description provided for @receive.
  ///
  /// In pt, this message translates to:
  /// **'Receber'**
  String get receive;

  /// No description provided for @exchange.
  ///
  /// In pt, this message translates to:
  /// **'Câmbio'**
  String get exchange;

  /// No description provided for @convertConfirmTitle.
  ///
  /// In pt, this message translates to:
  /// **'Conversão efetuada'**
  String get convertConfirmTitle;

  /// No description provided for @convertConfirmSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Conversão de moeda efetuada com sucesso!'**
  String get convertConfirmSubtitle;

  /// No description provided for @movementsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Movimentações'**
  String get movementsTitle;

  /// No description provided for @movementReceipt.
  ///
  /// In pt, this message translates to:
  /// **'Comprovante'**
  String get movementReceipt;

  /// No description provided for @documentNumber.
  ///
  /// In pt, this message translates to:
  /// **'Número do documento'**
  String get documentNumber;

  /// No description provided for @date.
  ///
  /// In pt, this message translates to:
  /// **'Data'**
  String get date;

  /// No description provided for @debtCoin.
  ///
  /// In pt, this message translates to:
  /// **'Débito'**
  String get debtCoin;

  /// No description provided for @creditCoin.
  ///
  /// In pt, this message translates to:
  /// **'Crédito'**
  String get creditCoin;

  /// No description provided for @movementValue.
  ///
  /// In pt, this message translates to:
  /// **'Valor da movimentação'**
  String get movementValue;

  /// No description provided for @rateValue.
  ///
  /// In pt, this message translates to:
  /// **'Valor da tarifa'**
  String get rateValue;

  /// No description provided for @receiptShare.
  ///
  /// In pt, this message translates to:
  /// **'Compartilhar comprovante'**
  String get receiptShare;
}

class _CoreStringsDelegate extends LocalizationsDelegate<CoreStrings> {
  const _CoreStringsDelegate();

  @override
  Future<CoreStrings> load(Locale locale) {
    return SynchronousFuture<CoreStrings>(lookupCoreStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreStringsDelegate old) => false;
}

CoreStrings lookupCoreStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return CoreStringsEn();
    case 'pt': return CoreStringsPt();
  }

  throw FlutterError(
    'CoreStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
