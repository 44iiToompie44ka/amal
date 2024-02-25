import 'package:amal/screens/home/notifications.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'help_getter.dart';
import 'help_getter_widget.dart';

class HelpGettersScreen extends StatefulWidget {
  const HelpGettersScreen({Key? key}) : super(key: key);

  @override
  _HelpGettersScreenState createState() => _HelpGettersScreenState();
}

class _HelpGettersScreenState extends State<HelpGettersScreen> {
  late Future<List<HelpGetter>> helpGetters;
  bool _isListVisible = true;

  @override
  void initState() {
    super.initState();
    helpGetters = _getHelpGetters();
  }

  Future<List<HelpGetter>> _getHelpGetters() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('helpgetters').get();

    return snapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> document) {
      return HelpGetter.fromMap(document.data()!);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Amal',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _isListVisible
                ? FutureBuilder<List<HelpGetter>>(
                    future: helpGetters,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child:
                                Text('Error fetching data. Please try again.'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available.'));
                      } else {
                        List<HelpGetter> helpGettersList = snapshot.data!;
                        return ListView.builder(
                          itemCount: helpGettersList.length,
                          itemBuilder: (context, index) {
                            HelpGetter helpGetter = helpGettersList[index];
                            return HelpGetterWidget(helpGetter: helpGetter);
                          },
                        );
                      }
                    },
                  )
                : FlutterMap(
                    options: const MapOptions(
                      center:
                          LatLng(45.0180, 78.3770), // Taldykorgan coordinates
                      zoom: 12.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                    ],
                  ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isListVisible = !_isListVisible;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      _isListVisible ? Icons.map : Icons.list,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      _isListVisible ? 'Карта' : 'Список',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
