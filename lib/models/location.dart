import 'package:geolocator/geolocator.dart';

class CurrentLocation{
  double? latitude;
  double ?longitude;
   Future getLocation()async{
   try{  
     Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude=position.latitude;
    longitude=position.longitude;
    return position;
  }
  catch(e){
    print(e);
  }
}
}