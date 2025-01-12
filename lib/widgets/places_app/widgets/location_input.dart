import 'package:first_flutter_app/widgets/places_app/models/place.dart';
import 'package:first_flutter_app/widgets/places_app/services/google_maps_service.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;
  var gms = GoogleMapsService(
    apiKey: 'ApiKey',
  );

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        _showErrorMessage('Location service is not enabled.');
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        _showErrorMessage('Location permission is denied.');
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    try {
      locationData = await location.getLocation();

      if (locationData.latitude == null || locationData.longitude == null) {
        throw Exception('Unable to fetch location data.');
      }

      var res = await gms.getLocation(
          locationData.latitude!, locationData.longitude!);

      var address = res['results'] != null && res['results'].isNotEmpty
          ? res['results'][0]['formatted_address']
          : 'Unknown Address';

      setState(() {
        _pickedLocation = PlaceLocation(
          address: address,
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
        );
        _isGettingLocation = false;
      });

      widget.onSelectLocation(_pickedLocation!);
    } catch (error) {
      _showErrorMessage('Failed to get location. Please try again later.');
      setState(() {
        _isGettingLocation = false;
      });
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location Chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );

    if (_pickedLocation != null) {
      previewContent = Image.network(
        gms.getLocationImage(
          _pickedLocation!.latitude,
          _pickedLocation!.longitude,
        ),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withValues(
                    alpha: 0.2,
                  ),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Get Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
