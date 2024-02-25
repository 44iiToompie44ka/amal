// help_getter_widget.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'help_getter.dart';
import 'fund_raiser_widget.dart';

class HelpGetterWidget extends StatefulWidget {
  QueryDocumentSnapshot?  helpGetter;

  HelpGetterWidget({required this.helpGetter});

  @override
  State<HelpGetterWidget> createState() => _HelpGetterWidgetState();
}

class _HelpGetterWidgetState extends State<HelpGetterWidget> {
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
                  widget.helpGetter!.get('image'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.helpGetter!.get('name')} ${widget.helpGetter!.get('fathername')}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    
                    Text(
                      widget.helpGetter!.get('address'),
                      style: const TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.helpGetter!.get('description'),
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 10.0),
          FundRaiserWidget(
            title: widget.helpGetter!.get('raisingfor'),
            raised: widget.helpGetter!.get('raised'),
            needed: widget.helpGetter!.get('needed'),
            helpGetter: widget.helpGetter!,
          ),
        ],
      ),
    );
  }
}
