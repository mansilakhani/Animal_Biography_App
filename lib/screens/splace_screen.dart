import 'dart:developer' as log_print;
import 'dart:math';

import 'package:animal_bio_app/helpers/animal_db_helper.dart';
import 'package:animal_bio_app/helpers/subscription_db_helper.dart';
import 'package:animal_bio_app/modals/animal.dart';
import 'package:animal_bio_app/screens/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'customAppBar.dart';

List<String> animalPic = [
  "assets/images/dog1.jpg",
  "assets/images/dog2.jpg",
  "assets/images/kangaroo.jpg",
  "assets/images/snake.jpg",
  "assets/images/owl.jpg",
  "assets/images/eagle.jpg",
  "assets/images/rabbit.jpg",
  "assets/images/parrot.jpg",
  "assets/images/duck.jpg",
  "assets/images/panda.jpg",
  "assets/images/monkey.jpg",
  "assets/images/elephant.jpg",
  "assets/images/ra.jpg",
];

List<Animal> animalList = [];
List<Animal> searchedList = [];
bool connection = true;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Animal?> animal = [];
  Random random = Random();

  initAllThings() async {
    connection = await InternetConnectionChecker().hasConnection;
    log_print.log(connection.toString(), name: "Connection");

    if (connection == true) {
      await AnimalDBHelper.animalDBHelper.deleteAllData();
      int val = await AnimalDBHelper.animalDBHelper
          .insertData(animal: animal, image: animalPic);

      log_print.log(val.toString(), name: "Insert Success");
    }

    animalList = await AnimalDBHelper.animalDBHelper.fetchAllData();
    searchedList = animalList;

    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData1();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData2();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData3();
    await SubscriptionDBHelper.subscriptionDBHelper.deleteAllData4();

    await SubscriptionDBHelper.subscriptionDBHelper.insertData1();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData2();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData3();
    await SubscriptionDBHelper.subscriptionDBHelper.insertData4();

    List modal1 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData1();
    log_print.log(modal1.toString(), name: "Modal1");
    List modal2 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData2();
    List modal3 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData3();
    List modal4 =
        await SubscriptionDBHelper.subscriptionDBHelper.fetchAllData4();

    names.add(modal1[0]["name"]);
    names.add(modal2[0]["name"]);
    names.add(modal3[0]["name"]);
    names.add(modal4[0]["name"]);

    local4Images.add(modal1[0]["image"]);
    local4Images.add(modal2[0]["image"]);
    local4Images.add(modal3[0]["image"]);
    local4Images.add(modal4[0]["image"]);

    price.add(modal1[0]["price"]);
    price.add(modal2[0]["price"]);
    price.add(modal3[0]["price"]);
    price.add(modal4[0]["price"]);

    log_print.log(animalList.toString(), name: "Animal List from Database");
    log_print.log("${animalList[0].image}", name: "image First");
    log_print.log("${animalList[1].image}", name: "image First");
    log_print.log("${animalList[5].image}", name: "image First");
  }

  mySetState() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (animalList.isEmpty || price.isEmpty) {
        mySetState();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAllThings();
    mySetState();
  }

  @override
  Widget build(BuildContext context) {
    int res = random.nextInt(12);
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: (animalList.isEmpty)
          ? Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/1.png",
                    color: const Color(0XFFc19e82),
                  ),
                  CircularProgressIndicator(
                    color: const Color(0XFFc19e82).withOpacity(0.3),
                  ),
                ],
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("${animalList[res].image}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    '${animalList[res].image}',
                    height: _height,
                    fit: BoxFit.fitHeight,
                  ),
                  Column(
                    children: [
                      const CustomAppBar(),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32, left: 32, right: 32),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ready to watch',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(
                                text:
                                    'A planet is a global leader in real life entertainment, serving a passionate audience of superfans around the world with content that inspires, informs and entertains.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(text: '\n'),
                              TextSpan(text: '\n'),
                              TextSpan(
                                  text: 'Start Enjoying',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: -30,
                    right: -30,
                    child: GestureDetector(
                      onTap: () {
                        // isNotChangedPage = false;
                        // Navigator.pushNamedAndRemoveUntil(
                        //   context,
                        //   '/',
                        //   (route) => false,
                        // );
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(builder: (context) => Choose_a_Plan_Page()),
                        // );
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChoosePlanScreen()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFDAD4CC).withOpacity(0.8),
                        ),
                        child: const Align(
                          alignment: Alignment(-0.4, -0.4),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
