import 'package:flutter/material.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Salary Details'),
        backgroundColor: const Color.fromARGB(255, 109, 185, 113),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLinTjrS6pNGKcHfuuEhtpPXfDFm-eb0aqDw&s',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Salary Overview',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildSalaryCard(
                  title: 'Basic Salary',
                  amount: 'USD 3,000',
                  icon: Icons.attach_money,
                  color: Colors.blue,
                ),
                _buildSalaryCard(
                  title: 'Bonuses',
                  amount: 'USD 500',
                  icon: Icons.card_giftcard,
                  color: Colors.orange,
                ),
                _buildSalaryCard(
                  title: 'Deductions',
                  amount: 'USD -200',
                  icon: Icons.money_off,
                  color: Colors.red,
                ),
                const Divider(
                  color: Colors.white70,
                  thickness: 2,
                  height: 40,
                ),
                _buildTotalSalaryCard(),
                const SizedBox(height: 30),
                _buildPaymentHistory(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSalaryCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 8,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.7),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalSalaryCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 8,
      color: const Color.fromARGB(255, 109, 185, 113),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Net Salary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'USD 3,300',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[200],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              child: ListTile(
                leading: Icon(Icons.payment, color: Colors.green[700]),
                title: Text(
                  'Payment Date: ${DateTime.now().subtract(Duration(days: index * 30)).toLocal().toString().split(' ')[0]}',
                ),
                subtitle: const Text('Amount: USD 3,300'),
                trailing: const Icon(Icons.check_circle, color: Colors.green),
              ),
            );
          },
        ),
      ],
    );
  }
}
