import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

class SendPackageViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final Geolocator _geolocator = Geolocator();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  static const _ic = CameraPosition(
    target: LatLng(37.77, -122.43),
    zoom: 15
  );
  LatLng? currentLatLng;

  GoogleMapController? _pickUpMapController;
  GoogleMapController get  pickUpMapController => _pickUpMapController!;
  set pickUpMapController(GoogleMapController val) {
    _pickUpMapController = val;
    notifyListeners();
  }

  GoogleMapController? _destinationMapController;
  GoogleMapController get  destinationMapController => _destinationMapController!;
  set destinationMapController(GoogleMapController val) {
    _destinationMapController = val;
    notifyListeners();
  }

  void determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    Geolocator.getCurrentPosition().then((currLocation) async{
      print(currLocation.toString());
      currentLatLng = new LatLng(currLocation.latitude, currLocation.longitude);
      final marker = Marker(
        markerId: MarkerId('pickup'),
        position: LatLng(currLocation.latitude, currLocation.longitude),
      );
      markers[MarkerId('pickup')] = marker;
      markers[MarkerId('destination')] = marker;
      pickupController.text = await _getLocationAddress(currLocation.latitude, currLocation.longitude);
      destinationController.text = await _getLocationAddress(currLocation.latitude, currLocation.longitude);
      notifyListeners();
    });
    // return await Geolocator.getCurrentPosition();
  }

  void setPickupAddress(String val) {
    pickupController.text = val;
    pickupController.selection = TextSelection.fromPosition(TextPosition(offset: val.length));
    notifyListeners();
  }

  void setDestinationAddress(String val) {
    destinationController.text = val;
    destinationController.selection = TextSelection.fromPosition(TextPosition(offset: val.length));
    notifyListeners();
  }

  void setMapLocation(double lat, double lng, [bool pickup = true]) {
    final marker = Marker(
        markerId: MarkerId('pickup'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: 'title',
          snippet: 'address',
        ),
      );
      markers[MarkerId('pickup')] = marker;
    (pickup ? pickUpMapController : destinationMapController).moveCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
    notifyListeners();
  }

  Future<String> _getLocationAddress(double latitude, double longitude) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark placeMark = newPlace[0];
    String? name = placeMark.name;
    // String subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    // String subAdministrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    // String subThoroughfare = placeMark.subThoroughfare;
    String? thoroughfare = placeMark.thoroughfare;
    return "$name";
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}