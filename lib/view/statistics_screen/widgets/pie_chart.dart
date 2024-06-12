import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartCustom extends StatefulWidget {
  const PieChartCustom({super.key});

  @override
  State<PieChartCustom> createState() => _PieChartCustomState();
}

class _PieChartCustomState extends State<PieChartCustom> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: _showingSections(),
              centerSpaceRadius: 90,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (event is FlTapUpEvent && pieTouchResponse != null) {
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    } else {
                      touchedIndex = -1;
                    }
                  });
                },
              ),
            ),
          ),
          const Text(
            '\$3310.43',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    return List.generate(4, (i) {
      final bool isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 29.0 : 16.0;
      final double radius = isTouched ? 80.0 : 50.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: 30,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 20,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.orange,
            value: 10,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
