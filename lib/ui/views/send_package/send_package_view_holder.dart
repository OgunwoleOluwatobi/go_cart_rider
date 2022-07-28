import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_cart_rider/core/utils/exports.dart';
import 'package:go_cart_rider/ui/views/send_package/destination_view.dart';
import 'package:go_cart_rider/ui/views/send_package/pickup_view.dart';
import 'package:go_cart_rider/ui/views/send_package/send_package_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class SendPackageView extends StatelessWidget {
  final PageController pageController = PageController();

  SendPackageView({ Key? key }) : super(key: key);

  void foward() {
    pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeIn);
  }

  void backward() {
    pageController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void jumpTo(int val) {
    pageController.jumpToPage(val);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendPackageViewModel>.reactive(
      onModelReady: (model) => SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        model.determinePosition();
      }),
      viewModelBuilder: () => SendPackageViewModel(),
      builder: (context, model, child) => BackWrapper(
        height: 65.h,
        title: model.currentIndex == 0 ? 'Pickup Location' : 'Destination Location',
        child: PageView(
          controller: pageController,
          onPageChanged: model.setIndex,
          children: [
            PickupView(
              nextPage: () => foward(),
            ),
            DestinationView()
          ],
        )
      ),
    );
  }
}