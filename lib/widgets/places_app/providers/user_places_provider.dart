import 'dart:io';

import 'package:first_flutter_app/widgets/places_app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final place = Place(
      title: title,
      image: image,
      location: location,
    );
    state = [place, ...state];
  }

  void removePlace(String title) {
    state = state.where((element) => element.title != title).toList();
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());
