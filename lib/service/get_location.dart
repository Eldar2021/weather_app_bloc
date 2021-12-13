import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<Position?> getLocation() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      final Position location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return location;
    }
  }
}
