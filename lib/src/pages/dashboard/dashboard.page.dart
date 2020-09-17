import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../shared/colors.dart';
import '../../shared/custom_icons.dart';
import '../../shared/styles.dart';
import '../dashboard/store_page_content.dart';
import 'settings_page_content.dart';

class DashboardPage extends StatefulWidget {
  final String pageTitle;

  DashboardPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [];
  final List<BottomNavigationBarItem> navItems = [];

  @override
  void initState() {
    super.initState();
    _pages.forEach((e) {
      navItems.add(BottomNavigationBarItem(icon: Icon(e.icon), label: e.title));
      tabs.add(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _appBar,
      body: getTabPage(context, _selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green[600],
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget get _appBar {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        iconSize: 21,
        icon: Icon(CustomIcons.funnel),
      ),
      backgroundColor: primaryColor,
      title: Text(APP_NAME, style: logoWhiteStyle, textAlign: TextAlign.center),
      actions: [
        IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          iconSize: 21,
          icon: Icon(CustomIcons.magnifier),
        ),
        IconButton(
          padding: EdgeInsets.all(0),
          onPressed: () {},
          iconSize: 21,
          icon: Icon(CustomIcons.alarm),
        ),
      ],
    );
  }

  Widget getTabPage(BuildContext context, int index) {
    if (tabs[index] == null) {
      tabs[index] = _pages[index].builder(context);
    }
    return tabs[index];
  }
}

final _pages = <_PageContentData>[
  _PageContentData(
    title: 'Store',
    icon: CustomIcons.shop,
    builder: (_) => StorePageContent(),
  ),
  _PageContentData(
    title: 'My Cart',
    icon: CustomIcons.cart,
    builder: (_) => _EmptyPageContent(title: 'My Cart'),
  ),
  _PageContentData(
    title: 'Favourites',
    icon: CustomIcons.heart_1,
    builder: (_) => _EmptyPageContent(title: 'Favourites'),
  ),
  _PageContentData(
    title: 'Profile',
    icon: CustomIcons.user_1,
    builder: (_) => _EmptyPageContent(title: 'Profile'),
  ),
  _PageContentData(
    title: 'Settings',
    icon: CustomIcons.cog_1,
    builder: (_) => SettingsPageContent(),
  ),
];

class _PageContentData {
  final String title;
  final IconData icon;
  final WidgetBuilder builder;

  const _PageContentData({this.title, this.icon, this.builder});
}

class _EmptyPageContent extends StatelessWidget {
  final String title;

  const _EmptyPageContent({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
