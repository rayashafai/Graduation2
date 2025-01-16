import 'package:flutter/material.dart';

class VacationPage extends StatefulWidget {
  const VacationPage({Key? key}) : super(key: key);

  @override
  _VacationPageState createState() => _VacationPageState();
}

class _VacationPageState extends State<VacationPage> {
  int totalVacationDays = 30; // Example total vacation days
  int usedVacationDays = 10; // Example used vacation days

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  List<Map<String, dynamic>> vacationHistory =
      []; // List to store vacation history

  @override
  Widget build(BuildContext context) {
    int remainingVacationDays = totalVacationDays - usedVacationDays;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Vacation'),
        backgroundColor: const Color.fromARGB(255, 92, 141, 197),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmRqIqWA4S6GhbaNogujnGuNBZYbJVsfiyCg&s',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildVacationSummary(remainingVacationDays),
              const SizedBox(height: 20),
              _buildBookVacationForm(remainingVacationDays),
              const SizedBox(height: 30),
              _buildVacationHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVacationSummary(int remainingDays) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      color: const Color.fromARGB(255, 92, 141, 197),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Vacation Summary',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Total Vacation Days: $totalVacationDays',
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Used Vacation Days: $usedVacationDays',
              style: const TextStyle(fontSize: 18, color: Colors.white70),
            ),
            Text(
              'Remaining Vacation Days: $remainingDays',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookVacationForm(int remainingDays) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Book a Vacation',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Vacation Start Date',
                hintText: 'YYYY-MM-DD',
                prefixIcon: const Icon(Icons.date_range),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Days',
                hintText: 'Enter days',
                prefixIcon: const Icon(Icons.timer),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_dateController.text.isEmpty ||
                    _daysController.text.isEmpty) {
                  _showDialog('Error', 'Please fill in all fields.');
                  return;
                }

                int daysRequested = int.tryParse(_daysController.text) ?? 0;
                if (daysRequested > remainingDays) {
                  _showDialog(
                      'Error', 'You do not have enough vacation days left.');
                  return;
                }

                setState(() {
                  usedVacationDays += daysRequested;

                  // Add to vacation history
                  vacationHistory.add({
                    'startDate': _dateController.text,
                    'days': daysRequested,
                  });
                });

                _dateController.clear();
                _daysController.clear();
                _showDialog('Success', 'Your vacation has been booked!');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: const Color.fromARGB(255, 92, 141, 197),
              ),
              child: const Text(
                'Book Vacation',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVacationHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vacation History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 7, 14),
          ),
        ),
        const SizedBox(height: 10),
        vacationHistory.isEmpty
            ? const Text(
                'No vacations booked yet.',
                style: TextStyle(color: Colors.black54),
              )
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vacationHistory.length,
                itemBuilder: (context, index) {
                  final vacation = vacationHistory[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      leading:
                          Icon(Icons.beach_access, color: Colors.blue[800]),
                      title: Text('Start Date: ${vacation['startDate']}'),
                      subtitle: Text('Duration: ${vacation['days']} days'),
                      trailing:
                          const Icon(Icons.check_circle, color: Colors.green),
                    ),
                  );
                },
              ),
      ],
    );
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
