
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding customTextField(String lable, String hintText,TextInputType inputType,
    IconData iconData, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          label:  Text(lable),
          prefixIcon:  Icon(iconData),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.elliptical(12, 12)),
          ),
          fillColor: Colors.grey.shade100,
          filled: true),
      validator: (value) {
        if (value == '') {
          return "Please $hintText";
        }
        return null;
      },
    ),
  );
}

 Future<dynamic> customDialog() => showDialog(context: Get.overlayContext!, builder: (context) => const Center(child: CircularProgressIndicator(),),);

// void showDoneStatus() {
//     Get.defaultDialog( 
//       barrierDismissible: false,
//       title:'Success',
//       content: Column(
//         children: [
//           Image.asset('assets/successful.png',height: 100,),
//           const Text('Thank you, your information has been saved',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
//         ],
//       ),
//       actions: [
        
//         ElevatedButton(onPressed: (){
//           Get.back();
//           Get.offNamed(RouteConstant.passengerListpage);
//         },
//          style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.purple,
//                     ),
//          child:  const Text('Ok',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),)
//       ]
//     );
//   }