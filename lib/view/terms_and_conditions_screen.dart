import 'package:bookit_driver_app/widgets/appbar_widget.dart';
import 'package:bookit_driver_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Terms and Conditions'),
      drawer: DrawerWidget(),
      body: buildTermsAndCondition(),
    );
  }

  buildTermsAndCondition() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Text(
            'Ganishga Bookit  Private limited Terms and Conditions :',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'If this document is not in a language that you understand, you shall failure to do so within 12 hours from the time or receipt of this document and your acceptance of this document by checking on the ‘I Accept’ button shall be considered as your understanding of this document.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'Subscription Agreement',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '1.Drivers should be in uniform only.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '2.Driver should maintain the vehicle clean and neat.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '3.Driver should not ask more than the bill amount from the driver.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '4.Driver should be patience and as well as polite.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '5.Pickup should be on time.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '6.Driver should not be involved in alcoholic activities like smoking/drinking/pan masala while driving.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '7.Drivers should not ask any personal information from the customer.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '8.Driver should follow all the traffic rules.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '9.All the driver documents and vehicle documents should be in current.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '10.Different drivers and different cabs should not be allowed for allotted booking.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '11.If any accidents or any breakdown happen, drivers are only responsible.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '12.Driver should not convert the customer as their personal needs.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '13.Should welcome customers with greetings.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '14.Should serve them by handling their luggage\'s.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '15.Air Conditioning facility must be provided to all customers unless customer requests to switch off.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '16.Customers who are elders, children or handicaps should treat them with equal respect. It is mandatory and social responsibility of a chauffeur.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '17.Should not indulge in any quarrels with any customers.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '18.As per our privacy policy it is strictly prohibited to save or share the contact details of the customers to any external business or own use.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '19.Should not indulge in any quarrels with any customers.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '20.It is offensive to take photography and videography inside the cab using mobile/hidden cameras during business hours.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '21.Vehicle owners should be responsible for vehicle and driver maintenance and should adhere to all RTO norms.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '22.You must make sure all the vehicle (RC, Permit and Insurance) and chauffeur documents (Badge and License) are under validity and renew before expiry.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '23.Should never get into sleep during duty hours.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '24.Chauffeurs shouldn’t consume Alcohol, Pan Masala, Gudka or any other drugs during on duty.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '25.Recording all trip details in the trips sheet is mandatory as per Indian Transport Act.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '26.Any accidents or legal filings against the cab will be your responsibility.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '27.You should make sure the vehicle & chauffeur is clean and tidy before they start their day.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '28.You can make a note of their FUEL and meter readings and make chauffeurs to write trip sheets.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '29.Should follow all traffic rules such as wearing seat belts, following speed limits, traffic signals, No cell phone usages during rides, Overtaking rules, Parking Rules etc.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            '30.Should maintain documents as per RTO norms under validity.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
