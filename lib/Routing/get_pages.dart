

import 'package:get/get.dart';
import 'package:pawan_test2/Routing/routeConstant.dart';
import 'package:pawan_test2/feature/Add_Passenger_Details/Add_Passenger_View.dart';
import 'package:pawan_test2/feature/Add_Passenger_Details/Add_Passenger_binding.dart';
import 'package:pawan_test2/feature/DeshBord/dash_board_binding.dart';
import 'package:pawan_test2/feature/Edit_Passenger_Details/Edit_Passenger_binding.dart';
import 'package:pawan_test2/feature/Edit_Passenger_Details/Edit_Passenger_view.dart';
import 'package:pawan_test2/feature/Home_page/homepage_binding.dart';
import 'package:pawan_test2/feature/Home_page/homepage_view.dart';
import 'package:pawan_test2/feature/PassengerMasterList/passengerMasterListbinding.dart';
import 'package:pawan_test2/feature/PassengerMasterList/passengerMasterListview.dart';
import 'package:pawan_test2/feature/SearchTrain/Search_Train_View.dart';
import 'package:pawan_test2/feature/SearchTrain/Search_Train_binding.dart';
import 'package:pawan_test2/feature/login/login_page_binding.dart';
import 'package:pawan_test2/feature/login/login_page_view.dart';
import 'package:pawan_test2/feature/phone_authpage/phone_auth_binding.dart';
import 'package:pawan_test2/feature/phone_authpage/phone_auth_view.dart';
import 'package:pawan_test2/feature/settingspage/setting_page_binding.dart';
import 'package:pawan_test2/feature/settingspage/setting_page_view.dart';
import 'package:pawan_test2/feature/signuppage/signupView.dart';
import 'package:pawan_test2/feature/signuppage/signup_binding.dart';
import 'package:pawan_test2/feature/splashScreen/splashScreenView.dart';
import 'package:pawan_test2/feature/splashScreen/splash_binding.dart';
import '../feature/DeshBord/dash_board_pageview.dart';

List<GetPage> getPage = [
  GetPage( 
    name: RouteConstant.loginpage,
     page: ()=> const LoginPageView(),
     binding: LoginPageBinding(),
     transition: Transition.rightToLeft,
     ),
     GetPage( 
    name: RouteConstant.signuppage,
     page: ()=> const SignUpPageView(),
     binding: SignUpPageBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.homepage,
     page: ()=> const HomePageView(),
     binding: HomePageBinding(),
     transition: Transition.rightToLeft,
     ),
      GetPage( 
    name: RouteConstant.deshpage,
     page: ()=> const DashBoardView(),
     binding: DashBoardBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.splasScreeenhpage,
     page: ()=> const SplashScreenView(),
     binding: SplashScreenBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.phoneAuthpage,
     page: ()=> const PhoneAuthenticationView(),
     binding: PhoneAuthenticationBinding(),
     transition: Transition.rightToLeft,
     ),
      GetPage( 
    name: RouteConstant.searchTrainpage,
     page: ()=> const SearchTrainView(),
     binding: SearchTrainBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.addPassengerpage,
     page: ()=> const AddPassengerView(),
     binding: AddPassengerBinding(),
     transition: Transition.rightToLeft,
     ),
      GetPage( 
    name: RouteConstant.editPassengerpage,
     page: ()=>  EditPassengerView(),
     binding: EditPassengerBinding(),
     transition: Transition.rightToLeft,
     ),
      GetPage( 
    name: RouteConstant.settingpage,
     page: ()=> const SettingPageView(),
     binding: SettingPageBinding(),
     transition: Transition.rightToLeft,
     ),
       GetPage( 
    name: RouteConstant.passengerListpage,
     page: ()=> const PassengerMasterListView(),
     binding: PassengerMasterListBinding(),
     transition: Transition.rightToLeft,
     ),
];