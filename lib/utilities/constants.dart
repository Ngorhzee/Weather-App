
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempStyle = GoogleFonts.spartan(
  fontSize: 68,
  fontWeight: FontWeight.w900,
);
TextStyle kDescriptionStyle=GoogleFonts.nunitoSans(fontSize: 30,fontWeight:FontWeight.bold);
TextStyle kWeatherMessage=GoogleFonts.spartan(fontSize:50,fontWeight: FontWeight.w900);
const apiKey = "1de028d21109ca81cfb94e12c2c67acb";
const openWeather = "https://api.openweathermap.org/data/2.5/weather";
TextStyle kErrorStyle=GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red);
