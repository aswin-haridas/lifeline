// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lifeline/chat.dart';
import 'package:lifeline/feedback.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Line',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatelessWidget {
  var accidentReported = false;

  MapScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(9.963031, 76.318313),
              initialZoom: 15,
              interactionOptions:
                  InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  Marker(
                    point: const LatLng(9.963031, 76.318313),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        accidentReported ? Icons.warning : Icons.person,
                        color: accidentReported ? Colors.red : Colors.purple,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.977110, 76.317430),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.warning,
                        color: Colors.red ,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.956543, 76.316159),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.970173, 76.321218),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.971484, 76.314805),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.local_shipping,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.970732, 76.319309),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.9715686, 76.3168482),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.958472, 76.317111),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.medical_services,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.969821, 76.318027),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.fire_truck,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.971732, 76.315805),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.fire_truck,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                  Marker(
                    point: const LatLng(9.969732, 76.319809),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.fire_truck,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          DraggablePopupCard(),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: 'dev.fleafleat.flutter_map.example',
    );

class DraggablePopupCard extends StatefulWidget {
  const DraggablePopupCard({super.key});

  @override
  State<DraggablePopupCard> createState() => _DraggablePopupCardState();
}

class _DraggablePopupCardState extends State<DraggablePopupCard> {
  
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.6,
      builder: (BuildContext context, ScrollController? scrollController) {
        scrollController ??= ScrollController();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 400,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.report_problem),
                                  title: const Text('Accident'),
                                  onTap: () {
                                    setState(() {
                                    });

                                    Navigator.pop(context);
                                    // Add your action for Report Issue hereWS
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.info_outline),
                                  title: const Text('Fire'),
                                  onTap: () {
                                    
                                    Navigator.pop(context);
                                    // Add your action for Information here
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.block),
                                  title: const Text('Traffic Block'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    // Add your action for Information here
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.cancel),
                                  title: const Text('Cancel'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.report, color: Colors.black),
                    label: const Text(
                      'Report',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      fixedSize: const Size(180, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                    final List<String> ambulanceNumbers = [
                      '9114495416',
                      '1123523463',
                      '9996806856',
                    ];
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Nearby Ambulance Numbers'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: ambulanceNumbers
                                .map((number) => ListTile(
                                      title: Text(number),
                                      onTap: () {
                                        // Add your action for calling the ambulance number here
                                        Navigator.pop(context);
                                      },
                                      leading: Icon(Icons.call, color: Colors.blue),
                                    ))
                                .toList(),
                          ),
                        );
                      },
                    );
                    
                    },
                    icon: const Icon(Icons.call, color: Colors.white),
                    label: const Text(
                      'Emergency call',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: const Size(180, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    },
                    icon: const Icon(Icons.chat, color: Colors.white),
                    label: const Text(
                      'First aid chat',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[300],
                      fixedSize: const Size(180, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackForm()),
                      );
                    },
                    icon: const Icon(Icons.feedback, color: Colors.white),
                    label: const Text(
                      'Feedback',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[200],
                      fixedSize: const Size(180, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
