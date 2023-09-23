import 'package:flutter/material.dart';
import 'bottom_navigation_screen.dart';
import 'email_or_mobile_no_screen.dart';

class QulalificationScreen extends StatefulWidget {
  const QulalificationScreen({Key? key}) : super(key: key);

  @override
  State<QulalificationScreen> createState() => _QulalificationScreenState();
}
       String ? dropdownValue2 = 'Qualification';
        String ? dropdownValue3 = 'Working area';
        String ? dropdownValue4 = 'You Work as';
        String ? dropdownValue5 = 'Your annual income *';
class _QulalificationScreenState extends State<QulalificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Email_MoblileScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black26,
              weight: 15,
            )),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children:  [
          const Padding(
            padding: EdgeInsets.only(top: 00),
            child: Center(
              child: Text(
                "You are almost done!",
                style: TextStyle(color: Colors.black87, fontSize: 22),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 260),
            child: Text(
              "*Mandatory fields",
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration:  const InputDecoration(
                labelText: 'Your highest qualification*',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 1,
                  ),
                ),
                filled: false,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue2,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
              items: <String>[
                'Qualification',
                'High School (10th Standard)',
                'Intermediate (12th Standard)',
                'Bachelor\'s Degree ',
                'Master\'s Degree ',
                'Ph.D',
                'Diploma Courses',
                'Certificate Courses',
                'Vocational Training Programs',
                'Post Graduate Diploma ',
                'Integrated Dual Degree Programs ',

              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 17),
                  ),
                );
              }).toList(),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Collage name',
                  hintText: '',
                ),
              )
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration:  const InputDecoration(
                labelText: 'Your highest qualification*',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 1,
                  ),
                ),
                filled: false,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue3,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue3 = newValue!;
                });
              },
              items: <String>[
                'Working area',
                'private Company',
                'Government / Public Sector',
                'Defence / Civil Services',
                'Business / Self Employed',
                'Not Working',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 17),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration:  const InputDecoration(
                labelText: 'You Work as',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 1,
                  ),
                ),
                filled: false,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue4,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue4 = newValue!;
                });
              },
              items: <String>[
                'You Work as',
                'Accounting,Banking & Finance',
                'Administration & HR',
                'Advertising,Media & Entertainment',
                'Agriculture',
                'Airline & Aviation',
                'Architecture & Design',
                'Artists,Animators & Web Designers',
                'Beauty,fashion & Jewellery Designers',
                'BPO,KPO,& Customer Support',
                'Civil Service / Law Enforcement',
                'Defense',
                'Education & training',
                'Engineering',
                'Hotel & Hospitality',
                'Other',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration:  const InputDecoration(
                labelText: 'Your annual income *',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 1,
                  ),
                ),
                filled: false,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              value: dropdownValue5,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue5 = newValue!;
                });
              },
              items: <String>[
                'Your annual income *',
                'Upto INR 1 Lakh',
                'INR 1 Lakh to 2 Lakh',
                'INR 2 Lakh to 4 Lakh',
                'INR 4 Lakh to 7 Lakh',
                'INR 7 Lakh to 10 Lakh',
                'INR 10 Lakh to 15 Lakh',
                'INR 15 Lakh to 20 Lakh',
                'INR 20 Lakh to 30 Lakh',
                'INR 30 Lakh to 50 Lakh',
                'INR 50 Lakh to 75 Lakh',
                'INR 75 Lakh to 1 Crore',
                'INR 1 Crore & above',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: SizedBox(
                width: 205,
                height: 52,
                child: FloatingActionButton.extended(
                  label: const Text('Create Profile',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 0,),),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigationScreen(),));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
