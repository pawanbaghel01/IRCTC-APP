import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  Widget Card2(String name, String title, VoidCallback voidCallback, double width,double height ){
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: GestureDetector(
        onTap: voidCallback,
        child: Card(
          color: Colors.black.withOpacity(0.9),
          margin: const EdgeInsets.all(4),
          elevation: 6,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height * 0.095,
              width: width * 0.39,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: height*0.028),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey, fontSize: height*0.019),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Card1(String name, String title, String img, VoidCallback voidCallback, double width,double height) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: GestureDetector(
        onTap: voidCallback,
        child: Card(
          color: Colors.black.withOpacity(0.3),
          margin: const EdgeInsets.all(4),
          elevation: 6,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: height * 0.19,
              width: width * 0.39,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.blue,
                    ),
                    child: Image(
                      image: AssetImage(img,),
                      height: height*0.08,
                      width: width*0.2,
                      color: const Color.fromARGB(255, 253, 227, 227),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: height*0.028),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey, fontSize: height*0.019),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        
        children: [
          Container(
           // height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/home_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[800]?.withOpacity(0.5),
            ),
            child: Padding(
              padding:  EdgeInsets.all(screenWidth*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    "Train Services",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.025,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card1(
                        "Train",
                        "Search your next Train",
                        "assets/img/train.png",
                        () {
                          controller.toFindTrain();
                        },
                        screenWidth,
                        screenHeight,
                      ),
                      Card1(
                        "Food",
                        "Food Delivery at your Seat",
                        "assets/img/food.png",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card1(
                        "Book Seat",
                        "Passenger Reservation",
                        "assets/img/ask_disha.png",
                        () {
                          controller.toAddPassengerPage();
                        },
                        screenWidth,
                        screenHeight,
                      ),
                      Card1(
                        "Rooms",
                        "Book Rooms at Station",
                        "assets/img/rooms.png",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                  Text(
                    "Other Services",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight*0.025,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card2(
                        "Flight",
                        "Book your next flight",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                      Card2(
                        "Hotel",
                        "Book your next stay",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card2(
                        "Bus",
                        "Book your next bus",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                      Card2(
                        "Tourism",
                        "Explore tour options",
                        () {},
                        screenWidth,
                        screenHeight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
