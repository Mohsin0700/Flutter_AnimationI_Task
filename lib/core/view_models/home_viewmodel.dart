import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  List<Map<String, dynamic>> allGoals = [
    {
      "goalName": "Mountain Bike",
      "totalCost": 300,
      "category": "Sport",
      "savings": 180,
      "months": [
        {
          "month": "jul",
          "savings": 50,
        },
        {
          "month": "Aug",
          "savings": 70,
        },
        {
          "month": "Sep",
          "savings": 60,
        },
      ],
    },
    {
      "goalName": "Sony Playstation",
      "totalCost": 800,
      "category": "game",
      "savings": 144,
      "months": [
        {
          "month": "jul",
          "savings": 44,
        },
        {
          "month": "Aug",
          "savings": 60,
        },
        {
          "month": "Sep",
          "savings": 40,
        },
      ],
    },
    {
      "goalName": "Buffy Nature Skateboard",
      "totalCost": 240,
      "category": "Sport",
      "savings": 240,
      "months": [
        {
          "month": "jul",
          "savings": 110,
        },
        {
          "month": "Aug",
          "savings": 80,
        },
        {
          "month": "Sep",
          "savings": 50,
        },
      ],
    },
  ];
}
