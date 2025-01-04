import 'package:flutter/material.dart';

void main() {
  runApp(Pay());
}

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'Debit/Credit card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.brown[400], // AppBar color
        elevation: 0, // Remove shadow for a clean look
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(255, 228, 222, 222)
                  .withOpacity(0.6), // Dark overlay for readability
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with a beautiful question and a relevant icon
              Row(
                children: [
                  Icon(Icons.payment, color: Colors.white, size: 32),
                  SizedBox(width: 10),
                  Text(
                    'How would you like to pay?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Payment options with more beautiful icons
              _paymentMethodTile(
                context,
                'Debit/Credit card',
                Icons.credit_card,
                'Debit/Credit card',
              ),
              _paymentMethodTile(
                context,
                'Net banking',
                Icons.account_balance,
                'Net banking',
              ),
              _paymentMethodTile(
                context,
                'Paypal',
                Icons.paypal,
                'Paypal',
              ),
              _paymentMethodTile(
                context,
                'Google Pay',
                Icons.payment,
                'Google Pay',
              ),

              // Spacer to push cost summary down
              Spacer(),

              // Cost Summary
              _costSummary(),

              // Pay Now button with beautiful styling
              _payNowButton(),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        currentIndex: 1, // Set to 1 as this page is focused on Payment
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home'); // Navigate to Home
              break;
            case 1:
              // Stay on PaymentPage
              break;
            case 2:
              Navigator.pushNamed(context, '/search'); // Navigate to Search
              break;
            case 3:
              Navigator.pushNamed(context, '/profile'); // Navigate to Profile
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Method to create payment method tiles with rounded radio buttons and beautiful icons
  Widget _paymentMethodTile(
      BuildContext context, String title, IconData icon, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.brown, size: 30),
      title: Text(title, style: TextStyle(color: Colors.brown, fontSize: 18)),
      trailing: Radio<String>(
        value: value,
        groupValue: _selectedPaymentMethod,
        onChanged: (newValue) {
          if (newValue != null) {
            // Null safety check
            setState(() {
              _selectedPaymentMethod = newValue;
            });
          }
        },
        activeColor: Colors.brown,
      ),
    );
  }

  // Method to show cost summary with a minimalistic design
  Widget _costSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _costRow('Subtotal', '\$59.87'),
        _costRow('Delivery', '\$12.43'),
        Divider(color: Colors.brown),
        _costRow('Total', '\$72.30', isBold: true),
      ],
    );
  }

  // Cost row widget for displaying costs
  Widget _costRow(String label, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // Method to create a beautiful "Pay Now" button with stylish effects
  Widget _payNowButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, '/bookingDate'); // Your payment logic goes here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown[700], // Background color
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: Text(
          'Pay Now',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
