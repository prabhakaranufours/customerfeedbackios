import 'package:flutter/material.dart';
import 'package:i2iutils/helpers/hexcolor.dart';

class DonutChart extends StatelessWidget {
  DonutChart({Key? key}) : super(key: key);

  var boxShadow = [
    const BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 1),
    const BoxShadow(color: Colors.white, spreadRadius: 3, blurRadius: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 220,
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: HexColor('F9F9F9'),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: boxShadow),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: boxShadow,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.red,
                      strokeWidth: 30,
                      value: 0.4,
                    ),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200, shape: BoxShape.circle,boxShadow: boxShadow),
                    child: const Center(
                      child: Text(
                        'Over All',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                      color: HexColor('171D36'),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: boxShadow),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/menu.png',
                        width: 15,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '75%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              'Completes',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                      color: HexColor('FBFBFC'),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: boxShadow),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        'assets/menu.png',
                        width: 15,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              'Not Completes',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
