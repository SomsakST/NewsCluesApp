// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, sort_child_properties_last, prefer_collection_literals, deprecated_member_use

import 'dart:core';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:main_cluesnew/BottomBar/HomeBar.dart';
import 'package:main_cluesnew/model/datadetail.dart';
import 'package:main_cluesnew/model/Type.dart';

class Formclues extends StatefulWidget {
  const Formclues({Key? key}) : super(key: key);
  @override
  State<Formclues> createState() => _FormcluesState();
}

class _FormcluesState extends State<Formclues> {
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController detaillsController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pointController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String dropdownValue = '';
  List<Type> dropdownItem = Type.getType();
  late List<DropdownMenuItem<Type>> dropdownMenuItems;
  late Type _selectedItem;

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
    dateController.dispose();
  }

  @override
  void initState() {
    timeController.text = "";
    dateController.text = "";
    super.initState();
    _loadGeo();
    dropdownMenuItems = createDropdownMenu(dropdownItem);
    _selectedItem = dropdownMenuItems[0].value!;
  }

// signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Nevbar()));
  }

// กำหนดการตั้งค่า Firebase.......................................................................
  final FirebaseAuth auth = FirebaseAuth.instance;
  Cluesdata cluesdata = Cluesdata(
    Location: '',
    Date: '',
    Time: '',
    Type: '',
    Details: '',
    Name: '',
    Phone: '',
    Point: '',
    Address: '',
  );
  // เตรียม firebase
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final CollectionReference _cluesdataCollection =
      FirebaseFirestore.instance.collection("cluesdata");
