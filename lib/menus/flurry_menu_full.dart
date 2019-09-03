import 'package:flutter/material.dart';
import 'package:flurry_navigation/flurry_navigation.dart';

final menuScreenKey = new GlobalKey(debugLabel: 'MenuScreen');


var notificationsCardsList = [
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
];

var favouriteItemsCardsList = [
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
  ItemCard(Icons.local_offer, 'Socks', '23.3', Colors.transparent, Colors.transparent, Text("Adham")),
];

var latestTransactionsCardsList = [
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
];

var cartCardsList = [
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
  ItemCard(Icons.local_offer, 'bebi', '466', Colors.yellow, Colors.brown, null),
];

class FullMenu extends StatefulWidget {
  final Menu menu;
  final Function(String) onMenuItemSelected;
  final Color bgColor;
  FullMenu({
    this.menu,
    this.onMenuItemSelected,
    this.bgColor,
  }) : super(key: menuScreenKey);
  @override
  createState() {
    return new CustomRadioState();
  }
}

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
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                          color: Colors.black54,
                          width: 10,
                          endIndent: 5,
                          indent: 5,
                        ),
                    itemCount: notificationsCardsList.length,
                    itemBuilder: (context, index) =>
                        notificationsCardsList[index]),
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                          color: Colors.black54,
                          width: 10,
                          endIndent: 5,
                          indent: 5,
                        ),
                    itemCount: latestTransactionsCardsList.length,
                    itemBuilder: (context, index) =>
                        latestTransactionsCardsList[index]),
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                          color: Colors.black54,
                          width: 10,
                          endIndent: 5,
                          indent: 5,
                        ),
                    itemCount: latestTransactionsCardsList.length,
                    itemBuilder: (context, index) =>
                        latestTransactionsCardsList[index]),
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) =>
                        VerticalDivider(
                          color: Colors.black54,
                          width: 10,
                          endIndent: 5,
                          indent: 5,
                        ),
                    itemCount: latestTransactionsCardsList.length,
                    itemBuilder: (context, index) =>
                        latestTransactionsCardsList[index]),
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

class CustomRadioState extends State<FullMenu> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.menu.items.length; ++i) {
      sampleData.add(new RadioModel(
        widget.menu.items[i].isSelected,
        widget.menu.items[i].icon,
        widget.menu.items[i].id,
        widget.menu.items[i].selectedBtnColor,
        widget.menu.items[i].disabledBtnColor,
        widget.menu.items[i].selectedShadowColor,
        widget.menu.items[i].disabledShadowColor,
        widget.menu.items[i].btnShape,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FlurryNavigationMenuController(
      builder: (BuildContext context, MenuController menuController) {
        return new Scaffold(
          backgroundColor: widget.bgColor,
          body: Column(
            children: <Widget>[
              Expanded(
                  flex: 14,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 50),
                          itemCount: sampleData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                widget.onMenuItemSelected(sampleData[index].id);
                                setState(() {
                                  sampleData.forEach(
                                      (element) => element.isSelected = false);
                                  sampleData[index].isSelected = true;
                                });
                                menuController.close();
                              },
                              child: new RadioItem(sampleData[index]),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(),
                        flex: 14,
                      )
                    ],
                  )),
              Expanded(
                child: BottomSection(),
                flex: 6,
              ),
            ],
          ),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 3,
          child: new Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width * 0.3*(3/5),
            child: FractionallySizedBox(
              heightFactor: 0.6,
              widthFactor: 0.6,
              child: IconButton(
                icon: Image.asset(_item.icon),
                padding: EdgeInsets.all(0),
              ),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? _item.selectedBtnColor
                  : _item.disabledBtnColor,
              border: new Border.all(width: 1.0, color: Colors.transparent),
              shape: _item.btnShape,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: _item.isSelected
                        ? _item.selectedShadowColor
                        : _item.disabledShadowColor,
                    offset: Offset(0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 1),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(),
          flex: 1,
        )
      ],
    );
  }
}

class MenuItem {
  final bool isSelected;
  final String icon;
  final String id;
  final Color selectedBtnColor;
  Color disabledBtnColor;
  Color selectedShadowColor;
  Color disabledShadowColor;
  BoxShape btnShape;

  MenuItem(
      {this.icon,
      this.id,
      this.isSelected,
      this.selectedBtnColor,
      this.disabledBtnColor = Colors.transparent,
      this.selectedShadowColor = Colors.blueGrey,
      this.disabledShadowColor = Colors.transparent,
      this.btnShape = BoxShape.circle});
}

class RadioModel {
  bool isSelected;
  final String icon;
  final String id;
  final Color selectedBtnColor;
  final Color disabledBtnColor;
  final Color selectedShadowColor;
  final Color disabledShadowColor;
  final BoxShape btnShape;
  RadioModel(
      this.isSelected,
      this.icon,
      this.id,
      this.selectedBtnColor,
      this.disabledBtnColor,
      this.selectedShadowColor,
      this.disabledShadowColor,
      this.btnShape);
}

class Menu {
  final List<MenuItem> items;

  Menu({
    this.items,
  });
}
