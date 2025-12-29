import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/firebase_options.dart';
import 'package:mobile/router/router.dart';
import 'package:mobile/utils/core/environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment.validate();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'TechnoBlog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF67A22D),
          primary: Color(0xFF67A22D),
          surface: Color(0xFFEDF2E8),
        ),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          centerTitle: false,
          shape: Border(bottom: BorderSide(color: Color(0xFFE5E8EB), width: 1)),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          titleSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF141C0D),
            fontFamily: 'Newsreader',
          ),
        ),
        fontFamily: 'Newsreader',
      ),
      routerConfig: appRouter,
    );
  }
}
