import 'package:flutter/material.dart';
import 'help_getter.dart';
import 'fund_raiser_widget.dart';

class HelpGetterWidget extends StatelessWidget {
  final HelpGetter helpGetter;

  HelpGetterWidget({required this.helpGetter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
  children: [
    CircleAvatar(
      radius: 45.0,
      backgroundImage: AssetImage('assets/avatar_image.png'),
    ),
    SizedBox(width: 10.0),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${helpGetter.name} ${helpGetter.fatherName}', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Text(
          helpGetter.address,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  ],
),

          SizedBox(height: 10.0),
          Text(
            helpGetter.description,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          FundRaiserWidget(
            title: helpGetter.raisingFor,
            raised: helpGetter.raised,
            needed: helpGetter.needed,
            helpGetter: helpGetter,
          ),
        ],
      ),
    );
  }
}
