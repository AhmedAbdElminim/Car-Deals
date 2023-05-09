import 'package:car_deals/models/apply_model.dart';
import 'package:car_deals/shared/component/constants.dart';
import 'package:car_deals/shared/component/function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../shared/component/app_local.dart';
import '../../shared/component/loading_widget.dart';
import '../../shared/style/colors.dart';
import '../../utils/app_lists.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({Key? key}) : super(key: key);
  static const String applyScreenId = 'ApplyScreenId';

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  // Initial Selected Value
  String carBrandValue = carBrands[0];
  // List of items in our dropdown menu
  late String carNameValue = carNames[carBrandValue]![0];
  String carModelValue = carModel[0];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${getLang(context, 'post_appbar_title')}')),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              '${getLang(context, 'post_title_description')}',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  '${getLang(context, 'post_car_brand')}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DropdownButton(
                  // Initial Value
                  value: carBrandValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: carBrands.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      carBrandValue = newValue!;
                      carNameValue = carNames[carBrandValue]![0];
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  '${getLang(context, 'post_car_name')}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DropdownButton(
                  // Initial Value
                  value: carNameValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: carNames[carBrandValue]!.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      carNameValue = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  '${getLang(context, 'post_car_model')}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DropdownButton(
                  // Initial Value
                  value: carModelValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: carModel.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      carModelValue = newValue!;
                      // carNameValue = carNames[carBrandValue]![0];
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: LoadingWidget(),
                    )
                  : MaterialButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          if (await execute(customInstance) &&
                              userModel != null) {
                            ApplyModel applyModel = ApplyModel(
                                userName: userModel!.userName,
                                uId: userModel!.uId,
                                userPhone: userModel!.userPhone,
                                carBrand: carBrandValue,
                                carName: carNameValue,
                                carModel: carModelValue);
                            FirebaseFirestore.instance
                                .collection('requests')
                                .doc(uId)
                                .set(applyModel.toJson())
                                .then((value) {
                              setState(() {
                                isLoading = false;
                              });
                              showToAst(
                                  msg:
                                      '${getLang(context, 'apply_successful_message')}',
                                  isError: false);
                              Navigator.pop(context);
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            showInternetConnectionDialog(context: context);
                          }
                        } catch (error) {
                          showMyDialog(context: context, msg: '');
                        }
                      },
                      color: defaultColor,
                      child: Text(
                        '${getLang(context, 'post_car_button')}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
