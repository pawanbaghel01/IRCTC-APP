
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawan_test2/core/globals.dart' as gbl;
import 'Search_Train_controller.dart';

class SearchTrainView extends GetView<SearchTrainController> {
  const SearchTrainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo3.png',
              height: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text('Rail Connect'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),          
          Obx(
            () => GestureDetector(
                onTap: () {
                  controller.getImage();
                },
                child: gbl.userProfile.value != ''
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(gbl.userProfile.value),
                        radius: 20,
                      )
                    : Image.asset(
                        'assets/train4.jpg',
                        height: 30,
                      )),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        controller.showFromList();
                      },
                      controller: controller.fromController,
                      decoration: InputDecoration(
                          labelText: 'From',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(12, 12)),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true),
                      keyboardType: TextInputType.none,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your from station';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(Icons.arrow_forward),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        controller.showToList();
                      },
                      controller: controller.toController,
                      decoration: InputDecoration(
                          labelText: 'To',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(12, 12)),
                          ),
                          fillColor: Colors.grey.shade100,
                          filled: true),
                      keyboardType: TextInputType.none,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your to station';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onTap: () {
                  controller.showCalender();
                },
                controller: controller.dateController,
                decoration: InputDecoration(
                    labelText: 'Travel Date',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true),
                keyboardType: TextInputType.none,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter travel date';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Class',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true),
                borderRadius: BorderRadius.circular(10),
                value: controller.classValue,
                items: const [
                  DropdownMenuItem(
                    value: 'Sleeper',
                    child: Text('Sleeper'),
                  ),
                  DropdownMenuItem(
                    value: 'Ac 3 Tier',
                    child: Text('Ac 3 Tier'),
                  ),
                  DropdownMenuItem(
                    value: 'Ac 2 Tier',
                    child: Text('Ac 2 Tier'),
                  ),
                  DropdownMenuItem(
                    value: 'First Class',
                    child: Text('First Class'),
                  ),
                ],
                onChanged: (value) {
                  controller.classValue = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a class';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'Quota',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true),
                borderRadius: BorderRadius.circular(10),
                value: controller.quotaValue,
                items: const [
                  DropdownMenuItem(
                    value: 'General',
                    child: Text('General'),
                  ),
                  DropdownMenuItem(
                    value: 'Tatkal',
                    child: Text('Tatkal'),
                  ),
                  DropdownMenuItem(
                    value: 'Ladies',
                    child: Text('Ladies'),
                  ),
                  DropdownMenuItem(
                    value: 'Senior Citizen',
                    child: Text('Senior Citizen'),
                  ),
                ],
                onChanged: (value) {
                  controller.quotaValue = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a Quota';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                controller.formValid.value = false;
                controller.checkValidation();
              },
              child: const Text('Search Train'),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => controller.formValid.value
                  ? Card(
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From: ${controller.fromController.text}"),
                            Text("To: ${controller.toController.text}"),
                            Text(
                                "Travel Date: ${controller.dateController.text}"),
                            Text("Class: ${controller.classValue}"),
                            Text("Quota: ${controller.quotaValue}"),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
