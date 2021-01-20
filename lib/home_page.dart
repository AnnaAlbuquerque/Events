import 'package:events/components/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:events/model/event.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Event> list = [
    Event(
      name: "Event 1",
      description: "Event 1",
      public: true,
      date: DateTime.parse("2021-01-30 10:00:00"),
    ),
    Event(
      name: "Event 2",
      description: "Event 2",
      public: true,
      date: DateTime.parse("2021-02-04 22:00:00"),
    ),
    Event(
      name: "Event 3",
      description: "Event 3",
      public: false,
      date: DateTime.parse("2021-03-10 08:00:00"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Events",
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(children: <Widget>[
      _header(),
      _list(),
    ]);
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 10, 15),
          child: Icon(
            Icons.calendar_today,
            size: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
        Text(
          "Eventos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _list() {
    return Expanded(
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _itemlist(list[index]);
          },
        ),
      ),
    );
  }

  Widget _itemlist(Event event) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKZ6ngo76G-nHvsP4ddNprQd4RrtBdJan7SQ&usqp=CAU"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              children: [
                TextWidget(
                  text1: "Event Name:",
                  text2: event.name,
                ),
                TextWidget(
                  text1: "Description:",
                  text2: event.description,
                ),
                TextWidget(
                  text1: "Event Date:",
                  text2: event.date.toString(),
                ),
                TextWidget(
                  text1: "Public:",
                  text2: event.public ? "yes" : "no",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
