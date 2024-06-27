import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/page/welcome_view.dart';
import 'package:flutter_application_1/src/page/login_view.dart';
import 'package:flutter_application_1/src/page/register_view.dart';
import 'package:flutter_application_1/src/page/dashboard_view.dart';
import 'package:flutter_application_1/src/page/day_view.dart';
import 'package:flutter_application_1/src/page/week_view.dart';
import 'package:flutter_application_1/src/page/month_view.dart';
import 'package:flutter_application_1/src/page/financial_advisors_view.dart'; // Ensure this import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoFinance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeView(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/dashboard': (context) => const DashboardView(),
        '/dayView': (context) => const DayView(),
        '/weekView': (context) => const WeekView(),
        '/monthView': (context) => const MonthView(),
        '/financialAdvisors': (context) => const FinancialAdvisorsView(), // Route for the new view
      },
    );
  }
}
