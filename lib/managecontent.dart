import 'package:flutter/material.dart';
import 'addContent.dart';

class ManageContentPage extends StatefulWidget {
  const ManageContentPage({Key? key}) : super(key: key);

  @override
  _ManageContentPageState createState() => _ManageContentPageState();
}

class _ManageContentPageState extends State<ManageContentPage> {
  final List<Map<String, String>> contentList = [
    {'title': 'Post 1', 'description': 'Description for Post 1'},
    {'title': 'Post 2', 'description': 'Description for Post 2'},
    {'title': 'Post 3', 'description': 'Description for Post 3'},
  ];

  void _addNewContent(Map<String, String> newContent) {
    setState(() {
      contentList.add(newContent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Content'),
        backgroundColor: const Color.fromARGB(255, 15, 103, 94),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPSa3gtk8Z5mK-CuoF3yPd3k_HabLrBRuowQ&s',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Content Management',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjusted for readability
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: contentList.length,
                    itemBuilder: (context, index) {
                      final content = contentList[index];
                      return _buildContentItem(
                        title: content['title']!,
                        description: content['description']!,
                        onEdit: () {
                          // Handle Edit Content
                        },
                        onDelete: () {
                          setState(() {
                            contentList.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final newContent =
                        await Navigator.push<Map<String, String>>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddContentPage(),
                      ),
                    );

                    if (newContent != null) {
                      _addNewContent(newContent);
                    }
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Add New Content',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 13, 103, 94),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentItem({
    required String title,
    required String description,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Color.fromARGB(255, 15, 103, 94)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Color.fromARGB(255, 3, 196, 249)),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
