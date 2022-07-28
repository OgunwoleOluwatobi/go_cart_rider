// import 'package:geolocator/geolocator.dart';
// import 'package:go_cart_rider/core/utils/exports.dart';
// import 'package:go_cart_rider/ui/views/dashboard/dashboard_viewmodel.dart';
// import 'package:go_cart_rider/ui/views/dashboard/menu_view.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class DashboardView2 extends StatefulWidget {
//   const DashboardView2({ Key? key }) : super(key: key);

//   @override
//   State<DashboardView2> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView2> {
  

//   @override
//   void initState() {
//     super.initState();
//     _determinePosition();
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<DashboardViewModel>.reactive(
//       viewModelBuilder: () => DashboardViewModel(),
//       builder: (context, model, child) => Scaffold(
//         drawer: MenuView(),
//         body: Stack(
//           children: [
            
//             Positioned(
//               top: 30.h,
//               left: 15.h,
//               child: Builder(
//                 builder: (context) {
//                   return GestureDetector(
//                     onTap: () => Scaffold.of(context).openDrawer(),
//                     child: Card(
//                       elevation: 5,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50.r),
//                       ),
//                       margin: EdgeInsets.zero,
//                       color: Colors.white,
//                       child: Container(
//                         width: 44.h,
//                         height: 44.h,
//                         child: Center(
//                           child: SvgPicture.asset(
//                             'menu'.svg,
//                             height: 24.h,
//                           ),
//                         ),
//                       )
//                     ),
//                   );
//                 }
//               ),
//             )
//           ]
//         )
//       ),
//     );
//   }
// }