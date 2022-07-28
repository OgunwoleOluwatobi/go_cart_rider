import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/send_package/send_package_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class DestinationView extends StatelessWidget {
  const DestinationView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<SendPackageViewModel>(
      builder: (context, model) => Stack(
        children: [
          model.currentLatLng == null ? Center(
            child: CircularProgressIndicator(),
          ) : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: model.currentLatLng!,
              zoom: 15
            ),
            onMapCreated: (controller) => model.destinationMapController = controller,
            markers: model.markers.values.toSet(),
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            scrollGesturesEnabled: false,
          ),
          Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
            width: double.infinity,
            height: 60.h,
            color: Colors.white,
            child: GooglePlaceAutoCompleteTextField(
              textEditingController: model.destinationController,
              googleAPIKey: env['MAP_KEY']!,
              countries: ['ng'],
              inputDecoration: InputDecoration(),
              isLatLngRequired:true,
              getPlaceDetailWithLatLng: (Prediction prediction) {
                model.setMapLocation(double.parse(prediction.lat ?? '0'), double.parse(prediction.lng ?? '0'), false);
                print("placeDetails" + prediction.lng.toString());
              },
              itmClick: (Prediction prediction) {
                model.setDestinationAddress(prediction.description ?? '');
              }
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                child: CustomButton(title: 'Next', onTap: (){
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    builder: (c) => ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        height: 350.h,
                        child: Column(
                          children: [
                            SizedBox(height: 15.h,),
                            Text(
                              'Reciepient Information',
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            Expanded(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      filled: true,
                                      hintText: 'Reciepient Name',
                                    ),
                                    SizedBox(height: 15.h,),
                                    CustomTextField(
                                      filled: true,
                                      hintText: 'Reciepient Phone',
                                    ),
                                    SizedBox(height: 35.h,),
                                    CustomButton(title: 'Proceed', onTap: (){})
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}