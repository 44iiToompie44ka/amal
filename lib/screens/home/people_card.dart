import 'package:amal/screens/home/fund_raiser_widget.dart';
import 'package:flutter/material.dart';
import 'package:amal/screens/home/detailed_fund_help/help_details_screen.dart';
import 'help_getter.dart';

class PersonCard extends StatefulWidget {
  const PersonCard({Key? key}) : super(key: key);

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  bool _isContainerVisible = false;
  bool _isTextExpanded = false;
  String _PersonStory =
      'Ray has a high level of intelligence and well-developed hunting skills,  Ray has a high level of intelligence and well-developed hunting skillsRay has a high level of intelligence and well-developed hunting skills';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: PageView(
              children: [
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Zunge_raus.JPG/800px-Zunge_raus.JPG',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://via.placeholder.com/800x400', // Replace with your second image URL
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://via.placeholder.com/800x400', // Replace with your third image URL
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.share),
                    onPressed: () {
                      // Действия при нажатии на кнопку "поделиться"
                    },
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isContainerVisible ? 20 : 370,
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < -10) {
                  setState(() {
                    _isContainerVisible = true;
                  });
                } else if (details.delta.dy > 10) {
                  setState(() {
                    _isContainerVisible = false;
                  });
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'Татьяна Гиоргиевна', // Your first text here
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'Person Story',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTextExpanded = !_isTextExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _isTextExpanded
                              ? Text(
                                  _PersonStory,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                )
                              : Text(
                                  _PersonStory,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Потребности', // Your first text here
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
