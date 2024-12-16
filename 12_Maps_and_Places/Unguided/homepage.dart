import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _kMapCenter = LatLng(-7.4347652, 109.2500561);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  late GoogleMapController _mapController;

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        infoWindow: InfoWindow(title: 'Marker 1'),
        rotation: 90,
      ),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(-6.9733165, 107.6281415),
      ),
    };
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PlacePicker(
        "YOUR_API_KEY", // Ganti dengan Google Maps API Key Anda
        displayLocation: _kMapCenter,
      ),
    ));

    if (result != null) {
      print("Selected Place: ${result.latLng}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Demo with Place Picker'),
        actions: [
          IconButton(
            icon: Icon(Icons.place),
            onPressed: showPlacePicker,
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
        myLocationEnabled: true,
        markers: _createMarker(),
      ),
    );
  }
}
