import 'package:flutter/material.dart';

import '../helpers/hexcolor.dart';

typedef OnClickIndex= Function(int);

class DepartmentChart extends StatelessWidget {

  OnClickIndex callback;

  DepartmentChart(this.callback,{Key? key}) : super(key: key);

  var boxShadow = [
    const BoxShadow(color: Colors.white, spreadRadius: 2, blurRadius: 1),
    const BoxShadow(color: Colors.white, spreadRadius: 3, blurRadius: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: HexColor('F9F9F9'),
          borderRadius: BorderRadius.circular(12),
          boxShadow: boxShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Department Wise',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, index) => _buildChart(index),
                  separatorBuilder: (_, __) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: 8)),
        ],
      ),
    );
  }

  _buildChart(index) {
    return Material(
      child: InkWell(
        onTap: ()=>callback(index),
        child: Column(
          children: const [
            Expanded(
              child: RotatedBox(
                quarterTurns: -1,
                child: SizedBox(
                  width: 140, //consider a height
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      minHeight: 6, //consider a width
                      value: 0.8,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'House\nKeeping',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
