import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'help_getter.dart';

class HelpGettersScreen extends StatefulWidget {
  @override
  _HelpGettersScreenState createState() => _HelpGettersScreenState();
}

class _HelpGettersScreenState extends State<HelpGettersScreen> {
  late Future<List<HelpGetter>> helpGetters;

  @override
  void initState() {
    super.initState();
    helpGetters = _getHelpGetters();
  }

  Future<List<HelpGetter>> _getHelpGetters() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('helpgetters').get();

    return snapshot.docs
        .map((DocumentSnapshot<Map<String, dynamic>> document) {
      return HelpGetter.fromMap(document.data());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Getters'),
      ),
      body: FutureBuilder<List<HelpGetter>>(
        future: helpGetters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<HelpGetter> helpGettersList = snapshot.data!;
            return ListView.builder(
              itemCount: helpGettersList.length,
              itemBuilder: (context, index) {
                HelpGetter helpGetter = helpGettersList[index];
                return ListTile(
                  title: Text(helpGetter.name),
                  subtitle: Text('Address: ${helpGetter.address}\nRaised: \$${helpGetter.raised}\nNeeded: \$${helpGetter.needed}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelpGettersScreen(),
  ));
}
