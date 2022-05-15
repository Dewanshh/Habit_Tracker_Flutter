import 'package:flutter/material.dart';
import 'package:habittracker/ItemCard.dart';

List<CardItem> items = [
  CardItem(
      name: "YP",
      color: Color.fromRGBO(31, 112, 210, 1),
      subheading: "Yoga Practice"),
  CardItem(
      name: "GE",
      color: Color.fromRGBO(201, 41, 36, 1),
      subheading: "Get Up Early"),
  CardItem(
      name: "NS",
      color: Color.fromRGBO(57, 154, 177, 1),
      subheading: "No Suggestions")
];
List<Map<String, dynamic>> habits2 = [
  {
    'color': Color(0xff7524ff),
    'objectif': 'Learn 5 new words',
    'progress': '5 from 7 this week'
  },
  {
    'color': Color(0xfff03244),
    'objectif': 'Get Up Early',
    'progress': '5 from 7 this week'
  },
  {
    'color': Color(0xff00d5e2),
    'objectif': 'Create an App a day',
    'progress': '6 from 7 this week'
  },
];
