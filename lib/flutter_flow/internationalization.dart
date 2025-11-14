import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? frText = '',
  }) =>
      [arText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ContactCopy
  {
    'ysa8q3qz': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'zuyrq9vo': {
      'ar': 'أرسل لنا رسالة',
      'fr': '',
    },
    'sfs54bbb': {
      'ar': 'الاسم الكامل ',
      'fr': '',
    },
    'vs58mkad': {
      'ar': 'ادخل اسمك الكامل',
      'fr': '',
    },
    'n25m5rb2': {
      'ar': 'البريد الإلكتروني',
      'fr': '',
    },
    'eswe1s92': {
      'ar': 'ادخل بريدك الإلكتروني',
      'fr': '',
    },
    'zlwf6g91': {
      'ar': 'نص الرسالة ',
      'fr': '',
    },
    'glqnmp5d': {
      'ar': 'اكتب رسالتك هنا...',
      'fr': '',
    },
    'smlmdxc0': {
      'ar': 'إرسال الرسالة',
      'fr': '',
    },
    '9it539f5': {
      'ar': 'البث المباشر',
      'fr': '',
    },
    'f6al29cz': {
      'ar': 'الترددات',
      'fr': '',
    },
    'whyutyw6': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'xyeorsc6': {
      'ar': 'برامجنا',
      'fr': '',
    },
    '2bk9eox4': {
      'ar': 'من نحن',
      'fr': '',
    },
    'lzvzu6f7': {
      'ar': 'تابعنا على منصات التواصل الاجتماعي',
      'fr': '',
    },
    'y39yqns6': {
      'ar': 'Contact',
      'fr': '',
    },
  },
  // FrequenciesCopy
  {
    'jz2nf12f': {
      'ar': 'البث المباشر',
      'fr': '',
    },
    '6ak7bi74': {
      'ar': 'الترددات',
      'fr': '',
    },
    '2d5fkdx0': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    '77rspx6i': {
      'ar': 'برامجنا',
      'fr': '',
    },
    'miey49kt': {
      'ar': 'من نحن',
      'fr': '',
    },
    'xuaz0zml': {
      'ar': 'تابعنا على منصات التواصل الاجتماعي',
      'fr': '',
    },
    'ytkw9h90': {
      'ar': 'الترددات',
      'fr': '',
    },
    '57q0gczo': {
      'ar': 'يوتلسات',
      'fr': '',
    },
    'm1zak3mv': {
      'ar': 'Eutelsat',
      'fr': '',
    },
    '47eq62zc': {
      'ar': 'متاح',
      'fr': '',
    },
    '3cd9jwyh': {
      'ar': 'الموقع المداري',
      'fr': '',
    },
    'pn38evgo': {
      'ar': '8° غربا',
      'fr': '',
    },
    '1l88vlk4': {
      'ar': 'التردد',
      'fr': '',
    },
    '95ubtolx': {
      'ar': '11096',
      'fr': '',
    },
    '4he1151f': {
      'ar': 'الاستقطاب',
      'fr': '',
    },
    'k03u99hk': {
      'ar': 'أفقي',
      'fr': '',
    },
    '0c0hm16x': {
      'ar': 'معدل الترميز',
      'fr': '',
    },
    '2g4phtm8': {
      'ar': '27500',
      'fr': '',
    },
    '2g747pqv': {
      'ar': 'معامل التصحيح',
      'fr': '',
    },
    'xjcc8l84': {
      'ar': '7/8',
      'fr': '',
    },
    'bkp98gte': {
      'ar': 'التضمين',
      'fr': '',
    },
    'wffbhw6j': {
      'ar': 'DVB-S',
      'fr': '',
    },
    'q2ia4qfz': {
      'ar': 'نايل سات',
      'fr': '',
    },
    'ftej5s3l': {
      'ar': 'Nilesat',
      'fr': '',
    },
    'bc6kenm0': {
      'ar': 'متاح',
      'fr': '',
    },
    '9sd00qmt': {
      'ar': 'الموقع المداري',
      'fr': '',
    },
    '2wvg2v31': {
      'ar': '7° غربا',
      'fr': '',
    },
    'chwh3zen': {
      'ar': 'التردد',
      'fr': '',
    },
    'bosc9zet': {
      'ar': '12034',
      'fr': '',
    },
    'ghb1cv62': {
      'ar': 'الاستقطاب',
      'fr': '',
    },
    'qinvhdug': {
      'ar': 'أفقي',
      'fr': '',
    },
    '2ts0hy8r': {
      'ar': 'معدل الترميز',
      'fr': '',
    },
    'wfrcj27d': {
      'ar': '27500',
      'fr': '',
    },
    'fqbz5oct': {
      'ar': 'معامل التصحيح',
      'fr': '',
    },
    '5dmz8b48': {
      'ar': '5/6',
      'fr': '',
    },
    'k41zkipc': {
      'ar': 'التضمين',
      'fr': '',
    },
    'b0rfoupk': {
      'ar': 'DVB-S',
      'fr': '',
    },
    'zgp4uhk9': {
      'ar': 'frequence',
      'fr': '',
    },
  },
  // InformationCopy
  {
    '2dbrroj8': {
      'ar': 'البث المباشر',
      'fr': '',
    },
    'lxexlop7': {
      'ar': 'الترددات',
      'fr': '',
    },
    'dxgzu70r': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'haz5zfn3': {
      'ar': 'برامجنا',
      'fr': '',
    },
    'w9zg61me': {
      'ar': 'من نحن',
      'fr': '',
    },
    '7yoi29da': {
      'ar': 'تابعنا على منصات التواصل الاجتماعي',
      'fr': '',
    },
    'oex9pjee': {
      'ar': 'من نحن',
      'fr': '',
    },
    'ms159ykk': {
      'ar':
          'قناة شمال أفريقيا هي منصة إعلامية متخصصة تقدم محتوى متنوعا وشاملا يلامس حياة الشعوب في شمال أفريقيا والعالم العربي. تسعى لتعزيز الوعي السياسي والثقافي والإجتماعي من خلال تقديم أخبار موثوقة وبرامج حوارية متميزة.',
      'fr': '',
    },
    'ffn7r2mb': {
      'ar': 'رؤيتنا',
      'fr': '',
    },
    '24v15k4z': {
      'ar':
          'أن نكون الصوت الإعلامي الرائد في شمال أفريقيا بتقديم محتوى موضوعيا ومتوازنا يعكس حقيقة الأحداث ويعزز التفاهم بين الشعوب',
      'fr': '',
    },
    'l4mbxw3d': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'vlj4eow2': {
      'ar': 'اتصل بنا',
      'fr': '',
    },
    '1t8u6kez': {
      'ar': 'Home',
      'fr': '',
    },
  },
  // ProgrammeCopy
  {
    '63kgvfeh': {
      'ar': 'البث المباشر',
      'fr': '',
    },
    'rctwklu7': {
      'ar': 'الترددات',
      'fr': '',
    },
    'r5croz89': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'd4lxgiub': {
      'ar': 'برامجنا',
      'fr': '',
    },
    'ssu05equ': {
      'ar': 'من نحن',
      'fr': '',
    },
    '6fuc8vi8': {
      'ar': 'تابعنا على منصات التواصل الاجتماعي',
      'fr': '',
    },
    'ak61bxgt': {
      'ar': 'برامجنا',
      'fr': '',
    },
    '4w3h9zbm': {
      'ar': 'Programme',
      'fr': '',
    },
  },
  // liveCopyCopy
  {
    'acmf0zbi': {
      'ar': 'البث المباشر',
      'fr': '',
    },
    'lzx9ab9f': {
      'ar': 'الترددات',
      'fr': '',
    },
    'q68w8bdi': {
      'ar': 'تواصل معنا',
      'fr': '',
    },
    'bk8t3vv1': {
      'ar': 'برامجنا ',
      'fr': '',
    },
    '0dnrecuv': {
      'ar': 'من نحن',
      'fr': '',
    },
    '9g80y9yw': {
      'ar': 'تابعنا على منصات التواصل الاجتماعي',
      'fr': '',
    },
    'qr4eoh2c': {
      'ar': 'live',
      'fr': '',
    },
  },
  // videopage
  {
    'sad71tgv': {
      'ar': 'Home',
      'fr': '',
    },
  },
  // playlistpage
  {
    'kcon18xc': {
      'ar': 'Home',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'y4c51v09': {
      'ar': '',
      'fr': '',
    },
    'qbuu9u58': {
      'ar': '',
      'fr': '',
    },
    'lz2q2cqn': {
      'ar': '',
      'fr': '',
    },
    'ijh9cy6l': {
      'ar': '',
      'fr': '',
    },
    'soqo9ejf': {
      'ar': '',
      'fr': '',
    },
    'rf1qdxz6': {
      'ar': '',
      'fr': '',
    },
    'ch571q1p': {
      'ar': '',
      'fr': '',
    },
    'ezi16upb': {
      'ar': '',
      'fr': '',
    },
    '0x1vr55h': {
      'ar': '',
      'fr': '',
    },
    'ae9cpwdw': {
      'ar': '',
      'fr': '',
    },
    '82vd5y3b': {
      'ar': '',
      'fr': '',
    },
    'ljefjbg7': {
      'ar': '',
      'fr': '',
    },
    'yxt0eo5f': {
      'ar': '',
      'fr': '',
    },
    'my1v04aw': {
      'ar': '',
      'fr': '',
    },
    'hw99w7vu': {
      'ar': '',
      'fr': '',
    },
    '6455heos': {
      'ar': '',
      'fr': '',
    },
    '4o6dtozw': {
      'ar': '',
      'fr': '',
    },
    'xjc28hcj': {
      'ar': '',
      'fr': '',
    },
    'uv09jlyk': {
      'ar': '',
      'fr': '',
    },
    'ucv9a47b': {
      'ar': '',
      'fr': '',
    },
    'y0yefh0f': {
      'ar': '',
      'fr': '',
    },
    'k4n6i2i5': {
      'ar': '',
      'fr': '',
    },
    'nzrdovuj': {
      'ar': '',
      'fr': '',
    },
    'hb8bsjrm': {
      'ar': '',
      'fr': '',
    },
    'hwiiu8km': {
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
