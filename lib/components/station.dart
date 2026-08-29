
class Station {
  final String name;
  final double latitude;
  final double longitude;
  final String bucket;
  final String token;
  final String url;
  final String org;
  Station(this.name ,this.latitude, this.longitude, this.bucket, this.token,this.url, this.org);

   bool isFavorite = false ;


  bool isEqual (Station a ){

    if (a.name == name) {

      return true;


    }
     return false;


  }

  void delete( station ,List<Station> listStation ){

    listStation.remove(station);
  }

}

