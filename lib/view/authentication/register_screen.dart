import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/view/cab_document_screen/car_documents_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  static const districtList = [
    "Ariyalur",
    "Chengalpattu",
    "Chennai",
    "Coimbatore",
    "Cuddalore",
    "Dharmapuri",
    "Dindigul",
    "Erode",
    "Kallakurichi",
    "Kanchipuram",
    "Kanyakumari",
    "Karur",
    "Krishnagiri",
    "Madurai",
    "Mayiladuthurai",
    "Nagapattinam",
    "Namakkal",
    "Nilgiris",
    "Perambalur",
    "Pondicherry",
    "Pudukkottai",
    "Ramanathapuram",
    "Ranipet",
    "Salem",
    "Sivagangai",
    "Tenkasi",
    "Thanjavur",
    "Theni",
    "Thoothukudi",
    "Tiruchirappalli",
    "Tirunelveli",
    "Tirupattur",
    "Tiruppur",
    "Tiruvallur",
    "Tiruvannamalai",
    "Tiruvarur",
    "Vellore",
    "Viluppuram",
    "Virudhunagar"
  ];

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();

  final ownername = TextEditingController();

  final ownerphone = TextEditingController();

  final driverphone = TextEditingController();

  final location = TextEditingController();

  final license = TextEditingController();

  final date = TextEditingController();

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Register Now',
          style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: blue),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                openWhatsappChat();
              },
              icon: Image.asset('assets/icons/whatsapp.png')),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                launch("tel://+918110800811");
              },
              child: Image.asset(
                'assets/icons/callcenter.png',
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildTextFormField('Enter your name', name, (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid name';
                  }
                  return null;
                }, TextInputType.text),
                const SizedBox(height: 30),
                buildTextFormField('Enter your phone number', driverphone,
                    (value) {
                  if (value?.length != 10)
                    return 'Mobile Number must be of 10 digit';
                  else
                    return null;
                }, TextInputType.number),
                const SizedBox(height: 30),
                buildTextFormField('Enter owner name', ownername, (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid name';
                  }
                  return null;
                }, TextInputType.text),
                const SizedBox(height: 30),
                buildTextFormField('Enter owner phone number', ownerphone,
                    (value) {
                  if (value?.length != 10)
                    return 'Mobile Number must be of 10 digit';
                  else
                    return null;
                }, TextInputType.number),
                const SizedBox(height: 30),
                TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        cursorColor: green,
                        controller: location,
                        decoration: InputDecoration(
                          hintText: 'Enter your district',
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: green, width: 2)),
                        )),
                    suggestionsCallback: (pattern) {
                      return RegisterScreen.districtList.where((item) =>
                          item.toLowerCase().contains(pattern.toLowerCase()));
                    },
                    onSuggestionSelected: (String val) {
                      this.location.text = val;
                      print(val);
                    },
                    itemBuilder: (_, String item) {
                      return ListTile(
                        title: Text(item),
                      );
                    },
                    getImmediateSuggestions: true,
                    hideSuggestionsOnKeyboardHide: false,
                    hideOnEmpty: false,
                    noItemsFoundBuilder: (context) => Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('No item found'),
                        ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid district';
                      }
                      return null;
                    }),
                const SizedBox(height: 30),
                buildTextFormField('Enter your license number', license,
                    (value) {
                  if (value.isEmpty) {
                    return 'Enter a valid license number';
                  }
                  return null;
                }, TextInputType.text),
                const SizedBox(height: 30),
                TextFormField(
                    controller: date,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                        hintText: 'Enter your license expiry date'),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          date.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid expiry date';
                      }
                      return null;
                    }),
                const SizedBox(height: 30),
                //buildTextFormField('Enter your fcm', date),
                buildNextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTextFormField(String text, controller, validator, keyboardType) {
    return TextFormField(
      controller: controller,
      cursorColor: green,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: green, width: 2)),
          hintText: text),
      validator: validator,
    );
  }

  buildNextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue),
        // onPressed: () {
        //   Get.to(CarDocumentScreen());
        // },
        onPressed: () async {
          print("botton clicked");
          if (formKey.currentState!.validate()) {
            Get.dialog(
                Dialog(
                  backgroundColor: blue,
                  child: Container(
                    height: 100,
                    child: SpinKitSpinningLines(
                      color: Colors.white,
                      lineWidth: 3,
                    ),
                  ),
                ),
                barrierDismissible: false);
            var data = await APIService().RegisterDriver(
                name.text,
                driverphone.text,
                ownername.text,
                ownerphone.text,
                location.text,
                license.text,
                date.text);
            print(data['body']['Token']);
            if (data['message'] == 'Driver Created Successfully') {
              box.write('driverId', data['body']['driverId']);
              Fluttertoast.showToast(msg: data['message'], fontSize: 18);
              Get.offAll(CarDocumentScreen());
              print('====success====');
            } else if (data['message'] == 'Driver Already Exists') {
              Fluttertoast.showToast(msg: data['message'], fontSize: 18);
            } else {
              print('====failed====');
            }
          } else {
            Fluttertoast.showToast(msg: 'Enter Required Fields', fontSize: 18);
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
        ));
  }

  void openWhatsappChat() async {
    var url = 'https://wa.me/+918110800811';
    await launch(url);
  }
}
