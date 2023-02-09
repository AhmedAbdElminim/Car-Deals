import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';



// Future<bool> execute(
//   InternetConnectionChecker? internetConnectionChecker,
// ) async {
//   bool isConnected = await InternetConnectionChecker().hasConnection;
//   if (!isConnected) {
//     final StreamSubscription<InternetConnectionStatus> listener =
//         InternetConnectionChecker().onStatusChange.listen(
//       (InternetConnectionStatus status) {
//         switch (status) {
//           case InternetConnectionStatus.connected:
//             isConnected = true;
//             break;
//           case InternetConnectionStatus.disconnected:
//             isConnected = false;
//             break;
//         }
//       },
//     );
//
//     await Future<void>.delayed(const Duration(seconds: 10));
//     await listener.cancel();
//     return isConnected;
//   }
//
//   return isConnected;
// }
