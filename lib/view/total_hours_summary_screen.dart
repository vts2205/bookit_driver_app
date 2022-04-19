import 'package:bookit_driver_app/constants/colors.dart';
import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalHoursSummaryScreen extends StatefulWidget {
  const TotalHoursSummaryScreen({Key? key}) : super(key: key);

  @override
  State<TotalHoursSummaryScreen> createState() =>
      _TotalHoursSummaryScreenState();
}

class _TotalHoursSummaryScreenState extends State<TotalHoursSummaryScreen> {
  int selectedValue = 0;

  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Total Hours Summary'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildFromDate(),
            const SizedBox(height: 20),
            buildToDate(),
            const SizedBox(height: 20),
            if (isVisible) buildTotalWorkingHours(),
            const Spacer(flex: 6),
            buildSubmitButton()
          ],
        ),
      ),
    );
  }

  buildFromDate() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: blue.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'From Date',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                pickDateTime();
              },
              child: Text(
                '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                style: TextStyle(fontSize: 20, color: blue),
              ))
        ],
      ),
    );
  }

  buildToDate() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: blue.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'To Date',
              style: TextStyle(fontSize: 20),
            ),
          ),
          TextButton(
              onPressed: () {
                pickDateTime();
              },
              child: Text(
                '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                style: TextStyle(fontSize: 20, color: blue),
              ))
        ],
      ),
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime =
        DateTime(date.day, date.month, date.year, time.hour, time.minute);

    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: _dateTime.hour, minute: _dateTime.minute),
      );

  buildTotalWorkingHours() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: blue.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Total Working Hours :',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '48 hours 28 mins',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  buildSubmitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue),
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: const Center(
            child: Text('Submit',
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
        ));
  }
}
