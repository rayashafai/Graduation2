import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data'; // For handling image bytes
import 'package:provider/provider.dart';
import 'cartmodel.dart';

class WindowsDetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const WindowsDetailPage({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  _WindowsDetailPageState createState() => _WindowsDetailPageState();
}

class _WindowsDetailPageState extends State<WindowsDetailPage> {
  TextEditingController _feedbackController = TextEditingController();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List bytes = await image.readAsBytes(); // Correct awaiting
      setState(() {
        _pickedImage = XFile.fromData(bytes); // Correctly uses bytes
      });
    }
  }

  void _submitFeedback() async {
    if (_pickedImage != null && _feedbackController.text.isNotEmpty) {
      Uint8List imageBytes = await _pickedImage!.readAsBytes();
      FeedbackEntry feedback = FeedbackEntry(
        imageBytes: imageBytes,
        comment: _feedbackController.text,
        timestamp: DateTime.now(),
      );
      Provider.of<CartModel>(context, listen: false).addFeedback(feedback);
      setState(() {
        _feedbackController.clear();
        _pickedImage = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please provide both feedback and image.')),
      );
    }
  }

  void _onNavBarTap(BuildContext context, int index) {
    // Handle navigation logic here based on the tapped index
    switch (index) {
      case 0: // Home
        Navigator.pushNamed(context, '/home');
        break;
      case 1: // Cart
        Navigator.pushNamed(context, '/cart');
        break;
      case 2: // Search
        Navigator.pushNamed(context, '/search');
        break;
      case 3: // Profile
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.brown[400],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product Image Section
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    height: 300,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Product Name and Price
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 148, 116, 104),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Add Feedback Button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => FeedbackDialog(
                          feedbackController: _feedbackController,
                          onImagePick: _pickImage,
                          onSubmit: _submitFeedback,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                      ),
                      child: const Text('Add Feedback'),
                    ),
                  ),
                  // Feedback Section
                  Consumer<CartModel>(
                    builder: (context, cartModel, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartModel.feedbackList.length,
                        itemBuilder: (context, index) {
                          final feedback = cartModel.feedbackList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (feedback.imageBytes != null)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Image.memory(feedback.imageBytes!),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    feedback.comment ?? 'No comment provided',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 69, 69, 69),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Text(
                                    'Submitted on ${feedback.timestamp}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Fixed Bottom Bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    const Text(
                      '1', // Default quantity
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        final cartModel =
                            Provider.of<CartModel>(context, listen: false);
                        cartModel.addItem({
                          'name': widget.name,
                          'price':
                              double.parse(widget.price.replaceAll('\$', '')),
                          'quantity': 1,
                          'image': widget.image,
                        });
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        currentIndex: 1,
        onTap: (index) => _onNavBarTap(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class FeedbackDialog extends StatelessWidget {
  final TextEditingController feedbackController;
  final VoidCallback onImagePick;
  final VoidCallback onSubmit;

  const FeedbackDialog({
    Key? key,
    required this.feedbackController,
    required this.onImagePick,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Feedback'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: feedbackController,
            decoration: const InputDecoration(
              hintText: 'Write your feedback here',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: onImagePick,
            child: const Text('Upload Image'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onSubmit,
          child: const Text('Submit Feedback'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
