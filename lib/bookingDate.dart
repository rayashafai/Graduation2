import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  String selectedCity = "Ramallah";

  // Coordinates for Palestinian cities
  final Map<String, LatLng> cityCoordinates = {
    "Nablus": LatLng(32.2211, 35.2544),
    "Ramallah": LatLng(31.8996, 35.2042),
    "Hebron": LatLng(31.5326, 35.0998),
    "Jerusalem": LatLng(31.7683, 35.2137),
    "Bethlehem": LatLng(31.7054, 35.2024),
    "Gaza": LatLng(31.3547, 34.3088),
  };

  final List<String> cities = [
    "Ramallah",
    "Hebron",
    "Jerusalem",
    "Bethlehem",
    "Gaza"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Your Date"),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification logic
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  // From and To section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _locationInfo("From", "Nablus"),
                      _destinationDropdown(),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Booking dates
                  Text(
                    "Booking Your Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[400],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildDatePicker(),
                  SizedBox(height: 20),
                  // Continue button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedStartDate != null &&
                            selectedEndDate != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapPage(
                                startPoint: cityCoordinates[
                                    "Nablus"]!, // Nablus coordinates
                                endPoint: cityCoordinates[
                                    selectedCity]!, // Selected city's coordinates
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Please select both start and end dates!"),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.brown[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationInfo(String label, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.brown[400]),
        ),
        SizedBox(height: 5),
        Text(
          location,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown[400]),
        ),
      ],
    );
  }

  Widget _destinationDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "To",
          style: TextStyle(fontSize: 14, color: Colors.brown[400]),
        ),
        SizedBox(height: 5),
        DropdownButton<String>(
          value: selectedCity,
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue!;
            });
          },
          items: cities.map<DropdownMenuItem<String>>((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _datePickerButton("Start Date", selectedStartDate, (pickedDate) {
              setState(() {
                selectedStartDate = pickedDate;
              });
            }),
            _datePickerButton("End Date", selectedEndDate, (pickedDate) {
              setState(() {
                selectedEndDate = pickedDate;
              });
            }),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _datePickerButton(
      String label, DateTime? date, Function(DateTime) onDatePicked) {
    return ElevatedButton(
      onPressed: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2030),
        );
        if (pickedDate != null) {
          onDatePicked(pickedDate);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        date != null ? "${date.day}/${date.month}/${date.year}" : label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
