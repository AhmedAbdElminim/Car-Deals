import 'package:flutter/material.dart';
import 'package:car_deals/features/search/widgets/empty_search_widget.dart';
import 'package:car_deals/shared/component/app_local.dart';
import 'package:car_deals/shared/style/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String searchScreenId = 'SearchScreenId';
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: screenHeight * .3,
              width: screenWidth,
              color: defaultColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: defaultColor,
                            child: const Center(
                                child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                              checkColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            Text(
                              '${getLang(context, 'search_brand')}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                              checkColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              fillColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                            Text(
                              '${getLang(context, 'search_name')}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: TextEditingController(),
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '${getLang(context, 'search')}',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            //width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const EmptySearchWidget(),
          ],
        ));
  }
}
