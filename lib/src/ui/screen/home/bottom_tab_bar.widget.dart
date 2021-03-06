import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar>
    with TickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ShadowedBox(
      blurRadius: 12.0,
      spreadRadius: -4.0,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8.0),
        bottom: Radius.circular(Global.isIphoneX ? 40.0 : 8.0),
      ),
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: _controller,
          indicator: DotTabIndicator(),
          tabs: [
            IconButton(
              padding: EdgeInsets.all(kSpaceBig),
              icon: Icon(D.write, color: Colors.black),
              onPressed: () => _controller.animateTo(0),
            ),
            IconButton(
              padding: EdgeInsets.all(kSpaceBig),
              icon: Icon(D.listen, color: Colors.black),
              onPressed: () => _controller.animateTo(1),
            ),
            IconButton(
              padding: EdgeInsets.all(kSpaceBig),
              icon: Icon(D.mine, color: Colors.black),
              onPressed: () => _controller.animateTo(2),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
