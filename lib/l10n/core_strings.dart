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

  /// Coin wallet title
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// Total value of cryptos user
  ///
  /// In en, this message translates to:
  /// **'Total value of cryptos'**
  String get walletTotalAmount;

  /// Portfolio page title
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// Puchase page title
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  ///
  ///
  /// In en, this message translates to:
  /// **'Available crypto'**
  String get availableCoins;

  /// Don't have any moves message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any moves yet...'**
  String get noMovements;

  /// Details page tilte
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Details page current price
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// Details page variation in seted days
  ///
  /// In en, this message translates to:
  /// **'Variation in '**
  String get percentVariation;

  /// Details page variation in seted days
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// Details page amount of coin user
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get detailsAmount;

  ///
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// Details page total value of coin
  ///
  /// In en, this message translates to:
  /// **'Convert crypto'**
  String get converCoin;

  /// Convert page title
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convertTitle;

  /// Convert page balance available of seted coin and error message
  ///
  /// In en, this message translates to:
  /// **'Balance available'**
  String get balanceAvailable;

  /// Convert page error message
  ///
  /// In en, this message translates to:
  /// **'insufficient'**
  String get insufficient;

  /// Convert page query
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get convertQuery;

  /// Convert page botton sheet
  ///
  /// In en, this message translates to:
  /// **'Estimated total'**
  String get estimatedTotal;

  /// Review page title
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewTitle;

  /// Review page message
  ///
  /// In en, this message translates to:
  /// **'Review your conversion'**
  String get reviewAlert;

  /// Review page convert receive amount
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// Review page seted exchange
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// Successful title message from convert
  ///
  /// In en, this message translates to:
  /// **'Successful'**
  String get convertConfirmTitle;

  /// Successful subtitle message from convert
  ///
  /// In en, this message translates to:
  /// **'Currency conversion successful!'**
  String get convertConfirmSubtitle;

  /// Movements page tilte
  ///
  /// In en, this message translates to:
  /// **'Movements'**
  String get movementsTitle;

  /// Bottom modal movement receipt title
  ///
  /// In en, this message translates to:
  /// **'Movement receipt'**
  String get movementReceipt;

  /// Bottom modal movement receipt document number
  ///
  /// In en, this message translates to:
  /// **'Document number'**
  String get documentNumber;

  /// Bottom modal movement receipt date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Bottom modal movement receipt debt coin
  ///
  /// In en, this message translates to:
  /// **'Debt'**
  String get debtCoin;

  /// Bottom modal movement receipt credit coin
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get creditCoin;

  /// Bottom modal movement receipt value of exchange
  ///
  /// In en, this message translates to:
  /// **'Movement value'**
  String get movementValue;

  /// Bottom modal movement receipt value of exchange rate
  ///
  /// In en, this message translates to:
  /// **'Rate value'**
  String get rateValue;

  /// Bottom modal movement receipt button
  ///
  /// In en, this message translates to:
  /// **'Receipt share'**
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
