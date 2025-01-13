import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider for state management
import 'package:google_maps_flutter/google_maps_flutter.dart'; // For Google Maps
import 'cartmodel.dart'; // Import CartModel for Provider

// Import all required pages
import 'welcome.dart';
import 'signin.dart';
import 'signup.dart';
import 'home.dart';
import 'whitemirror.dart';
import 'windowsmirror.dart';
import 'detailspage.dart';
import 'profile.dart';
import 'editprofile.dart';
import 'adminlogin.dart';
import 'admin.dart';
import 'cart.dart';
import 'pay.dart';
import 'bookingDate.dart';
import 'map.dart';
import 'employees.dart';
import 'empNotification.dart';
import 'notification.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(), // CartModel provided globally
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown, // Brown as the primary color
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Welcome page as the initial route
      onGenerateRoute: _generateRoute, // Dynamic route generator
    );
  }

  // Route generator for dynamic navigation
  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const WelcomePage());
      case '/signin':
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case '/whitemirror':
        return MaterialPageRoute(builder: (context) => const WhiteMirrorPage());
      case '/windowsmirror':
        return MaterialPageRoute(
            builder: (context) => const WindowsMirrorPage());
      case '/pay':
        return MaterialPageRoute(builder: (context) => PaymentPage());
      case '/cart':
        return MaterialPageRoute(builder: (context) => CartPage());
      case '/bookingDate':
        return MaterialPageRoute(builder: (context) => BookingPage());
      case '/employees':
        return MaterialPageRoute(builder: (context) => const EmployeesPage());
      case '/map':
        final args = settings.arguments as Map<String, LatLng>;
        return MaterialPageRoute(
          builder: (context) => MapPage(
            startPoint: args['startPoint']!,
            endPoint: args['endPoint']!,
          ),
        );
      case '/detailspage':
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            name: args['name']!,
            price: args['price']!,
            image: args['image']!,
          ),
        );
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case '/editProfile':
        return MaterialPageRoute(builder: (context) => const EditProfilePage());
      case '/adminlogin':
        return MaterialPageRoute(builder: (context) => const AdminLoginPage());
      case '/admin':
        return MaterialPageRoute(builder: (context) => const AdminPage());
      case '/empNotification':
        return MaterialPageRoute(
          builder: (context) => EmpNotificationPage(
            onSendNotification: (String title, String message) {
              // Handle sending notification logic here
              print('Notification Sent: Title: $title, Message: $message');
            },
          ),
        );

      case '/notification':
        final notifications = settings.arguments as List<Map<String, String>>;
        return MaterialPageRoute(
          builder: (context) => NotificationsPage(
            notifications:
                notifications, // Pass the required list of notifications
            onSendNotification: (String title, String message) {
              // Handle notification logic here
              print('Notification Sent: Title: $title, Message: $message');
            },
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const WelcomePage());
    }
  }
}
