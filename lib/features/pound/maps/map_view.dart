import 'dart:async';

import 'package:fitness/common/constants/color_constants.dart';
import 'package:fitness/common/widgets/app_bar/page_app_bar.dart';
import 'package:fitness/common/widgets/button/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class MapCardioGoView extends StatefulWidget {
  const MapCardioGoView({super.key});

  @override
  State<MapCardioGoView> createState() => _MapCardioGoViewState();
}

class _MapCardioGoViewState extends State<MapCardioGoView> {
  late MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  void dispose() {
    // _locationSubscription.cancel();
    super.dispose();
  }

  List<Marker> markers = [];
  List<Polygon> polygons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PageAppBar(
          title: "Cardio Go",
        ),
        body: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: FlutterMap(
              mapController: _mapController,
              options: const MapOptions(
                initialCenter: LatLng(13.01509, 80.23831),
                initialZoom: 16.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                MarkerLayer(markers: [
                  Marker(
                      point: LatLng(13.01263, 80.23594),
                      child: Icon(
                        Iconsax.location5,
                      )),
                  Marker(
                      point: LatLng(13.01691, 80.24075),
                      child: Icon(
                        Iconsax.location5,
                        color: Colors.black,
                      )),
                ]),
                PolylineLayer(polylines: [
                  Polyline(
                      // borderStrokeWidth: 1,
                      // borderColor: Colors.black,
                      strokeWidth: 5.0,
                      gradientColors: TColor.primaryG,
                      points: [
                        const LatLng(13.01263, 80.23594),
                        const LatLng(13.01243, 80.23605),
                        const LatLng(13.01223, 80.23602),
                        const LatLng(13.01215, 80.23658),
                        const LatLng(13.01265, 80.23666),
                        const LatLng(13.01214, 80.24037),
                        const LatLng(13.01398, 80.24034),
                        const LatLng(13.01525, 80.24047),
                        const LatLng(13.01691, 80.24075),
                      ])
                ])
              ],
            ),
          ),
          Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              child: RoundButton(title: "GO", onPressed: () {})),
        ]));
  }
}
