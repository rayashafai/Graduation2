import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'welcome.dart'; // Import WelcomePage
import 'signin.dart'; // Import SignInPage
import 'signup.dart'; // Import SignUpPage
import 'home.dart'; // Import HomePage
import 'whitemirror.dart'; // Import WhiteMirrorPage
import 'windowsmirror.dart'; // Import WindowsMirrorPage
import 'detailspage.dart'; // Import ProductDetailPage
import 'profile.dart'; // Import ProfilePage
import 'editprofile.dart'; // Import EditProfilePage
import 'adminlogin.dart'; // Import AdminLoginPage
import 'admin.dart'; // Import AdminPage
import 'cart.dart'; // Import CartPage
import 'cartmodel.dart'; // Import CartModel
import 'pay.dart';
import 'bookingDate.dart';
import 'map.dart';
import 'employees.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(), // Provide CartModel globally
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
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set initial route to WelcomePage
      onGenerateRoute: (RouteSettings settings) {
        // Handle routes dynamically
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
            return MaterialPageRoute(
                builder: (context) => const WhiteMirrorPage());
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
            return MaterialPageRoute(
                builder: (context) => const EmployeesPage());
          case '/map':
            final args = settings.arguments
                as Map<String, LatLng>; // Expect a map with coordinates
            return MaterialPageRoute(
              builder: (context) => MapPage(
                startPoint: args['startPoint']!,
                endPoint: args['endPoint']!,
              ),
            );
          case '/detailspage':
            // Extract arguments passed to the route
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
            return MaterialPageRoute(
                builder: (context) => const EditProfilePage());
          case '/adminlogin':
            return MaterialPageRoute(
                builder: (context) => const AdminLoginPage());
          case '/admin':
            return MaterialPageRoute(builder: (context) => const AdminPage());
          default:
            return MaterialPageRoute(builder: (context) => const WelcomePage());
        }
      },
    );
  }
}
