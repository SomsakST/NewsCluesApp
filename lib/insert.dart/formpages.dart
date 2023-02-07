// // ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

// import 'dart:core';

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:main_cluesnew/model/datadetail.dart';
// import 'package:intl/intl.dart';
// import 'package:main_cluesnew/model/Type.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Formclues extends StatefulWidget {
//   const Formclues({Key? key}) : super(key: key);

//   @override
//   State<Formclues> createState() => _FormcluesState();
// }

// class _FormcluesState extends State<Formclues> {
//   List<Type> dropdownItem = Type.getType();
//   late List<DropdownMenuItem<Type>> dropdownMenuItems;
//   late Type _selectedItem;

// // กำหนดตัวเเปลของเวลาเเละวัน
//   TextEditingController timeController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     timeController.dispose();
//     dateController.dispose();
//   }

//   @override
//   void initState() {
//     timeController.text = "";
//     dateController.text = "";
//     super.initState();

//     dropdownMenuItems = createDropdownMenu(dropdownItem);
//     _selectedItem = dropdownMenuItems[0].value!;
//   }
// // กำหนดตัวเเปลของเวลาเเละวัน

// //signout function
//   // signOut() async {
//   //   await auth.signOut();
//   //   Navigator.pushReplacement(
//   //       context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
//   // }
// // กำหนดการตั้งค่า Firebase

//   final FirebaseAuth auth = FirebaseAuth.instance;

//   final formKey = GlobalKey<FormState>();
//   Cluesdata cluesdata = Cluesdata(
//       Location: '',
//       Date: '',
//       Time: '',
//       Type: '',
//       Details: '',
//       Name: '',
//       Phone: '', Point: '');
//   // เตรียม firebase
//   final Future<FirebaseApp> firebase = Firebase.initializeApp();
//   final CollectionReference _cluesdataCollection =
//       FirebaseFirestore.instance.collection("cluesdata");
// // กำหนดการตั้งค่า Firebase
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: firebase,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text("Error"),
//               ),
//               body: Center(
//                 child: Text("${snapshot.error}"),
//               ),
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Scaffold(
//               appBar: AppBar(
//                 automaticallyImplyLeading: false,
//                 title: const Text(
//                   "FormClues",
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 titleSpacing: 20,
//                 centerTitle: true,
//                 toolbarHeight: 70,
//                 toolbarOpacity: 1,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(32),
//                       bottomLeft: Radius.circular(32)),
//                 ),
//                 elevation: 0.00,
//                 backgroundColor: const Color.fromARGB(255, 26, 62, 145),
//                 actions: [
//                   IconButton(
//                       icon: const Padding(
//                         padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
//                         child: Icon(
//                           Icons.logout_rounded,
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           size: 30,
//                         ),
//                       ),
//                       onPressed: () {
//                         // signOut();
//                       })
//                 ],
//               ),
//               body: Container(
//                 padding: const EdgeInsets.all(10),
//                 child: Form(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const Text("รายละเอียดของเบาะแส",
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 26, 62, 145),
//                                 fontSize: 30.0,
//                                 fontWeight: FontWeight.bold)),
//                         const Text("กรอกรายละเอียดของเบาะแสที่ท่านพบให้ครบถ้วน",
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 26, 62, 145),
//                                 fontSize: 15.0,
//                                 fontWeight: FontWeight.bold)),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text("วัน-เดิอน-ปี เเละ เวลา ที่พบการกระทำผิด"),
//                         const SizedBox(height: 8),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ListTile(
//                                   subtitle: TextFormField(
//                                 controller: dateController,
//                                 decoration: const InputDecoration(
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(32))),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(32)),
//                                       borderSide: BorderSide(
//                                           color:
//                                               Color.fromARGB(255, 26, 62, 145),
//                                           width: 2),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(32)),
//                                       borderSide: BorderSide(
//                                           color: Colors.red, width: 2),
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.date_range_rounded,
//                                       color: Colors.grey,
//                                     ),
//                                     labelText: "วัน-เดือน-ปี"),
//                                 readOnly: true,
//                                 onSaved: (Date) {
//                                   cluesdata.Date = Date!;
//                                 },
//                                 onTap: () async {
//                                   DateTime? pickedDate = await showDatePicker(
//                                       context: context,
//                                       initialDate: DateTime.now(),
//                                       firstDate: DateTime(2000),
//                                       lastDate: DateTime(2101));

