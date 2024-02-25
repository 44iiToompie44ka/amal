import 'package:amal/screens/home/help_getter_widget.dart';
import 'package:amal/screens/home/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'help_getter.dart';

class HelpGettersScreen extends StatefulWidget {
  @override
  _HelpGettersScreenState createState() => _HelpGettersScreenState();
}

class _HelpGettersScreenState extends State<HelpGettersScreen> {
  late Future<List<HelpGetter>> helpGetters;
  bool _isListVisible = true;
  late FirebaseFirestore db;

  @override
  void initState() {
        db = FirebaseFirestore.instance;

    super.initState();
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
                ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: db
                .collection("helpgetters")                
                .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error fetching data. Please try again.'));
                      } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No data available.'));
                      } else {
                        
                        return ListView.builder(
                          itemCount:snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return HelpGetterWidget(helpGetter: snapshot.data!.docs[index]);
                          },
                        );
                      }
                    },
                  )
                : FlutterMap(
                    options: const MapOptions(
                      center: LatLng(45.0180, 78.3770), // Taldykorgan coordinates
                      zoom: 12.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      _isListVisible ? 'Карта' : 'Список',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary,),
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
