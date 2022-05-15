import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:habittracker/splash.dart';

import 'ItemCard.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(14, 18, 26, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          softWrap: true,
                          text: TextSpan(
                              text: 'Most Popular',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              children: <TextSpan>[
                                TextSpan(
                                    text: " Habits",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))
                              ])),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                          backgroundColor: Color.fromRGBO(84, 41, 219, 1),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          BuildCard(items[index], context),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        color: Color(0xff1b232e),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, f) {
                          int day = DateTime.now().day + f;
                          return InkWell(
                            onTap: () {
                              print("${DateTime.now().day + f}");
                            },
                            child: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    color: day == DateTime.now().day
                                        ? Color(0xff727be8)
                                        : Color(0xff131b26),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${DateTime.now().day + f}',
                                          style: TextStyle(
                                              color: day == DateTime.now().day
                                                  ? Colors.white
                                                  : Colors.grey[500],
                                              fontWeight:
                                                  day == DateTime.now().day
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Your Habits",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 21),
                          children: <TextSpan>[
                        TextSpan(
                            text: " 5",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[500],
                              fontSize: 21,
                            ))
                      ])),
                  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: habits2.length,
                        itemBuilder: (ctx, id) {
                          return ListItem(id: id);
                        }),
                  ),
                  Container(
                      height: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                              text: "Made by ❤️ in India ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "• Powered By Dewansh Jangir",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int id;
  const ListItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Hello World");
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: id == 0 ? habits2[id]['color'] : Colors.transparent,
                    border: id == 0 ? Border() : Border.all(color: Colors.grey),
                  ),
                  child: Icon(
                    Icons.check,
                    color: id == 0 ? Colors.white : Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habits2[id]['objectif'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      habits2[id]['progress'],
                      style: TextStyle(color: Colors.grey[500], fontSize: 17),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              ],
            ),
            LinearProgressIndicator(
              value: .71,
              backgroundColor: Color(0xff1c232d),
              valueColor: AlwaysStoppedAnimation(
                habits2[id]['color'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BuildCard(CardItem item, context) {
  return InkWell(
    onTap: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => splash()));
    },
    child: Container(
      width: 150,
      margin: EdgeInsets.only(right: 15.0, top: 9.0, bottom: 9.0),
      padding: EdgeInsets.all(13.0),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: item.color,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            item.name,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            item.subheading,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
