import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'itembag.dart';
import 'model/lesson.dart';
import 'profile.dart';
import 'game_page.dart';

void main() => runApp(new QuizPage());

class QuizPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'SSRU GO QuizPage',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'GE Quiz'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.chrome_reader_mode, color: Colors.white),
          ),
          title: Text(
            lesson.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: lesson.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(lesson.level,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(lesson: lesson)));
          },
        );

    Card makeCard(Lesson lesson) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GamePage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.school, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.business_center, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ItemBag()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProfilePage()));
              },
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.import_contacts),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "รายวิชา GEH0101 สุนทรียภาพกับชีวิต",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GEH0102 สังคมไทยในบริบทโลก",
        level: "Intermidiate",
        indicatorValue: 0.33,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0101 เทคโนโลยีสารสนเทศเพื่อการสื่อสารและการเรียนรู้",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0102 วิทยาศาสตร์และเทคโนโลยีกับคุณภาพชีวิต",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0201 วิทยาศาสตร์และเทคโนโลยีกับสิ่งแวดล้อม",
        level: "Intermidiate",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0202 การคิดและตัดสินใจ",
        level: "Intermidiate",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0203 ความรู้เท่าทันสารสนเทศ",
        level: "Intermidiate",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0204 คณิตศาสตร์เพื่อชีวิต",
        level: "Advance",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0205 นันทนาการเพื่อคุณภาพชีวิต",
        level: "Intermidiate",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section."),
    Lesson(
        title: "รายวิชา GES0206 ชีวิตและสุขภาพ",
        level: "Beginner",
        indicatorValue: 1.0,
        price: 0,
        content:
            "Start by taking a couple of minutes to read the info in this section.")
  ];
}
