



import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GpsNameService {

  getNameLocation({longitude, latitude}) async {
    print('long lag $longitude , $latitude');
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    var Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    print(Address);
    // print(distanceBetweenPoints);
  }
}








// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// class GeolocatorService {
//   getCurrentLocation() async {
//     try {
//       var addressLine = '';
//
//       final Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.bestForNavigation,
//       );
//       var long = position.longitude;
//       var lat = position.latitude;
//     } catch (e) {
//       print('[getCurrentLocation] Error Ocurred $e');
//       return null;
//     }
//   }
// }
//
// class GeolocatorServices {
//
//   getCurrentLocation() async {
//     try {
//       var addressLine = '';
//
//       final Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.bestForNavigation,
//       );
//       print('Latitude ${position.latitude}');
//       print('Longitude ${position.longitude}');
//
//       List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude,position.longitude);
//       print('Address $placemarks');
//       // final Coordinates coordinates =
//       // Coordinates(position.latitude, position.longitude);
//       // final addresses =
//       // await Geocoder.local.findAddressesFromCoordinates(coordinates);
//
//       // if (position.isMocked) {
//       //   addressLine = addresses.first.addressLine + ' #FakeLocation';
//       // } else {
//       //   addressLine = addresses.first.addressLine;
//       // }
//
//       // UserLocation userLocation = UserLocation(
//       //   latitude: position.latitude,
//       //   longitude: position.longitude,
//       //   addressLine: addressLine,
//       // );
//
//       // return userLocation;
//     } catch (e) {
//       print('[getCurrentLocation] Error Ocurred $e');
//       return null;
//     }
//   }
// }

// class UserLocation {
//   double latitude;
//   double longitude;
//   String addressLine;
//
//   UserLocation({
//     required this.latitude,
//     required this.longitude,
//     required this.addressLine,
//   });
// }



