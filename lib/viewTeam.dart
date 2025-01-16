import 'package:flutter/material.dart';

class ViewTeamPage extends StatefulWidget {
  const ViewTeamPage({Key? key}) : super(key: key);

  @override
  _ViewTeamPageState createState() => _ViewTeamPageState();
}

class _ViewTeamPageState extends State<ViewTeamPage> {
  final List<Map<String, dynamic>> teamMembers = [
    {
      'name': 'John Doe',
      'role': 'Software Engineer',
      'status': 'Available',
      'image': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
    {
      'name': 'Jane Smith',
      'role': 'Product Manager',
      'status': 'On Leave',
      'image': 'https://randomuser.me/api/portraits/women/2.jpg',
    },
    {
      'name': 'Emily Johnson',
      'role': 'Designer',
      'status': 'Available',
      'image': 'https://randomuser.me/api/portraits/women/3.jpg',
    },
    {
      'name': 'Michael Brown',
      'role': 'QA Engineer',
      'status': 'Busy',
      'image': 'https://randomuser.me/api/portraits/men/4.jpg',
    },
  ];

  String searchQuery = '';
  String selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredTeamMembers = teamMembers.where((member) {
      final matchesSearchQuery = member['name']
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
      final matchesStatus =
          selectedStatus == 'All' || member['status'] == selectedStatus;
      return matchesSearchQuery && matchesStatus;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Team'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH1Muu9tR08etyk7_sXXO08TRZGWFPKpzdUg&s',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildSearchAndFilterBar(),
            Expanded(
              child: filteredTeamMembers.isEmpty
                  ? const Center(
                      child: Text(
                        'No team members found.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: filteredTeamMembers.length,
                      itemBuilder: (context, index) {
                        final member = filteredTeamMembers[index];
                        return _buildTeamMemberCard(member);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilterBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedStatus,
            onChanged: (value) {
              setState(() {
                selectedStatus = value ?? 'All';
              });
            },
            items: [
              'All',
              'Available',
              'On Leave',
              'Busy',
            ].map((status) {
              return DropdownMenuItem(
                value: status,
                child: Text(status),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(Map<String, dynamic> member) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(member['image']),
        ),
        title: Text(
          member['name'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              member['role'],
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(
              'Status: ${member['status']}',
              style: TextStyle(
                fontSize: 14,
                color: member['status'] == 'Available'
                    ? Colors.green
                    : member['status'] == 'On Leave'
                        ? Colors.orange
                        : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
