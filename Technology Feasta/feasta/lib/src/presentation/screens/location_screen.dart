import 'dart:ui';
import 'package:feasta/src/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _isDialogOpen = false;
  TextEditingController controller = TextEditingController();
  String _city = "City";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tabBackColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    size: 25,
                    color: Colors.pink,
                  ),
                  onPressed: () {
                    setState(() {
                      _isDialogOpen = true;
                    });
                    _showLocationDialog(context).then((_) {
                      setState(() {
                        _isDialogOpen = false;
                      });
                    });
                  },
                ),
                Text(
                  _city,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          if (_isDialogOpen)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showLocationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.tabInActiveColor,
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(width: 2, color: Colors.white.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Choose your Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GooglePlaceAutoCompleteTextField(
                  textEditingController: controller,
                  boxDecoration: const BoxDecoration(borderRadius: null),
                  googleAPIKey: "AIzaSyCjOWuul-db69IzI90Wk2VH1t0z1FeFI0s",
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 8.0, top: 14.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(11.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(11.7),
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.white54),
                    fillColor: Colors.black,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white54),
                  ),
                  textStyle: const TextStyle(color: Colors.white),
                  debounceTime: 400,
                  countries: ["in", "fr"],
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    print("placeDetails" + prediction.lat.toString());
                  },
                  itemClick: (Prediction prediction) {
                    controller.text = prediction.description ?? "";
                    // controller.selection = TextSelection.fromPosition(
                    //     TextPosition(
                    //         offset: prediction.description?.length ?? 0));

                    setState(() {
                      _city = prediction.description!.split(",")[0].trim();
                    });
                    Navigator.pop(context);
                  },
                  seperatedBuilder: null,
                  containerHorizontalPadding: 10,
                  itemBuilder: (context, index, Prediction prediction) {
                    return Container(
                      color: AppColors.tabInActiveColor,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "${prediction.description!.characters ?? ""}",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  isCrossBtnShown: true,
                  // default 600 ms ,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Handle location detection
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.my_location, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Detect my location',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Suggested',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildLocationCard('Bangalore', Icons.location_city),
                      _buildLocationCard('Mumbai', Icons.location_city),
                      _buildLocationCard('Delhi', Icons.location_city),
                      _buildLocationCard('Hyderabad', Icons.location_city),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationCard(String city, IconData icon) {
    return Container(
      width: 78,
      height: 78,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 12, bottom: 8, left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white24)),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            city,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
