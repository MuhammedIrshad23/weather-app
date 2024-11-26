import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Data/image_path.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/Services/location_provider.dart';



class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  bool _clicked = false;

  @override
  void initState() {
    Provider.of<LocationProvider>(context, listen: false).determinePosition();
    super.initState();
  }

  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding:
            const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(background[3]), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            _clicked == true
                ? Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                  )
                : SizedBox.shrink(),

                Container(
                  height: 50,
                  child: Consumer<LocationProvider>(
                    builder: (context,locationProvider,child){
                     return  
                      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                        '${locationProvider.currrentLocationName!.locality}',
                          style: GoogleFonts.inter(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Good night',
                          style: GoogleFonts.sevillana(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _clicked = !_clicked;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            );
                    }), 
                ),
           
            Align(
              alignment: const Alignment(0, -0.6),
              child: Image.asset(
                png[3],
                scale: 05,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment(0, -0.05),
              child: SizedBox(
                height: 130,
                width: 130,
                child: Column(
                  children: [
                    Text(
                      '21°C',
                      style: GoogleFonts.karla(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                    Text(
                      'Night',
                      style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '${DateTime.timestamp().day}/${DateTime.timestamp().month}/${DateTime.timestamp().year}',
                      style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      '${DateTime.timestamp().hour}:${DateTime.timestamp().minute}',
                      style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.75),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: const Color.fromARGB(105, 255, 255, 255)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/pg/high-temperature.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Max',
                                  style: GoogleFonts.nunito(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Text(
                                  '21°C',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/pg/low-temperature.png',
                              height: 55,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temp Max',
                                  style: GoogleFonts.nunito(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Text(
                                  '21°C',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Color.fromARGB(255, 165, 149, 5),
                      thickness: 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/pg/sun.png',
                              height: 50,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: GoogleFonts.nunito(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Time:6.35',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/pg/moon.png',
                              height: 50,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: GoogleFonts.nunito(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Text(
                                  'Time:6.47',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
