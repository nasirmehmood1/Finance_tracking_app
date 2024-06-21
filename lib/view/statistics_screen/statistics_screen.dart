import 'package:flutter/material.dart';
import 'package:flutter_finance_app_ui_animation/view/statistics_screen/widgets/detail_list_view.dart';
import 'package:flutter_finance_app_ui_animation/view/statistics_screen/widgets/pie_chart.dart';
import 'package:flutter_finance_app_ui_animation/view_model/animations/fade_animation.dart';

/// A StatefulWidget representing the statistics screen of a finance app.
class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

/// The State class for StatisticsPage.
class _StatisticsPageState extends State<StatisticsPage> {
  /// Represents the currently selected period ('Week', 'Month', 'Year').
  String selectedPeriod = 'Week';
  String amount = '₤3310.43';
  double food = 203.8;
  double house = 1000;
  double trevel = 800;
  double luxury = 200.0;

  @override
  Widget build(BuildContext context) {
    // Getting device screen dimensions
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
            // Fade-in animation for period selector
            FadeAnimation(
              delay: 2.2,
              fadeInDirection: FadeInDirection.ttb,
              fadeOffset: 40,
              child: _buildPeriodSelector(),
            ),
            const SizedBox(height: 50),
            // Fade-in animation for pie chart
            FadeAnimation(
              delay: 2.9,
              fadeInDirection: FadeInDirection.ltr,
              fadeOffset: 40,
              child: PieChartCustom(
                foodExpenses: food,
                houseExpenses: house,
                luxuryExpense: luxury,
                treveleExpenses: trevel,
                pieValue: amount,
              ),
            ),
            const SizedBox(height: 35.0),
            // Detail list view for displaying financial details
            FadeAnimation(
              delay: 5,
              fadeInDirection: FadeInDirection.ltr,
              fadeOffset: 40,
              child: Row(
                children: [
                  SizedBox(width: width * 0.06),
                  const Text(
                    'Monthly Expenses',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const DetailListView(),
          ],
        ),
      ),
    );
  }

  /// Builds the row of period selection buttons ('Week', 'Month', 'Year').
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

  /// Constructs an individual period button.
  ///
  /// When tapped, updates the selected period and changes button appearance accordingly.
  Widget _buildPeriodButton(String period) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeriod = period;
          if (selectedPeriod == 'Week') {
            amount = '₤1020';
            food = 140;
            house = 400;
            trevel = 200;
            luxury = 370;
          } else if (selectedPeriod == 'Month') {
            amount = '₤40200';
            food = 5600;
            house = 7000;
            trevel = 3000;
            luxury = 5600;
          } else {
            amount = '₤509866';
            food = 28040;
            house = 26000;
            trevel = 56000;
            luxury = 38070;
          }
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