// กำหนดการตั้งค่า Firebase........................................................................

  int currentStep = 0;
  bool isCompleted = false;

  var _lat = 0.0;
  var _long = 0.0;
  late Position userLocation;
  var position = const LatLng(0, 0);
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    userLocation = await Geolocator.getCurrentPosition();
    return userLocation;
  }

  _loadGeo() async {
    Position _userLocation = await Geolocator.getCurrentPosition();
    setState(() {
      userLocation = _userLocation;
      position = LatLng(userLocation.latitude, userLocation.longitude);
    });
  }

  // final formKey0 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
          primary: Color(0xFF244684),
        )),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/Newclues.7.png'),
              fit: BoxFit.cover,
            )),
            child: Stepper(
              steps: getSteps(),
              type: StepperType.horizontal,
              currentStep: currentStep,
              // onStepTapped: (step) {
              //   formKey.currentState!.validate(); //this will trigger validation
              //   setState(() {
              //     currentStep = step;
              //   });
              // },
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;

                if (currentStep == 1) {
                  FocusScope.of(context).unfocus();
                  formKey1.currentState!.validate();
                }
                // if (currentStep == 2) {
                //   formKey2.currentState!.validate();
                // }
                // print("==== ${currentStep}");
                if (isLastStep) {
                  setState(() {
                    isCompleted = true;
                  });
                } else {
                  if (currentStep == 1) {
                    if (isDetailComplete()) {
                      setState(() {
                        currentStep += 1;
                      });
                    }
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                }
              },
              onStepCancel: () {
                if (currentStep == 0) {
                  signOut();
                } else {
                  setState(() {
                    currentStep -= 1;
                  });
                }
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_circle_left_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('ย้อนกลับ'),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: details.onStepContinue,
                      child: Row(
                        children: const [
                          Text('ถัดไป'),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_circle_right_outlined),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool isDetailComplete() {
    // print("-------" + currentStep.toString());
    if (currentStep == 1) {
      //check sender fields
      if (pointController.text.isEmpty || pointController.text.isEmpty) {
        return false;
      }
      if (detaillsController.text.isEmpty || detaillsController.text.isEmpty) {
        return false;
      }
      if (timeController.text.isEmpty || timeController.text.isEmpty) {
        return false;
      }
      if (dateController.text.isEmpty || dateController.text.isEmpty) {
        return false;
      }
      if (dropdownValue.isEmpty || dropdownValue.isEmpty) {
        return false;
      } else {
        return true; //if all fields are not empty
      }
    } else {
      return false;
    }
  }

  //This will be your screens
  List<Step> getSteps() => [
        Step(
            title: const Text('สถานที่'),
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("สถานที่พบเบาะเเส",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 21, 75),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
                const Text("*ค้นหาสถานที่ก่อนกดถัดไป",
                    style: TextStyle(
                        color: Color.fromARGB(255, 238, 13, 54),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                const Divider(
                  height: 15,
                  color: Color.fromARGB(255, 12, 24, 94),
                ),
                SizedBox(
                  height: 10,
                ),
                const Text("กรอกข้อมูล ( หมู่บ้าน,ซอย,ตำบล,อำเภอ,จังหวัด ) "),
                const SizedBox(height: 8),
                TextFormField(
                  controller: addressController,
                  onSaved: (Address) {
                    cluesdata.Address = Address!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide:
                          BorderSide(color: Color(0xFF244684), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide:
                          BorderSide(color: Color(0xFF244684), width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    prefixIcon: Icon(
                      Icons.location_searching_outlined,
                      color: Colors.grey,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  maxLines: 5,
                  minLines: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("ปักหมุดสถานที่พบ"),
                const SizedBox(height: 8),
                SizedBox(
                  height: 450,
                  width: 600,
                  child: FutureBuilder(
                    future: _getLocation(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GoogleMap(
                          mapType: MapType.normal,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                          gestureRecognizers: Set()
                            ..add(Factory<OneSequenceGestureRecognizer>(
                                () => EagerGestureRecognizer()))
                            ..add(Factory<PanGestureRecognizer>(
                                () => PanGestureRecognizer()))
                            ..add(Factory<ScaleGestureRecognizer>(
                                () => ScaleGestureRecognizer()))
                            ..add(Factory<TapGestureRecognizer>(
                                () => TapGestureRecognizer()))
                            ..add(Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer())),
                          onTap: (value) {
                            setState(() {
                              position = LatLng(
                                value.latitude,
                                value.longitude,
                              );
                            });
                            setState(() {
                              _lat = userLocation.latitude;
                              _long = userLocation.longitude;
                              locationController.text = "$_lat,$_long";
                            });
                          },
                          markers: <Marker>[
                            Marker(
                              markerId: const MarkerId('id'),
                              position: position,
                              infoWindow: InfoWindow(
                                  title: 'สถานที่พบเบาะเเส',
                                  snippet:
                                      'lat = ${position.latitude}, lng = ${position.longitude}'),
                            ),
                          ].toSet(),
                          initialCameraPosition: CameraPosition(
                              target: LatLng(userLocation.latitude,
                                  userLocation.longitude),
                              zoom: 15),
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              const CircularProgressIndicator(),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                    child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 25,
                  ),
                  label: const Text("ค้นหาสถานที่"),
                  onPressed: () {
                    mapController.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(position.latitude, position.longitude), 18));
                    setState(() {
                      _lat = position.latitude;
                      _long = position.longitude;
                      locationController.text = "$_lat,$_long";
                    });
                    Fluttertoast.showToast(
                      msg: "ค้นพบสถานที่เรียบร้อยแล้ว",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: const Color(0xFF244684),
                      textColor: Colors.white,
                      fontSize: 15,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                )),
                const SizedBox(
                  height: 20,
                )
              ],
            )),
        Step(
            title: const Text('กรอกข้อมูล'),
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            content: Form(
              key: formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("รายละเอียดของเบาะแส",
                      style: TextStyle(
                          color: Color.fromARGB(255, 23, 21, 75),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  const Text("กรอกรายละเอียดของเบาะแสที่ท่านพบให้ครบถ้วน",
                      style: TextStyle(
                          color: Color.fromARGB(255, 23, 21, 75),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  const Divider(
                    height: 10,
                    color: Color(0xFF244684),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("วัน-เดิอน-ปี เเละ เวลา ที่พบการกระทำผิด"),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*กรุณากรอกข้อมูลให้ครบ";
                          }
                          return null;
                        },
                        controller: dateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(
                                  color: Color(0xFF244684), width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            prefixIcon: Icon(
                              Icons.date_range_rounded,
                              color: Colors.grey,
                            ),
                            labelText: "วัน-เดือน-ปี"),
                        readOnly: true,
                        onSaved: (Date) {
                          cluesdata.Date = Date!;
                        },
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              dateController.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "*กรุณากรอกข้อมูลให้ครบ";
                          }
                          return null;
                        },
                        controller: timeController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32))),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide: BorderSide(
                                  color: Color(0xFF244684), width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2),
                            ),
                            prefixIcon: Icon(
                              Icons.timelapse_rounded,
                              color: Colors.grey,
                            ),
                            labelText: "เวลา"),
                        readOnly: true,
                        onSaved: (Time) {
                          cluesdata.Time = Time!;
                        },
                        onTap: () async {
                          var time = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          timeController.text = time!.format(context);
                        },
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("ประเภทของคดี"),
                  const SizedBox(height: 8),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: Icon(
                        Icons.view_comfy_alt_outlined,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'ประเภทของคดี',
                        style: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      // fillColor: Colors.white,
                    ),
                    // dropdownColor: Colors.white,
                    value: dropdownValue,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "*กรุณากรอกข้อมูลให้ครบ";
                      }
                      return null;
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      '',
                      'การกู้ยืมเงินที่เป็นการฉ้อโกงประชาชน',
                      'การแลกเปลี่ยนเงิน',
                      'การเสนอราคาต่อหน่วยงานของรัฐ	',
                      'เครื่องหมายการค้า',
                      'บริษัทมหาชนจำกัด',
                      'การฟอกเงิน',
                      'สิทธิบัตร',
                      'หลักทรัพย์และตลาดหลักทรัพย์',
                      'ศุลกากร',
                      'ภาษีสรรพสามิต',
                      'การกระทำความผิดเกี่ยวกับคอมพิวเตอร์',
                      'การประกอบธุรกิจของคนต่างด้าว',
                      'การค้ามนุษย์',
                      'แร่',
                      'ธุรกิจสถาบันการเงิน',
                      'วัตถุอันตราย',
                      'การสงวนและคุ้มครองสัตว์ป่า',
                      'ป่าไม้',
                      'ป่าสงวนแห่งชาติ',
                      'อุทยานแห่งชาติ'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("รายละเอียดเบาะแส/การกระทำผิด"),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: detaillsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "*กรุณากรอกข้อมูลให้ครบ";
                      }
                      return null;
                    },
                    onSaved: (Details) {
                      cluesdata.Details = Details!;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: Icon(
                        Icons.description_outlined,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'รายละเอียดเบาะแส/การกระทำผิด',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("จุดประสงค์ที่ต้องการให้ DSI ช่วยเหลือ/ดำเนินคดี"),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: pointController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "*กรุณากรอกข้อมูลให้ครบ";
                      }
                      return null;
                    },
                    onSaved: (Point) {
                      cluesdata.Point = Point!;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide:
                            BorderSide(color: Color(0xFF244684), width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'จุดประสงค์ที่ต้องการให้ช่วยเหลือ/ดำเนินคดี',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    maxLines: 5,
                    minLines: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("ประสงค์เเสดงตัวตน",
                      style: TextStyle(
                          color: Color.fromARGB(255, 23, 21, 75),
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold)),
                  const Text("*หากท่านไม่ประสงค์เเสดงตัวตนไม่ต้องกรอกข้อมูล*",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold)),
                  const Divider(
                    height: 10,
                    color: Colors.indigo,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        onSaved: (Name) {
                          cluesdata.Name = Name!;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide:
                                BorderSide(color: Color(0xFF244684), width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide:
                                BorderSide(color: Color(0xFF244684), width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.people_outline_rounded,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'ชื่อ - สกุล',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: phoneController,
                        onSaved: (Phone) {
                          cluesdata.Phone = Phone!;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide:
                                BorderSide(color: Color(0xFF244684), width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide:
                                BorderSide(color: Color(0xFF244684), width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android_rounded,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'กรอกเบอร์โทรศัพท์ 10 หลัก',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text('ยืนยันข้อมูล'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("ยืนยันการเเจ้งเบาะแส",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 21, 75),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
                const Text("ตรวจสอบรายละเอียดก่อนทำการยืนยัน",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 21, 75),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold)),
                const Divider(
                  height: 10,
                  color: Colors.indigo,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('ที่อยู่'),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(': ${addressController.text}')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('สถานที่พบเบาะเเส'),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                                ': ละติจูดที่ $_lat\n: ลองติจูดที่ $_long')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range_rounded,
                          size: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('วันที่พบเบาะเเส'),
                            Text(': ${dateController.text}'),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.timelapse_rounded,
                          size: 35,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('เวลาที่พบเบาะเเส'),
                            Text(': ${timeController.text}'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.view_comfy_alt_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('ประเภทของเบาะเเส'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(': ${dropdownValue}'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('รายละเอียดของเบาะเเส'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(': ${detaillsController.text}'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.api_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                            'จุดประสงค์ที่ต้องการให้ DSI ช่วยเหลือ/ดำเนินคดี'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(': ${pointController.text}'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.person_pin_outlined,
                      size: 35,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('ผู้เเจ้งเบาะเเส'),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(': ${nameController.text}'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(': ${phoneController.text}'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Save(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                      'images/1.png',
                      scale: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ))
      ];

  Widget Save() {
    return SizedBox(
        height: 50,
        width: double.maxFinite,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32))),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 26, 62, 145)),
          ),
          onPressed: () async {
            // if (formKey.currentState!.validate()) {
            // formKey.currentState!.save();
            await _cluesdataCollection.add({
              "Location": locationController.text,
              "Date": dateController.text,
              "Time": timeController.text,
              "Type": dropdownValue,
              "Detaill": detaillsController.text,
              "Name": nameController.text,
              "Phone": phoneController.text,
              "Point": pointController.text,
              "Address": addressController.text
            });
            AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'บันทึกข้อมูลเรียบร้อยแล้ว',
                btnOkText: "ตกลง",
                btnOkOnPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Nevbar()),
                  );
                }).show();
          },
          child: const Text(
            "บันทึก",
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}

List<DropdownMenuItem<Type>> createDropdownMenu(List<Type> dropdownItem) {
  List<DropdownMenuItem<Type>> items = [];
  for (var item in dropdownItem) {
    items.add(DropdownMenuItem(
      value: item,
      child: Text(item.name),
    ));
  }
  return items;
}
