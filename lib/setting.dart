import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Section: Account Settings
            _buildSectionTitle('Account Settings'),
            _buildSettingItem(Icons.person, 'Personal & Profile'),
            _buildSettingItem(Icons.lock, 'Password'),
            _buildSettingItem(Icons.storage, 'Data'),

            const Divider(),

            // Section: Company
            _buildSectionTitle('Company'),
            _buildSettingItem(Icons.business, 'Company Details'),
            _buildSettingItem(Icons.people, 'Team Members', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            }),

            const Divider(),

            // Section: Format Settings
            _buildSectionTitle('Format Settings'),
            _buildSettingItem(Icons.format_shapes, 'Job Boards'),
            _buildSettingItem(Icons.work, 'Positions'),
            _buildSettingItem(Icons.block, 'Rejection Reasons'),
            _buildSettingItem(Icons.message, 'Automated Messages'),
          ],
        ),
      ),
    );
  }

  // Function to build a section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  // Function to build a setting item
  Widget _buildSettingItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
