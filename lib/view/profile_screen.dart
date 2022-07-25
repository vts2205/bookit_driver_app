import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/controllers/profile_controller.dart';
import 'package:bookit_driver_app/mainScreens/main_screen.dart';
import 'package:bookit_driver_app/models/get_profile_model.dart';
import 'package:bookit_driver_app/models/language_info.dart';
import 'package:bookit_driver_app/service/apiservice.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());

  GetProfileModel? getProfileModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getProfileModel = await APIService().fetchProfile();
    if (getProfileModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Profile Details'),
      drawer: const DrawerWidget(),
      body: buildProfile(),
    );
  }

  buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.blueGrey,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'ID Number :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                '${getProfileModel?.body?.getprofiledetails?[0].driverId}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Name',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.nameController,
            cursorColor: green,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.phoneController,
            cursorColor: green,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Other Phone Number (optional)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.ownerPhoneController,
            cursorColor: green,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Language : ',
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  ...language.map(buildSingleLanguageCheckBox).toList()
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Licence Number : ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${getProfileModel?.body?.getprofiledetails?[0].licenseNumber}',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Expiry Date : ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${getProfileModel?.body?.getprofiledetails?[0].expiryDate}',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Referral Code : ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${getProfileModel?.body?.getprofiledetails?[0].referral}',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Text(
                'Referred Drivers : ',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '3',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {
                Get.off(MainScreen());
              },
              style: ElevatedButton.styleFrom(
                  primary: green, padding: const EdgeInsets.all(10)),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }

  buildLanguageCheckBox(
      {required LanguageModel language, required VoidCallback onClicked}) {
    return Expanded(
      child: ListTile(
          contentPadding: const EdgeInsets.all(5),
          leading: Checkbox(
              activeColor: blue,
              value: language.value,
              onChanged: (value) => onClicked()),
          title: Text(
            language.title,
            style: const TextStyle(fontSize: 15),
          ),
          horizontalTitleGap: 1,
          onTap: onClicked),
    );
  }

  buildSingleLanguageCheckBox(LanguageModel language) {
    return buildLanguageCheckBox(
        language: language,
        onClicked: () {
          setState(() {
            final newValue = !language.value;
            language.value = newValue;
          });
        });
  }
}
