import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';

class Rewards_screenPage extends StatefulWidget {
  const Rewards_screenPage({super.key});

  @override
  State<Rewards_screenPage> createState() => _Rewards_screenPageState();
}

class _Rewards_screenPageState extends State<Rewards_screenPage> {
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
          title: const Text("Awards"),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: db
                .collection("awards")
                .orderBy(
                  "point",
                )
                .snapshots(),
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: BubbleTimeline(
                      bubbleSize: 120,
                      // List of Timeline Bubble Items
                      items: snapshot.data!.docs.map((e) => _card(e)).toList(),

                      stripColor: Colors.grey,
                      dividerCircleColor: Colors.white,
                    ),
                  )
                ],
              );
            }));
  }

  TimelineItem _card(QueryDocumentSnapshot? doc) {
    return TimelineItem(
      title: doc!.get('title'),
      subtitle: doc.get('description'),
      icon: Text(
        doc.get('point').toString(),
        style: const TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      bubbleColor: Theme.of(context).colorScheme.primary,
      titleStyle: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
      subtitleStyle:
          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      descriptionStyle: const TextStyle(fontSize: 12.0),
    );
  }
}