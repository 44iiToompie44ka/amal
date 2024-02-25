// help_getter_widget.dart
import 'package:flutter/material.dart';
import 'help_getter.dart';
import 'fund_raiser_widget.dart';

class HelpGetterWidget extends StatelessWidget {
  final HelpGetter helpGetter;

  HelpGetterWidget({required this.helpGetter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
                height: 120,
                width: 120,
                child: Image.network(
                  helpGetter.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${helpGetter.name} ${helpGetter.fatherName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    helpGetter.address,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            helpGetter.description,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 10.0),
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
