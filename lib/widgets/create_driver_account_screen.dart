import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/city_dropdown_menu.dart';
import 'package:murny_final_project/widgets/second_button.dart';


class CreatDriverAccountScreen extends StatefulWidget {
  const CreatDriverAccountScreen({super.key});

  @override
  State<CreatDriverAccountScreen> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatDriverAccountScreen> {
  String? selectedOption = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "الجنس",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Radio(
                    value: "male",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedOption = value;
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.boy,
                    size: 32,
                  ),
                  Radio(
                    value: "female",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedOption = value;
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.girl,
                    size: 32,
                  ),
                  const Spacer(),
                  const CityDropDownMenu(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              const Text(
                "ارفق رخصة القيادة",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 52,
              ),
              Center(
                child: SecondButton(
                  title: "رخصة القيادة",
                  onPressed: () {},
                  color: Colors.white,
                  isFill: false,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              const Center(
                  child: Text(
                "(ميغابايت 2) PDF,DOCX,DOC",
                style: TextStyle(color: Color(0xff8E98A8)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
