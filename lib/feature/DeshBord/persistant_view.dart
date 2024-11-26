
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistantWidget extends StatelessWidget {
  const PersistantWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
  final controller =PersistentTabController();

  List<Widget> buildScreen (){
    return [
      Container(
        color: Colors.red,
        height: 50,
        width: 70,
        child: Center(
          child: Text('HomePage'),
        ),
      ),
        Container(
        color: Colors.blue,
        height: 50,
        width: 70,
        child: Center(
          child: Text('profile'),
        ),
      ),
        Container(
        color: Colors.green,
        height: 50,
        width: 70,
        child: Center(
          child: Text('setting'),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> nabBarItem(){
    return [
       PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      title: ("Home"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
      PersistentBottomNavBarItem(
      icon: Icon(Icons.person),
      title: ("Profile"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
      PersistentBottomNavBarItem(
      icon: Icon(Icons.settings),
      title: ("Setting"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    ),
    ];
  } 

   return PersistentTabView(
    context, 
    screens: buildScreen(),
    controller: controller,
    items: nabBarItem(),
    navBarStyle: NavBarStyle.style7,
    confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
    );
  }
}