import 'package:final_project/core/cubits/language_cubit/languages_cubit.dart';
import 'package:final_project/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:final_project/core/utils/app_router.dart';
import 'package:final_project/core/utils/my_bloc_observer.dart';
import 'package:final_project/core/utils/service_locator.dart';
import 'package:final_project/core/utils/shared_pref.dart';
import 'package:final_project/core/utils/themes.dart';
import 'package:final_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await initSharedPrefernce();
  
  // استرجاع القيم المحفوظة في SharedPreferences
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  String savedLanguage = prefs.getString('language') ?? 'en';
  
  runApp(MyApp(locale: Locale(savedLanguage), isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDarkMode, required this.locale});
  final bool isDarkMode;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // مزود إدارة اللغة
        BlocProvider(
          create: (context) => LanguageCubit()..changeLanguage(locale.languageCode),
        ),
        // مزود إدارة الوضع الليلي
        BlocProvider(
          create: (context) => ThemeCubit()..toggleTheme(isDarkMode),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                locale: locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                themeMode: themeMode, // تحديث الثيم بناءً على الحالة
                theme: lightMode,
                darkTheme: darkTheme,
                routerConfig: AppRouter.router,
              );
            },
          );
        },
      ),
    );
  }
}
