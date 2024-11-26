
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/Routing/routeConstant.dart';
import 'passengerMasterListcontroller.dart';

class PassengerMasterListView extends GetView<PassengerMasterListController> {
  const PassengerMasterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Obx(
            () => controller.isSearchClick.value?
             Padding(
               padding: const EdgeInsets.all(20),
               child: SearchBar(
                onChanged: (value){
                controller.searchText.value = value;
                },
                controller: controller.searchController,
                hintText: 'Search your Passenger',
                keyboardType: TextInputType.name,
                leading:const Icon(Icons.search),
                surfaceTintColor:const MaterialStatePropertyAll(Colors.red),
                           ),
             )
                // ? Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Colors.tealAccent,
                //       borderRadius: BorderRadius.circular(32),
                //     ),
                //     child: TextField(
                //       onChanged: (value) {
                //         controller.searchText.value = value;
                //       },
                //       controller: controller.searchController,
                //       decoration: const InputDecoration(
                //         hintStyle: TextStyle(fontSize: 17),
                //         hintText: 'Search your trips',
                //         suffixIcon: Icon(Icons.search),
                //         border: InputBorder.none,
                //         contentPadding: EdgeInsets.all(20),
                //       ),
                //     ),
                //   )
                : const Text(
                    'Passenger Master List',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.isSearchClick.value = !controller.isSearchClick.value;
                if (!controller.isSearchClick.value) {
                  controller.searchText.value = '';
                  controller.searchController.clear();
                }
              },
              
              icon: Obx(() => controller.isSearchClick.value
                  ? const Icon(
                      Icons.clear_outlined,
                      color: Colors.white,
                      size: 30,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
            )
          ],
        ),
        body: Column(
          children: [
            Obx(
              () {
                Stream<QuerySnapshot> stream;
                if (controller.searchText.value.isEmpty) {
                  stream = FirebaseFirestore.instance.collection('passengerList').snapshots();
                } else {
                  stream = FirebaseFirestore.instance
                      .collection('passengerList')
                      .where('Name',
                          isGreaterThanOrEqualTo: controller.searchText.value)
                      .where('Name',
                          isLessThanOrEqualTo: '${controller.searchText.value}\uf8ff')
                      .snapshots();
                }
            
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: StreamBuilder(
                    stream: stream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshots) {
                      if (streamSnapshots.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (streamSnapshots.hasError) {
                        return Center(child: Text('Error: ${streamSnapshots.error}'));
                      } else if (!streamSnapshots.hasData ||
                          streamSnapshots.data!.docs.isEmpty) {
                        return const Center(child: Text('No data found'));
                      }
                            
                      final List<QueryDocumentSnapshot> items =
                          streamSnapshots.data!.docs;
                            
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final todo = items[index];
                            
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 20,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              child: ListTile(
                                tileColor: const Color(0xFF1FF3AF),
                                title: Text("Name :- ${todo['Name']}"),
                                titleTextStyle:const TextStyle(fontSize: 19,fontWeight: FontWeight.w600,color: Colors.black),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Gender :- ${todo['Gender']}",style:const TextStyle(color: Colors.black,fontSize: 16),),
                                      const SizedBox(height: 5,),
                                      Text("Preferences :- ${todo['Preferences']}",style:const TextStyle(color: Colors.black,fontSize: 16),),
                                   
                                    ],
                                  ),
                                ),
                                subtitleTextStyle:const TextStyle(fontSize: 16,),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                       Get.toNamed(RouteConstant.editPassengerpage, arguments: todo);
                                      },
                                      tooltip: 'Update',
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Color(0xFFEAEE14),
                                      ),
                                    ),
                                    IconButton(
                                      tooltip: 'delete',
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red[400],
                                      ),
                                      onPressed: () {
                                       controller.deletePassengerData(todo.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
            ElevatedButton(onPressed: (){
              Get.back();
              Get.toNamed(RouteConstant.addPassengerpage);
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(MediaQuery.of(context).size.width*0.8, MediaQuery.of(context).size.height*0.06)
            ),
             child:const Text('Add Passenger',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),))
          ],
        ),
       
      ),
    );
  }

  TextField inputField(
      String text, TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
