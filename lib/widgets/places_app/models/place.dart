import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  final String address;
  final double latitude;
  final double longitude;
}

class Place {
  Place({
    required this.title,
    required this.image,
    this.location,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final File image;
  final PlaceLocation? location;
}
