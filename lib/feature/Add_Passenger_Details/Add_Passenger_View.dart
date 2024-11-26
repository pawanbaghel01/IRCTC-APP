 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawan_test2/feature/Add_Passenger_Details/Add_Passenger_controller.dart';

class AddPassengerView extends GetView<AddPassengerController> {
  const AddPassengerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Passenger Details',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Form(
              key: controller.addFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customTextFeild('Name', 'Enter Your Name', controller.nameController,TextInputType.name),
                  customTextFeild('Age', 'Enter Age', controller.ageContorller,TextInputType.number),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 8),
                    child: Text(
                      'Gender',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 3, bottom: 5),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Radio(
                                value: 1,
                                groupValue: controller.gender.value,
                                onChanged: (value) {
                                  controller.selectGender(value!);
                                },
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text('Male'),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Obx(
                              () => Radio(
                                value: 2,
                                groupValue: controller.gender.value,
                                onChanged: (value) {
                                  controller.selectGender(value!);
                                },
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text('Female'),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            Obx(
                              () => Radio(
                                value: 3,
                                groupValue: controller.gender.value,
                                onChanged: (value) {
                                  controller.selectGender(value!);
                                },
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text('Other'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 8),
                    child: Text(
                      'Berth Preferences',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 8),
                    child: Card(
                      child: DropdownButtonHideUnderline(
                        child: Obx(
                          () => DropdownButton(
                            hint: controller.preferences.value != ''
                                ? Text('${controller.preferences.value}                 ')
                                : const Text('Select Preferences         '),
                            borderRadius: BorderRadius.circular(10),
                            padding: EdgeInsets.all(Get.height * 0.01),
                            items: controller.preferencesList.map((index) {
                              return DropdownMenuItem(
                                value: index,
                                child: Text(index),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.preferences.value = "${value!}";
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  customTextFeild('Address Details', 'Enter Address', controller.addressController,TextInputType.emailAddress),
                  customTextFeild('Mobile Number', 'Enter Mobile Number', controller.mobileController,TextInputType.phone),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.checkValidation();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: const Size(400, 50),
                        ),
                        child: const Text(
                          'Book',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding customTextFeild(String labelText, String hintText, TextEditingController textController,TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 84, 83, 83)),
          ),
          TextFormField(
            controller: textController,
            style:const TextStyle(fontSize: 19,fontWeight: FontWeight.w600,),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 18),
              fillColor: Colors.grey.shade100,
              filled: true,
            ),
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