//                                   if (pickedDate != null) {
//                                     print(pickedDate);
//                                     String formattedDate =
//                                         DateFormat('yyyy-MM-dd')
//                                             .format(pickedDate);
//                                     print(formattedDate);

//                                     setState(() {
//                                       dateController.text = formattedDate;
//                                     });
//                                   } else {
//                                     print("Date is not selected");
//                                   }
//                                 },
//                               )),
//                             ),
//                             Expanded(
//                               child: ListTile(
//                                   subtitle: TextFormField(
//                                 controller:
//                                     timeController, //editing controller of this TextField
//                                 decoration: const InputDecoration(
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(32))),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(32)),
//                                       borderSide: BorderSide(
//                                           color:
//                                               Color.fromARGB(255, 26, 62, 145),
//                                           width: 2),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(32)),
//                                       borderSide: BorderSide(
//                                           color: Colors.red, width: 2),
//                                     ),
//                                     prefixIcon: Icon(
//                                       Icons.timelapse_rounded,
//                                       color: Colors.grey,
//                                     ),
//                                     labelText: "เวลา"),
//                                 readOnly: true,

//                                 onSaved: (Time) {
//                                   cluesdata.Time = Time!;
//                                 },
//                                 onTap: () async {
//                                   var time = await showTimePicker(
//                                     initialTime: TimeOfDay.now(),
//                                     context: context,
//                                   );
//                                   timeController.text = time!.format(context);
//                                 },
//                               )),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text("สถานที่พบเบาะแส/การกระทำความผิด"),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           validator: RequiredValidator(
//                               errorText: "กรุณากรอกข้อมูลให้ครบ"),
//                           onSaved: (Location) {
//                             cluesdata.Location = Location!;
//                           },
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide:
//                                   BorderSide(color: Colors.red, width: 2),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.location_on_rounded,
//                               color: Colors.grey,
//                             ),
//                             label: Text(
//                               'สถานที่พบเบาะแส/การกระทำความผิด',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                           maxLines: 5,
//                           minLines: 1,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text("ประเภทของคดี"),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           validator: RequiredValidator(
//                               errorText: "กรุณากรอกข้อมูลให้ครบ"),
//                           onSaved: (Type) {
//                             cluesdata.Type = Type!;
//                           },
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide:
//                                   BorderSide(color: Colors.red, width: 2),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.list_alt_rounded,
//                               color: Colors.grey,
//                             ),
//                             label: Text(
//                               'ประเภทของคดี',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                           maxLines: 5,
//                           minLines: 1,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text("รายละเอียดเบาะแส/การกระทำผิด"),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           validator: RequiredValidator(
//                               errorText: "กรุณากรอกข้อมูลให้ครบ"),
//                           onSaved: (Details) {
//                             cluesdata.Details = Details!;
//                           },
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide: BorderSide(
//                                   color: Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(32)),
//                               borderSide:
//                                   BorderSide(color: Colors.red, width: 2),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.line_style_rounded,
//                               color: Colors.grey,
//                             ),
//                             label: Text(
//                               'รายละเอียดเบาะแส/การกระทำผิด',
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                           maxLines: 5,
//                           minLines: 1,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text("ประสงค์เเสดงตัวตน"),
//                         const Text("* ไม่ประสงค์เเสดงตัวตนไม่ต้องกรอกข้อมูล *",
//                             style: TextStyle(color: Colors.red)),
//                         const SizedBox(height: 8),
//                         Column(
//                           children: [
//                             TextFormField(
//                               // validator: RequiredValidator(
//                               //     errorText: "กรุณากรอกข้อมูลให้ครบ"),
//                               onSaved: (Name) {
//                                 cluesdata.Name = Name!;
//                               },
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(32)),
//                                   borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 26, 62, 145),
//                                       width: 2),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(32)),
//                                   borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 26, 62, 145),
//                                       width: 2),
//                                 ),
//                                 // errorBorder: OutlineInputBorder(
//                                 //   borderRadius:
//                                 //       BorderRadius.all(Radius.circular(32)),
//                                 //   borderSide:
//                                 //       BorderSide(color: Colors.red, width: 2),
//                                 // ),
//                                 prefixIcon: Icon(
//                                   Icons.people_outline_rounded,
//                                   color: Colors.grey,
//                                 ),
//                                 label: Text(
//                                   'ชื่อ - สกุล',
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                               ),
//                               maxLines: 5,
//                               minLines: 1,
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             TextFormField(
//                               onSaved: (Phone) {
//                                 cluesdata.Phone = Phone!;
//                               },
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(32)),
//                                   borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 26, 62, 145),
//                                       width: 2),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(32)),
//                                   borderSide: BorderSide(
//                                       color:Color.fromARGB(255, 26, 62, 145),
//                                       width: 2),
//                                 ),
//                                 prefixIcon: Icon(
//                                   Icons.phone_android_rounded,
//                                   color: Colors.grey,
//                                 ),
//                                 label: Text(
//                                   'กรอกเบอร์โทรศัพท์ 10 หลัก',
//                                   style: TextStyle(color: Colors.grey),
//                                 ),
//                               ),
//                               maxLines: 5,
//                               minLines: 1,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                               border: Border.all(
//                                   color: const Color.fromARGB(255, 26, 62, 145),
//                                   width: 2),
//                               borderRadius: BorderRadius.circular(32)),
//                           child: DropdownButton(
//                             icon: const Icon(
//                                 Icons.arrow_drop_down_circle_outlined),
//                             elevation: 15,
//                             // style: const TextStyle(color: Colors.black54),
//                             // underline: Container(
//                             //   height: 2,
//                             //   color: Colors.indigo[700],
//                             // ),
//                             value: _selectedItem,
//                             items: dropdownMenuItems,
//                             onChanged: (value) {
//                               setState(() {
//                                 _selectedItem = value as Type;
//                               });
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Save(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         });
//   }

