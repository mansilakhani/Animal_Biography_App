import 'package:animal_bio_app/helpers/animal_db_helper.dart';
import 'package:animal_bio_app/modals/animal.dart';
import 'package:animal_bio_app/screens/detail_page.dart';
import 'package:animal_bio_app/screens/splace_screen.dart';
import 'package:animal_bio_app/utils/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> animalName = [
    "Dog",
    "Cat",
    "Kangaroo",
    "Snake",
    "Owl",
    "Eagle",
    "Rabbit",
    "Parrot",
    "Duck",
    "Panda",
    "Monkey",
    "Elephant",
    "Zebra",
  ];
  List<Animal?> animal = [];

  mySetState() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFc19e82),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/ra.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 20),
                          child: Text(
                            "Welcome To\nAnimal World",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: colorWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              top: 260,
              left: 0,
              right: 0,
              child: Container(
                height: 550,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0XFFc19e82),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        "Related for you",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    //const SizedBox(height: 20),
                    SizedBox(
                      height: 330,
                      width: double.infinity,
                      child: (animalList.isEmpty)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: searchedList.length,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsPage(
                                          animal: searchedList[i],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 180,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 230,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0XFF7b5638)
                                                .withOpacity(0.7),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "${searchedList[i].image}"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "${searchedList[i].name}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "${searchedList[i].mostDistinctiveFeature}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Text(
                        "Quick catergories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Elephant");
                                setState(() {});
                                //log(searchedList.toString(), name: "searched list");
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/elephant.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Elephant",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Panda");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/lion.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Panda",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Snake");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/snake.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Snake",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                searchedList = await AnimalDBHelper
                                    .animalDBHelper
                                    .searchData(val: "Dog");
                                setState(() {});
                              },
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFecd1b3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/dog.png",
                                    height: 38,
                                    width: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Dog",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                padding:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 700),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "a planet",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                            text: 'we love a planet',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
