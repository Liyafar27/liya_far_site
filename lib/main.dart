import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _loadFonts() async {
    await GoogleFonts.pendingFonts([
      GoogleFonts.orbitron(),
      GoogleFonts.orbitron(fontWeight: FontWeight.bold),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.orbitronTextTheme(
      ThemeData.dark().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Colors.white, fontSize: 16),
            bodyMedium: const TextStyle(color: Colors.white70, fontSize: 14),
            displayLarge: const TextStyle(color: Colors.white, fontSize: 56),
            displayMedium: const TextStyle(color: Colors.white, fontSize: 45),
            displaySmall: const TextStyle(color: Colors.white, fontSize: 36),
          ),
    );

    return MaterialApp(
      title: 'Aliya Far - Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          background: Colors.black,
          surface: Colors.grey[900]?.withOpacity(0.3) ?? Colors.black,
          primary: const Color(0xFFCCFF00), // neon yellow-green
          secondary: const Color(0xFFFF00FF), // neon pink
          tertiary: const Color(0xFFFF0066), // neon rose
        ),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        textTheme: textTheme,
      ),
      builder: (context, child) {
        return Container(
          color: Colors.black,
          child: FutureBuilder(
            future: _loadFonts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const LoadingScreen();
              }
              return ResponsiveBreakpoints.builder(
                child: child ?? const HomeScreen(),
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          ),
        );
      },
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: HomeScreen(),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: Color(0xFFCCFF00),
                strokeWidth: 2,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(
                color: Color(0xFFCCFF00),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
