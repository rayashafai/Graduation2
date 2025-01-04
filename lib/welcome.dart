import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        backgroundColor: Colors.brown[400], // Brown AppBar color
        actions: [
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              Navigator.pushNamed(context, '/signin');
            },
          ),
          IconButton(
            icon: const Icon(Icons.app_registration),
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s', // Path to your image
            fit: BoxFit.cover, // Make the image cover the entire screen
            width: double.infinity, // Full width of the screen
            height: double.infinity, // Full height of the screen
          ),
          // Content on top of the background
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Shine Craft!',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[400], // Brown color for text
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Please sign in, sign up, or log in as admin to continue.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown[400]!
                        .withOpacity(0.8), // Brown with opacity
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    // Sign In button
                    SizedBox(
                      width: double.infinity, // Full width for Sign In button
                      height: 60, // Fixed height for Sign In button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.brown[400], // Updated parameter
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Sign Up button
                    SizedBox(
                      width: double.infinity, // Full width for Sign Up button
                      height: 60, // Fixed height for Sign Up button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.brown[400], // Updated parameter
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Admin Login button
                    SizedBox(
                      width:
                          double.infinity, // Full width for Admin Login button
                      height: 60, // Fixed height for Admin Login button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/adminlogin');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.red[400], // Red for admin login
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Admin Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
