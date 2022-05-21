

// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart';

import 'package:weatherapp/utilities/constants.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key,this.locationWeather}) : super(key: key);
  final locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
     int ? temperature;

  late String cityName;
    late String getWeatherIcon;

   late String getWeatherMessage;

  late String description;

  WeatherData weather = WeatherData();
  @override
  void initState() {
   
    super.initState();
     upDateUi(widget.locationWeather);
  }
  upDateUi(dynamic weatherData){
    if(weather==null){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("WeatherData is null",style: kErrorStyle,),
          content: Text("Check your connections settings",style: kDescriptionStyle,),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child:const Text("OK",style: TextStyle(color: Colors.blue),),)
          ],
        );
      });
      temperature=0;
      getWeatherIcon=" An Error has occured";
      getWeatherMessage="";
      cityName="";
      description="";

    }
    else{
    setState(() {
       double temp = weatherData["main"]["temp"];
      temperature = temp.toInt();
      getWeatherMessage = weather.getMessage(temperature!);
      var condition = weatherData['weather'][0]["id"];
      getWeatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      description = weatherData["weather"][0]["description"];
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/location_background.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15,20,15,20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: ()async {
                        var weatherData=await weather.getWeatherData();
                      
                        upDateUi(weatherData);
                        print(weatherData);
                      },
                      icon: const Icon(
                        Icons.near_me,
                        color: Colors.pinkAccent,
                        size: 50,
                      ),
                    ),
                    IconButton(
                      onPressed: ()async {
                        var typedName=await Navigator.push(context, MaterialPageRoute(builder: (context)=> const CityScreen(),),);
                        
                        if(typedName!=null){
                        var weatherData= await weather.getCityName(typedName);
                         upDateUi(weatherData);
                        }
                        
                      },
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.pinkAccent,
                        size: 50,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "$temperature\u1d52",
                      style: kTempStyle
                    ),
                    //const Spacer(),
                    Text(description,style: kDescriptionStyle,),
                    const SizedBox(width: 5,),
                    Text(getWeatherIcon,style: kTempStyle,)
                  ],
                ),
               // const Spacer(),
                Text("$getWeatherMessage in $cityName",style: kWeatherMessage)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
