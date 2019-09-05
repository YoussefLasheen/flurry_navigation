import 'package:flutter/material.dart';


var cardsList = [
  [
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
  ],
  [
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
    ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent,
        Colors.transparent, Text("Adham")),
  ]
];


class BottomSection extends StatefulWidget {
  const BottomSection({
    Key key, 
  }) : super(key: key);

  @override
  _BottomSectionState createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: (MediaQuery.of(context).size.height * 0.22),
            child: PageView(
              physics: BouncingScrollPhysics(),
              pageSnapping: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                for (var i = 0; i < cardsList.length; ++i)
                  
                    ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) =>
                            VerticalDivider(
                              color: Colors.black54,
                              width: 10,
                              endIndent: 5,
                              indent: 5,
                            ),
                        itemCount: cardsList[i].length,
                        itemBuilder: (context, index) => cardsList[i][index]),
                  
              ],
            )),
        Divider(
          height: 1,
          color: Colors.black54,
          indent: 5,
          endIndent: 5,
        ),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text("Sign In"),
              color: Colors.transparent,
            ),
            Spacer(),
            FlatButton(
              child: Text("Settings"),
              color: Colors.transparent,
            )
          ],
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final content;
  final icon;
  final name;
  final tasks;
  final color1;
  final color2;
  const ItemCard(
      this.icon, this.name, this.tasks, this.color1, this.color2, this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.3),
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.height *
                MediaQuery.of(context).size.width /
                4980),
          ),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [color1, color2])),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Expanded(
              child: Container(
                child: content,
              ),
            ),
            Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              tasks,
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ],
        ),
      ),
    );
  }
}
