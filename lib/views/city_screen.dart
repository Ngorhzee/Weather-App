import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/city_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50,),
                TextField(
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    cityName = value;
                  },
                  decoration: InputDecoration(
                      hintText: " Enter City Name",
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    child: Text('Get Weather',
                        style: GoogleFonts.spartan(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.pinkAccent,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
