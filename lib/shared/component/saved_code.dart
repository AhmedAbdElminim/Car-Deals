// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Directionality(
//     textDirection: TextDirection.ltr,
//     child: GridView(
//       shrinkWrap: true,
//       gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 2.2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       children: [
//         KeyBoardButton(
//           buttonTitle: "1",
//           onTap: () {
//             pinController.append('1', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "2",
//           onTap: () {
//             pinController.append('2', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "3",
//           onTap: () {
//             pinController.append('3', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "4",
//           onTap: () {
//             pinController.append('4', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "5",
//           onTap: () {
//             pinController.append('5', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "6",
//           onTap: () {
//             pinController.append('6', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: '7',
//           onTap: () {
//             pinController.append('7', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "8",
//           onTap: () {
//             pinController.append('8', 6);
//           },
//         ),
//         KeyBoardButton(
//           buttonTitle: "9",
//           onTap: () {
//             pinController.append('9', 6);
//           },
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.white,
//           child: GestureDetector(
//             onTap: () {
//               // cubit.trimController(pinController: pinController);
//               pinController.text = pinController.text
//                   .substring(
//                       0, pinController.text.length - 1);
//             },
//             child: const Icon(
//               Icons.remove,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         KeyBoardButton(
//           buttonTitle: "0",
//           onTap: () {
//             pinController.append('0', 6);
//           },
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: Colors.white,
//           child: GestureDetector(
//             onTap: pinController.text.length != 6
//                 ? null
//                 : () {
//                     cubit
//                         .checkPinCode(
//                             pinCode: pinController.text)
//                         .then((value) {
//                       // navigateAndFinish(
//                       //     context: context,
//                       //     screenName:
//                       //         PhoneForm.phoneFormScreenId,
//                       //     args: PhoneFormArgument(
//                       //         phoneNum:
//                       //             args.phoneNumber));
//                     });
//                   },
//             child: Icon(
//               Icons.done,
//               color: defaultColor,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),