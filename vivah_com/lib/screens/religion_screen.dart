
import 'package:flutter/material.dart';
import 'email_or_mobile_no_screen.dart';
import 'name_dob_screen.dart';

class ReligionScreen extends StatefulWidget {
  const ReligionScreen({Key? key}) : super(key: key);

  @override
  State<ReligionScreen> createState() => _ReligionScreenState();
}

class _ReligionScreenState extends State<ReligionScreen> {
  @override
  String ? dropdownValue = 'Select religion';
  String ? dropdownValue1 = 'Select community';
  String ? dropdownValue2 = 'Select state';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NameDobScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black26,
              weight: 15,
            )),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox.fromSize(
              size: const Size(120, 120),
              child: ClipOval(
                child: Material(
                  color: Colors.pink,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {},
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.people_alt_sharp,
                            weight: 70,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 40),
            child: Text(
              'Your religion',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Religion',
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
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'Select religion',
                "Hinduism",
                "Islam",
                "Christianity",
                "Sikhism",
                "Buddhism",
                "Jainism",
                "Zoroastrianism (Parsi)",
                "Judaism",
                "Sufism",
                "Animism",
                "Atheism",
                "Tribal Religions"
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
            padding: EdgeInsets.only(top: 20, left: 40),
            child: Text(
              'Community',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 100),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Community',
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
                value: dropdownValue1,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                },
                items: <String>[
                  'Select community',
                  "Brahmin",
                  "Kshatriya",
                  "Vaishya",
                  "Shudra", // Corrected from "Sudra" to "Shudra"
                  "Dalit",
                  "Adivasi",
                  "Jat",
                  "Maratha",
                  "Yadav",
                  "Thakur",
                  "Baniya",
                  'Rajput',
                  "Kayastha",
                  "Gujarati",
                  "Bengali",
                  "Punjabi",
                  "Tamil",
                  "Telugu",
                  "Marwari",
                  "Malayali",
                  "Bihari",
                  "Assamese",
                  "Odia",
                  "Kannada",
                  "Konkani",
                  "Kashmiri",
                  'Sindhi',
                  "Naga",
                  "Manipuri",
                  "Mizo",
                  "Others", // You can add an "Others" option here if needed
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
            padding: EdgeInsets.only(top: 20, left: 40),
            child: Text(
              'Living in',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Living in',
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
                'Select state',
                "Bihar",
                'Chhattisgarh',
                "Goa",
                'Gujarat',
                'Haryana',
                'Himachal Pradesh',
                'Jharkhand',
                'Karnataka',
                "Andhra Pradesh",
                "Arunachal Pradesh",
                "Assam",
                "Kerala",
                "Madhya Pradesh",
                "Maharashtra",
                "Manipur",
                "Meghalaya",
                "Mizoram",
                "Nagaland",
                "Odisha",
                "Punjab",
                "Rajasthan",
                "Sikkim",
                "Tamil Nadu",
                "Telangana",
                "Tripura",
                "Uttar Pradesh",
                "Uttarakhand",
                "West Bengal", // You can add an "Others" option here if needed
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
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: SizedBox(
                width: 205,
                height: 52,
                child: FloatingActionButton.extended(
                  label: const Text('Continue',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,letterSpacing: 0,),),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Email_MoblileScreen(),));
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
