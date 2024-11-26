
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Edit_Passenger_controller.dart';

class EditPassengerView extends GetView<EditPassengerController>{
   EditPassengerView({super.key});
  final QueryDocumentSnapshot document = Get.arguments;
  
  @override
  
  Widget build(BuildContext context) {
      controller.nameController.text = document['Name']??'';
      controller.ageController.text = document['Age'] ?? '';
      controller.addressController.text = document['Address'] ?? '';
       controller.mobileController.text = document['MobileNumber'] ?? '';
       controller.preferences.value = document['Preferences'] ?? '';
       controller.genderText.value = document['Gender'] ?? '';
    return GestureDetector(
      onTap:() => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Passenger Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(
              key: controller.editFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextFeild('Name',TextInputType.name,false,controller.nameController),
                  customTextFeild('Age',TextInputType.number,true,controller.ageController),
               // add gender field
               const Padding(
                  padding:  EdgeInsets.only(left: 20,top: 8),
                  child: Text('Gender',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30,top: 3,bottom: 5),
                  child: Obx( ()=> Row(
                      children: [
                      Row(
                        children: [
                          Radio(value: 1, groupValue: controller.gender.value, onChanged: (value){
                            controller.gender.value = value!;
                          }),
                          const SizedBox(width: 6,),
                         const Text('Male'),
                        ],
                      ),
                      const SizedBox(width: 20,),
                       Row(
                        children: [
                        Radio(value: 2, groupValue: controller.gender.value, onChanged: (value){
                            controller.gender.value = value!;
                          }), 
                        const SizedBox(width: 6,),
                        const Text('Female'),
                        ],
                      ),
                      const SizedBox(width: 20,),
                       Row(
                        children: [
                       Radio(value: 3, groupValue: controller.gender.value, onChanged: (value){
                            controller.gender.value = value!;
                          }),
                          const SizedBox(width: 6,),
                         const Text('Other'),
                        ],
                      ),
                      ],
                    ),
                  ),
                ),
              // add preferences
              const Padding(
                  padding:  EdgeInsets.only(left: 20,top: 8),
                  child: Text('Berth Preferences',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,bottom: 8),
                 child: Card(
                   child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      
                                      hint:  Obx(() => controller.preferences.value != '' ? Text('${controller.preferences.value}                 ') 
                                        :const Text('Select Preferences         ')),
                                        borderRadius: BorderRadius.circular(10),
                                        padding:  EdgeInsets.all(Get.height*0.01),
                                        items: controller.preferencesList.map((index) {
                                          return DropdownMenuItem(
                                            value: index,
                                            child: Text(index),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                        controller.preferences.value = "${value!}";
                                        }),
                                  ),
                 ),
               ),
              customTextFeild('Address',TextInputType.streetAddress,true,controller.addressController),
              customTextFeild('Mobile',TextInputType.phone,true,controller.mobileController),
                          
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 40,bottom: 20),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    controller.checkValidation(document.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize:const Size(400, 50),
                  ), child:const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white) ),
                  ),
                ),
              ),
              ],),
            ),
          ],
        ),
      ),
    );
  }

  Padding customTextFeild(String labelText,TextInputType inputType,bool isHide,TextEditingController textEditingController) {
    return Padding(
          padding: const EdgeInsets.only(left: 20,bottom: 8,top: 8,right: 20),
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
            labelText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 84, 83, 83)),
          ),
              TextFormField(
                  enabled: isHide,
                  controller: textEditingController,
                  style:const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),
                  keyboardType: inputType,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
            ],
          ),
        );
  }

}