import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final LatLng startPoint; // Coordinates for Nablus
  final LatLng endPoint; // Coordinates for the selected city

  const MapPage({
    Key? key,
    required this.startPoint,
    required this.endPoint,
  }) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  late List<LatLng> _polylineCoordinates;

  @override
  void initState() {
    super.initState();
    _polylineCoordinates = [widget.startPoint, widget.endPoint];
  }

  // This function ensures the map view adjusts to show both cities in the view
  void _fitBounds() async {
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        widget.startPoint.latitude < widget.endPoint.latitude
            ? widget.startPoint.latitude
            : widget.endPoint.latitude,
        widget.startPoint.longitude < widget.endPoint.longitude
            ? widget.startPoint.longitude
            : widget.endPoint.longitude,
      ),
      northeast: LatLng(
        widget.startPoint.latitude > widget.endPoint.latitude
            ? widget.startPoint.latitude
            : widget.endPoint.latitude,
        widget.startPoint.longitude > widget.endPoint.longitude
            ? widget.startPoint.longitude
            : widget.endPoint.longitude,
      ),
    );

    // Adjust the camera to fit the bounds of both cities with some padding
    _mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100));
    print("Camera updated to fit bounds");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map View"),
        backgroundColor: Colors.brown[400],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.startPoint, // Start from Nablus
          zoom: 9, // Adjust zoom level for optimal view of both cities
        ),
        markers: _createMarkers(),
        polylines: _createPolyline(),
        onMapCreated: (controller) {
          _mapController = controller;
          // Ensure the camera fits both points after the map is created
          _fitBounds();
          print("Google Map created");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fitBounds,
        backgroundColor: Colors.brown[400],
        child: const Icon(Icons.zoom_out_map),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId("start"),
        position: widget.startPoint,
        infoWindow: const InfoWindow(title: "Nablus"),
      ),
      Marker(
        markerId: MarkerId("end"),
        position: widget.endPoint,
        infoWindow: const InfoWindow(title: "Selected City"),
      ),
    };
  }

  Set<Polyline> _createPolyline() {
    return {
      Polyline(
        polylineId: PolylineId("distanceLine"),
        color: Colors.blue,
        width: 5,
        points: _polylineCoordinates,
      ),
    };
  }
}
