// import 'package:flutter/services.dart';


// class LocationService {
//   static Future<LocationData?> getCurrentLocation() async {
//     Location location = Location();

//     bool serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return null;
//       }
//     }

//     var permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await location.requestPermission();
//       if (permissionStatus != PermissionStatus.granted) {
//         return null;
//       }
//     }

//     try {
//       final locationData = await location.getLocation();
//       return locationData;
//     } on PlatformException catch (e) {
//       if (e.code == "PERMISSION_DENIED") {
//         print("Permission Denied");
//       } else if (e.code == "SERVICE_STATUS_ERROR") {
//         print("Service Status Error");
//       }
//       return null;
//     }
//   }
// }
