import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/statistics_screen/widgets/detail_list_view.dart';
import 'package:flutter_finance_app_ui_animation/view/statistics_screen/widgets/pie_chart.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  String selectedPeriod = 'Week';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            FadeAnimation(
                delay: 2.2,
                fadeInDirection: FadeInDirection.ttb,
                fadeOffset: 40,
                child: _buildPeriodSelector()),
            const SizedBox(height: 50),
            const FadeAnimation(
                delay: 2.9,
                fadeInDirection: FadeInDirection.ltr,
                fadeOffset: 40,
                child: PieChartCustom()),
            const SizedBox(height: 35.0),
            const DetailListView()
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPeriodButton('Week'),
        const SizedBox(
          width: 70,
        ),
        _buildPeriodButton('Month'),
        const SizedBox(
          width: 70,
        ),
        _buildPeriodButton('Year'),
      ],
    );
  }

  Widget _buildPeriodButton(String period) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeriod = period;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: selectedPeriod == period ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          period,
          style: TextStyle(
            color: selectedPeriod == period ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
