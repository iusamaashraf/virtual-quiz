// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CameraPage extends StatefulWidget {
//   const CameraPage({Key? key}) : super(key: key);

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   late CameraController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = CameraController(_cameras[0], ResolutionPreset.max);
//     controller.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     }).catchError((Object e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case 'CameraAccessDenied':
//             print('User denied camera access.');
//             break;
//           default:
//             print('Handle other errors.');
//             break;
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SizedBox(
//           height: size.height,
//           width: size.width,
//           child: Stack(
//             // alignment: Alignment.center,
//             children: [
//               // Positioned(
//               //   right: 10,
//               //   top: 30,
//               //   child: Column(
//               //     children: [
//               //       Container(
//               //         padding: const EdgeInsets.symmetric(vertical: 16),
//               //         width: 47,
//               //         decoration: BoxDecoration(
//               //           borderRadius: BorderRadius.circular(100),
//               //           color: Colors.black.withOpacity(0.4),
//               //         ),
//               //         child: Column(
//               //           children: const [
//               //             SizedBox(
//               //               height: 10,
//               //             ),
//               //             Icon(
//               //               Icons.flip_camera_android,
//               //               color: Colors.white,
//               //             ),
//               //             SizedBox(
//               //               height: 10,
//               //             ),
//               //             Icon(
//               //               Icons.flash_off,
//               //               color: Colors.white,
//               //             ),
//               //             SizedBox(
//               //               height: 10,
//               //             ),
//               //             Icon(
//               //               CupertinoIcons.moon,
//               //               color: Colors.white,
//               //             ),
//               //             SizedBox(
//               //               height: 10,
//               //             ),
//               //             Icon(
//               //               CupertinoIcons.play_rectangle,
//               //               color: Colors.white,
//               //             ),
//               //           ],
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               Positioned(
//                 right: size.width * 0.1,
//                 left: 0,
//                 bottom: 40,
//                 child: SizedBox(
//                   height: size.height * 0.1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         height: 40,
//                         width: 40,
//                         decoration: const BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.black12),
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: const Icon(
//                             Icons.photo_library_outlined,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Container(
//                         height: 60,
//                         width: 60,
//                         decoration: const BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.transparent),
//                         child: GestureDetector(
//                           onTap: () {},
//                           child: const Icon(
//                             Icons.circle_outlined,
//                             size: 70,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle, color: Colors.black12),
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Icon(
//                               CupertinoIcons.share,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       // IconButton(
//                       //   onPressed: () {},
//                       //   icon: Icon(
//                       //     Icons.circle_outlined,
//                       //     size: size.height * 0.1,
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
