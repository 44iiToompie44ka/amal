import 'package:amal/screens/home/detailed_fund_help/help_details_screen.dart';
import 'package:flutter/material.dart';
import 'help_getter.dart';

class FundRaiserWidget extends StatelessWidget {
  final String title;
  final int raised;
  final int needed;
  final HelpGetter helpGetter;

  FundRaiserWidget({
    required this.title,
    required this.raised,
    required this.needed,
    required this.helpGetter,
  });

  @override
  Widget build(BuildContext context) {
    double progressPercentage = (raised / needed).clamp(0.0, 1.0) * 100;

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Stack(
            children: [
              LinearProgressIndicator(
                value: progressPercentage / 100,
                backgroundColor: Colors.grey[600],
                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 172, 87, 115)),
              ),
              Positioned(
                left: progressPercentage * 2.5,
                child: Text(
                  '\$${raised.toString()}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0),
                  Text(
                    '\$$needed',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Сумма сбора',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 5.0),
                  Text(
                    '\$${needed - raised}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Осталось',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Padding(padding: EdgeInsets.symmetric(horizontal: 100.0), child: ElevatedButton(
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.black), 
  ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HelpDetailsScreen(helpGetter: helpGetter),
                ),
              );
            },
            child: Text('Помочь', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),),
          ),)
          
        ],
      ),
    );
  }
}
