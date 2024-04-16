import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kridaverse/utilities/images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> data = [
    {'title': 'Laundry', 'image': Images.laundry},
    {'title': 'Steam Press', 'image': Images.steampress},
    {'title': 'Dry Clean(men)', 'image': Images.dryClean},
    {'title': 'Household laundry', 'image': Images.householdLaundry},
    {'title': 'Shoe bag', 'image': Images.shoebag},
  ];
  List<List<Map<String, String>>> content = [
    [
      {'title': 'Wash and Fold', 'cost': '60'}
    ],
    [
      {'title': 'Clothes (Men)', 'cost': '60'},
      {'title': 'Clothes (Women)', 'cost': '60'}
    ],
    [
      {'title': 'Socks', 'cost': '60'},
      {'title': 'Kanduwa', 'cost': '60'}
    ],
    [
      {'title': 'Pillow cover', 'cost': '60'},
      {'title': 'Door mat', 'cost': '60'}
    ],
    [
      {'title': 'Hand bag', 'cost': '60'},
      {'title': 'Shoe', 'cost': '60'}
    ],
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: Text(
          'Price list',
          style: GoogleFonts.outfit().copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
            color: const Color(0xFF2D2D2D),
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(Images.search),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 29.5,
                  color: Color(0x1A000000),
                ),
              ],
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    margin: const EdgeInsets.all(8),
                    width: 116,
                    height: 68,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.blueAccent
                          : Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: selectedIndex == index
                          ? const [
                              BoxShadow(
                                offset: Offset(0, 3.49),
                                blurRadius: 15.51,
                                color: Color(0x40000000),
                              ),
                            ]
                          : null,
                    ),
                    alignment: Alignment.center,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          data[index]['image']!,
                          color: selectedIndex == index ? Colors.white : null,
                          scale: 0.9,
                        ),
                        Text(
                          data[index]['title']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit().copyWith(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data[selectedIndex]['title']!,
                    style: GoogleFonts.outfit().copyWith(
                      color: const Color(0xFF363535),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: content[selectedIndex].length,
                      itemBuilder: (ctx, index) {
                        return AnimatedContainer(
                          padding: const EdgeInsets.only(left: 25, right: 20),
                          margin: const EdgeInsets.only(bottom: 10),
                          height: 65,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 18.6,
                                color: Color(0x0A000000),
                              ),
                              BoxShadow(
                                offset: Offset(0, 6),
                                blurRadius: 20.9,
                                color: Color(0x0D000000),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                content[selectedIndex][index]['title']!,
                                textAlign: TextAlign.center,
                                style:
                                    GoogleFonts.outfit().copyWith(fontSize: 14),
                              ),
                              Text(
                                '\$${content[selectedIndex][index]['cost']!}/Kg',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit().copyWith(
                                    fontWeight: FontWeight.w600, fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
