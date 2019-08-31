import 'package:flutter/material.dart';
class FlurryNavigation extends StatefulWidget {
  final Widget menuScreen;
  final Screen contentScreen;
  final Image expandIcon;
  final double iconSize;
  final double curveRadius;

  FlurryNavigation(
      {this.menuScreen, this.contentScreen, this.expandIcon, this.iconSize,this.curveRadius});

  @override
  _FlurryNavigationState createState() => new _FlurryNavigationState();
}

class _FlurryNavigationState extends State<FlurryNavigation>
    with TickerProviderStateMixin {
  MenuController menuController;
  Curve scaleDownCurve = new Interval(0.0, 1.0, curve: Curves.linear);
  Curve scaleUpCurve = new Interval(0.0, 1.0, curve: Curves.linear);
  Curve slideOutCurve = new Interval(0.0, 1.0, curve: Curves.elasticOut);
  Curve slideInCurve = new Interval(0.0, 1.0, curve: Curves.ease);

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  createContentDisplay() {
    return zoomAndSlideContent(
      new Container(
        child: new Scaffold(
            body: Column(children: <Widget>[
          Expanded(
            child: widget.contentScreen.contentBuilder(context),
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: widget.expandIcon,
                onPressed: () {
                  menuController.toggle();
                },
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(0),
                iconSize: widget.iconSize,
              )
            ],
          ),
        ])),
      ),
    );
  }

  zoomAndSlideContent(Widget content) {
    //slidePercent is not used right now but it may be used in future versions
    var /*slidePercent, */scalePercent;
    switch (menuController.state) {
      case MenuState.closed:
        //slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        //slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        //slidePercent = slideOutCurve.transform(menuController.percentOpen);
        scalePercent = scaleDownCurve.transform(menuController.percentOpen);
        break;
      case MenuState.closing:
        //slidePercent = slideInCurve.transform(menuController.percentOpen);
        scalePercent = scaleUpCurve.transform(menuController.percentOpen);
        break;
    }
    var contentScale;
    double cornerRadius = 0;
    return OrientationBuilder(builder: (context, orientation) {
      contentScale = 1.0 - (0.3 * scalePercent);
      cornerRadius = widget.curveRadius * menuController.percentOpen;

      return new Transform(
        transform: new Matrix4.translationValues(0.0, 0.0, 0.0)
          ..scale(contentScale, contentScale),
        alignment: orientation == Orientation.portrait
            ? Alignment.topRight
            : Alignment.topRight,
        child: new ClipRRect(
            borderRadius: new BorderRadius.only(
                bottomLeft: Radius.circular(cornerRadius)),
            child: content),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.menuScreen,
        createContentDisplay(),
      ],
    );
  }
}

class FlurryNavigationMenuController extends StatefulWidget {
  final FlurryNavigationBuilder builder;

  FlurryNavigationMenuController({
    this.builder,
  });

  @override
  FlurryNavigationMenuControllerState createState() {
    return new FlurryNavigationMenuControllerState();
  }
}

class FlurryNavigationMenuControllerState
    extends State<FlurryNavigationMenuController> {
  MenuController menuController;

  @override
  void initState() {
    super.initState();

    menuController = getMenuController(context);
    menuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    menuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  getMenuController(BuildContext context) {
    final navigationState =
        context.ancestorStateOfType(new TypeMatcher<_FlurryNavigationState>())
            as _FlurryNavigationState;
    return navigationState.menuController;
  }

  _onMenuControllerChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }
}

typedef Widget FlurryNavigationBuilder(
    BuildContext context, MenuController menuController);

class Screen {
  final WidgetBuilder contentBuilder;

  Screen({
    this.contentBuilder,
  });
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  MenuController({
    this.vsync,
  }) : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 300)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
