class Details {
  final String locationTitle;
  final String locationAddress;
  final String locationCity;
  final String imagePath;
  final double locationChildPrice;
  final double locationAdultPrice;

  Details({
    required this.locationTitle,
    required this.locationAddress,
    required this.locationCity,
    required this.imagePath,
    required this.locationChildPrice,
    required this.locationAdultPrice,
  });
}

List<Details> detailData = [
  Details(
    locationTitle: 'Tolli Park',
    locationAddress: 'Nikolaus-Otto-Straße 11',
    locationCity: '56727 Mayen',
    imagePath: 'assets/locations/tollipark.png',
    locationChildPrice: 7.00,
    locationAdultPrice: 5.00,
  ),
  Details(
    locationTitle: 'Taunus Wunderland',
    locationAddress: 'Haus Zur Schanze 1',
    locationCity: '65388 Schlangenbad',
    imagePath: 'assets/locations/taunus-wunderland.png',
    locationChildPrice: 27.50,
    locationAdultPrice: 31.50,
  ),
  Details(
    locationTitle: 'Wild- und Freizeitpark Klotten',
    locationAddress: 'Wildparkstraße 1',
    locationCity: '56818 Klotten',
    imagePath: 'assets/locations/klotten.png',
    locationChildPrice: 27.50,
    locationAdultPrice: 29.50,
  ),
  Details(
    locationTitle: 'Phantasialand',
    locationAddress: 'Berggeeiststraße 31- 41',
    locationCity: '50321 Brül',
    imagePath: 'assets/locations/phantasialand.png',
    locationChildPrice: 57.00,
    locationAdultPrice: 57.00,
  ),
  Details(
    locationTitle: 'Flippolino',
    locationAddress: 'Auf dem Molzberg 5- 7',
    locationCity: '57548 Kirchen (Sieg)',
    imagePath: 'assets/locations/flippolino.jpg',
    locationChildPrice: 13.00,
    locationAdultPrice: 7.00,
  ),
  Details(
    locationTitle: 'Movie Park Germany',
    locationAddress: 'Werner- Allee 1',
    locationCity: '46244 Bottrop',
    imagePath: 'assets/locations/Moviepark',
    locationChildPrice: 52.90,
    locationAdultPrice: 57.90,
  ),
  Details(
      locationTitle: 'Tier- Erlebnispark Bell',
      locationAddress: 'Am Markt 1',
      locationCity: '56288 Bell (Hundsrück)',
      imagePath: 'assets/locations/bell.png',
      locationChildPrice: 9.50,
      locationAdultPrice: 13.50),
];
