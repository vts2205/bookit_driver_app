import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/mainScreens/main_screen.dart';
import 'package:bookit_driver_app/view/authentication/verify_otp_screen.dart';
import 'package:bookit_driver_app/view/authentication/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:url_launcher/url_launcher.dart';

AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up : ${message.messageId}');
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController contact = TextEditingController();

  void submit() async {
    if (contact.text == "") return;

    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": contact.text,
      "app_signature_id": appSignatureID
    };
    print(sendOtpData);
    Get.to(VerifyOTPScreen());
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher')));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('${notification.title}'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('${notification.body}')],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    flutterLocalNotificationsPlugin.show(
        0,
        'local testing',
        'here is the local notification testing message',
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/logo/bookitlogo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Login To Start Your Ride',
                      style: TextStyle(
                          fontSize: 25,
                          color: green,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: contact,
                    keyboardType: TextInputType.number,
                    cursorColor: green,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: green, width: 2),
                      ),
                      hintText: 'Enter Your Phone Number',
                    ),
                    validator: (value) {
                      if (value?.length != 10)
                        return 'Mobile Number must be of 10 digit';
                      else
                        return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: green,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: green, width: 2),
                      ),
                      hintText: 'Enter Referral Code',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 2),
                  const SizedBox(height: 10),
                  // PinCodeTextField(
                  //   autofocus: true,
                  //   highlight: true,
                  //   highlightColor: green,
                  //   defaultBorderColor: Colors.black,
                  //   maxLength: 4,
                  //   pinBoxWidth: 40,
                  //   pinBoxHeight: 50,
                  //   hasUnderline: true,
                  //   wrapAlignment: WrapAlignment.spaceAround,
                  //   pinBoxDecoration:
                  //       ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  //   pinBoxRadius: 5,
                  //   pinTextStyle: const TextStyle(fontSize: 22.0),
                  // ),
                  // const SizedBox(height: 20),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(primary: blue),
                  //     onPressed: () {
                  //       if (formKey.currentState!.validate()) {
                  //         Fluttertoast.showToast(
                  //             msg: 'Logged In Successfully', fontSize: 18);
                  //         Get.to(MainScreen());
                  //       } else {
                  //         Fluttertoast.showToast(
                  //             msg: 'Enter Required Fields', fontSize: 18);
                  //       }
                  //     },
                  //     //submit,
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 50,
                  //       child: const Center(
                  //         child: Text(
                  //           'Login',
                  //           style: TextStyle(fontSize: 23, color: Colors.white),
                  //         ),
                  //       ),
                  //     )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: blue),
                      onPressed: () {
                        Get.to(VerifyOTPScreen());
                      },
                      //submit,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 23, color: Colors.white),
                          ),
                        ),
                      )),
                  // const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Get.to(RegisterScreen());
                      },
                      child: Text(
                        'Don\'t have an account? Register Now',
                        style: TextStyle(
                            color: blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xff25D366), width: 2),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 10)
                            ]),
                        child: IconButton(
                            onPressed: () {
                              openWhatsappChat();
                            },
                            icon: Image.asset('assets/icons/whatsapp.png')),
                      ),
                      Text(
                        'Captain Care 24*7',
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("tel://+918110800811");
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 10)
                              ]),
                          child: Image.asset(
                            'assets/icons/callcenter.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       showNotification();
                  //     },
                  //     child: Text('send notification'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void openWhatsappChat() async {
    var url = 'https://wa.me/+918110800811';
    await launch(url);
  }
}
// import 'package:bookit_driver_app/mainScreens/main_screen.dart';
// import 'package:bookit_driver_app/view/authentication/register_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../constants/colors.dart';
// import '../../service/apiservice.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   static const districtList = [
//     "Ariyalur",
//     "Chengalpattu",
//     "Chennai",
//     "Coimbatore",
//     "Cuddalore",
//     "Dharmapuri",
//     "Dindigul",
//     "Erode",
//     "Kallakurichi",
//     "Kanchipuram",
//     "Kanyakumari",
//     "Karur",
//     "Krishnagiri",
//     "Madurai",
//     "Mayiladuthurai",
//     "Nagapattinam",
//     "Namakkal",
//     "Nilgiris",
//     "Perambalur",
//     "Pondicherry",
//     "Pudukkottai",
//     "Ramanathapuram",
//     "Ranipet",
//     "Salem",
//     "Sivagangai",
//     "Tenkasi",
//     "Thanjavur",
//     "Theni",
//     "Thoothukudi",
//     "Tiruchirappalli",
//     "Tirunelveli",
//     "Tirupattur",
//     "Tiruppur",
//     "Tiruvallur",
//     "Tiruvannamalai",
//     "Tiruvarur",
//     "Vellore",
//     "Viluppuram",
//     "Virudhunagar"
//   ];
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final formKey = GlobalKey<FormState>();
//
//   final name = TextEditingController();
//
//   final ownername = TextEditingController();
//
//   final ownerphone = TextEditingController();
//
//   final driverphone = TextEditingController();
//
//   final location = TextEditingController();
//
//   final license = TextEditingController();
//
//   final date = TextEditingController();
//
//   final box = GetStorage();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Register Now',
//           style:
//               TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: blue),
//         ),
//         centerTitle: true,
//         // actions: [
//         //   IconButton(
//         //       onPressed: () {
//         //         openWhatsappChat();
//         //       },
//         //       icon: Image.asset('assets/icons/whatsapp.png')),
//         //   Padding(
//         //     padding: const EdgeInsets.only(right: 10),
//         //     child: GestureDetector(
//         //       onTap: () {
//         //         launch("tel://+918110800811");
//         //       },
//         //       child: Image.asset(
//         //         'assets/icons/callcenter.png',
//         //         width: 40,
//         //       ),
//         //     ),
//         //   )
//         // ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 buildTextFormField('Enter your name', name, (value) {
//                   if (value.isEmpty) {
//                     return 'Enter a valid name';
//                   }
//                   return null;
//                 }, TextInputType.text),
//                 const SizedBox(height: 30),
//                 buildTextFormField('Enter your phone number', driverphone,
//                     (value) {
//                   if (value?.length != 10)
//                     return 'Mobile Number must be of 10 digit';
//                   else
//                     return null;
//                 }, TextInputType.number),
//                 const SizedBox(height: 30),
//                 buildTextFormField('Enter owner name', ownername, (value) {
//                   if (value.isEmpty) {
//                     return 'Enter a valid name';
//                   }
//                   return null;
//                 }, TextInputType.text),
//                 const SizedBox(height: 30),
//                 buildTextFormField('Enter owner phone number', ownerphone,
//                     (value) {
//                   if (value?.length != 10)
//                     return 'Mobile Number must be of 10 digit';
//                   else
//                     return null;
//                 }, TextInputType.number),
//                 const SizedBox(height: 30),
//                 TypeAheadFormField(
//                     textFieldConfiguration: TextFieldConfiguration(
//                         cursorColor: green,
//                         controller: location,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your district',
//                           contentPadding: EdgeInsets.all(10),
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: green, width: 2)),
//                         )),
//                     suggestionsCallback: (pattern) {
//                       return LoginScreen.districtList.where((item) =>
//                           item.toLowerCase().contains(pattern.toLowerCase()));
//                     },
//                     onSuggestionSelected: (String val) {
//                       this.location.text = val;
//                       print(val);
//                     },
//                     itemBuilder: (_, String item) {
//                       return ListTile(
//                         title: Text(item),
//                       );
//                     },
//                     getImmediateSuggestions: true,
//                     hideSuggestionsOnKeyboardHide: false,
//                     hideOnEmpty: false,
//                     noItemsFoundBuilder: (context) => Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: Text('No item found'),
//                         ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter a valid district';
//                       }
//                       return null;
//                     }),
//                 const SizedBox(height: 30),
//                 buildTextFormField('Enter your license number', license,
//                     (value) {
//                   if (value.isEmpty) {
//                     return 'Enter a valid license number';
//                   }
//                   return null;
//                 }, TextInputType.text),
//                 const SizedBox(height: 30),
//                 TextFormField(
//                     controller: date,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(10),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.black)),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: green, width: 2)),
//                         hintText: 'Enter your license expiry date'),
//                     readOnly: true,
//                     onTap: () async {
//                       DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           //DateTime.now() - not to allow to choose before today.
//                           lastDate: DateTime(2101));
//                       if (pickedDate != null) {
//                         print(
//                             pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                         String formattedDate =
//                             DateFormat('dd-MM-yyyy').format(pickedDate);
//                         print(
//                             formattedDate); //formatted date output using intl package =>  2021-03-16
//                         //you can implement different kind of Date Format here according to your requirement
//
//                         setState(() {
//                           date.text =
//                               formattedDate; //set output date to TextField value.
//                         });
//                       } else {
//                         print("Date is not selected");
//                       }
//                     },
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Enter a valid expiry date';
//                       }
//                       return null;
//                     }),
//                 const SizedBox(height: 30),
//                 //buildTextFormField('Enter your fcm', date),
//                 buildNextButton()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   buildTextFormField(String text, controller, validator, keyboardType) {
//     return TextFormField(
//       controller: controller,
//       cursorColor: green,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(10),
//           border:
//               OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: green, width: 2)),
//           hintText: text),
//       validator: validator,
//     );
//   }
//
//   buildNextButton() {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(primary: blue),
//         onPressed: () async {
//           print("botton clicked");
//           if (formKey.currentState!.validate()) {
//             Get.dialog(
//                 Dialog(
//                   backgroundColor: blue,
//                   child: Container(
//                     height: 100,
//                     child: SpinKitSpinningLines(
//                       color: Colors.white,
//                       lineWidth: 3,
//                     ),
//                   ),
//                 ),
//                 barrierDismissible: false);
//             var data = await APIService().RegisterDriver(
//                 name.text,
//                 driverphone.text,
//                 ownername.text,
//                 ownerphone.text,
//                 location.text,
//                 license.text,
//                 date.text);
//             print(data['body']['Token']);
//             if (data['message'] == 'Driver Created Successfully') {
//               box.write('driverId', data['body']['driverId']);
//               box.write('token', data['body']['token']);
//               Fluttertoast.showToast(msg: data['message'], fontSize: 18);
//               Get.offAll(MainScreen());
//               print('====success====');
//             } else if (data['message'] == 'Driver Already Exists') {
//               Fluttertoast.showToast(msg: data['message'], fontSize: 18);
//             } else {
//               print('====failed====');
//             }
//           } else {
//             Fluttertoast.showToast(msg: 'Enter Required Fields', fontSize: 18);
//           }
//         },
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           child: Center(
//             child: Text(
//               'Next',
//               style: TextStyle(color: Colors.white, fontSize: 23),
//             ),
//           ),
//         ));
//   }
// }
