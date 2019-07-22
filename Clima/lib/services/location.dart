import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;

  //WE CAN WAIT FOR A MTD IFF IT RETURN A FUTURE
  Future<void> getCurrentLocation() async{
      try{
          Position position= await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
          latitude=position.latitude;
          longitude=position.longitude;
      }
      catch(e){
        print(e);
      }
  }
}