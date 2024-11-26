
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/core/globals.dart' as glb;
import 'package:pawan_test2/feature/settingspage/setting_page_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Home_page/homepage_view.dart';



class DashBoardController extends GetxController{
 
  final controller =PersistentTabController();
   List<Widget> buildScreen (){
    return [
      const HomePageView(),
      const Center(child:  Text('Pawan')),
      const Center(child:  Text('Profile page')),
      const SettingPageView(),
  
    ];
  }
   List<PersistentBottomNavBarItem> nabBarItem(){
    return [
       PersistentBottomNavBarItem(
      icon:const Icon(Icons.home,size: 30,color: Colors.white,),
      title: ("Home"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: const Color(0xFFA7A6A6),
    ),
     PersistentBottomNavBarItem(
      icon:const Icon(Icons.web_asset_off_rounded,size: 30,color: Colors.white,),
      title: ("Like"),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: const Color(0xFFA7A6A6),
    ),
      PersistentBottomNavBarItem(
      icon:const Icon(Icons.person,size: 30,color: Colors.white,),
      title: ("Profile"),
    activeColorPrimary: Colors.blue,
      inactiveColorPrimary: const Color(0xFFA7A6A6),
    ),
      PersistentBottomNavBarItem(
      icon:const Icon(Icons.more_horiz,size: 30,color: Colors.white,),
      title: ("Setting"),
      activeColorPrimary: Colors.blue,
     inactiveColorPrimary: const Color(0xFFA7A6A6),
    ),
     
    ];
  }

    Future<void> setLoginValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", glb.isLogin.value);
  }
  
}