//   Widget Save() {
//     return SizedBox(
//         height: 50,
//         width: double.maxFinite,
//         child: ElevatedButton(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32))),
//             backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 26, 62, 145)),
//           ),
//           onPressed: () async {
//             if (formKey.currentState!.validate()) {
//               formKey.currentState!.save();
//               await _cluesdataCollection.add({
//                 "Location": cluesdata.Location,
//                 "Date": cluesdata.Date,
//                 "Time": cluesdata.Time,
//                 "Type": cluesdata.Type,
//                 "Detaill": cluesdata.Details,
//                 "Name": cluesdata.Name,
//                 "Phone": cluesdata.Phone,
//               });
//               formKey.currentState!.reset();
//               Fluttertoast.showToast(
//                   msg: "บันทึกข้อมูลเรียบร้อยแล้ว",
//                   fontSize: 15,
//                   gravity: ToastGravity.TOP);
//             }
//           },
//           child: const Text(
//             "บันทึก",
//             style: TextStyle(fontSize: 20),
//           ),
//         ));
//   }
// }

// List<DropdownMenuItem<Type>> createDropdownMenu(List<Type> dropdownItem) {
//   List<DropdownMenuItem<Type>> items = [];
//   for (var item in dropdownItem) {
//     items.add(DropdownMenuItem(
//       value: item,
//       child: Text(item.name),
//     ));
//   }
//   return items;
// }
