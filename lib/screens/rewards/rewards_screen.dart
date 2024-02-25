import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';

class Rewards_screenPage extends StatefulWidget {
  const Rewards_screenPage({Key? key}) : super(key: key);

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
        title: const Text("Награды"),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: db.collection("awards").orderBy("point").snapshots(),
        builder: (context, snapshot) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/q.jpg', // Путь к вашему фоновому изображению
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(186, 226, 32, 194),
                        Color.fromARGB(211, 155, 32, 226),
                        Color.fromARGB(201, 72, 18, 189),
                        Color.fromARGB(226, 27, 86, 126),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: BubbleTimeline(
                      bubbleSize: 120,
                      // List of Timeline Bubble Items
                      items: snapshot.data!.docs.map((e) => _card(e)).toList(),
                      stripColor: Color.fromARGB(255, 241, 107, 5),
                      dividerCircleColor:
                          const Color.fromARGB(114, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  TimelineItem _card(QueryDocumentSnapshot? doc) {
    return TimelineItem(
      title: doc!.get('title'),
      subtitle: doc.get('description'),
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(186, 226, 32, 194),
              Color.fromARGB(211, 155, 32, 226),
              Color.fromARGB(201, 72, 18, 189),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            doc.get('point').toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bubbleColor: Theme.of(context).colorScheme.primary,
      titleStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      subtitleStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      descriptionStyle: const TextStyle(fontSize: 12.0),
    );
  }
}