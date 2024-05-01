import 'package:dots/state/time_notifier.dart';
import 'package:dots/widgets/dots_grid.dart';
import 'package:dots/widgets/dots_section_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  static const _yearOfBirth = 2003;

  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timer = context.watch<TimeNotifier>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const DotsSectionTitle(title: 'Years in life'),
            DotsGrid(
              dotsCount: 100,
              dotsInRowCount: 10,
              isFilledCallback: (index) {
                final rangeStart = timer.now.subtract(
                  Duration(
                    days: 365 * (timer.now.year - _yearOfBirth),
                  ),
                );

                return index < (timer.now.year - rangeStart.year);
              },
            ),
            const DotsSectionTitle(title: 'Days in year'),
            DotsGrid(
              dotsCount: daysInYear(timer.now.year),
              dotsInRowCount: 22,
              isFilledCallback: (index) =>
                  index <=
                  timer.now.difference(DateTime(timer.now.year)).inDays,
            ),
            const DotsSectionTitle(title: 'Weeks in year'),
            DotsGrid(
              dotsCount: weeksInYear(timer.now.year),
              dotsInRowCount: 15,
              isFilledCallback: (index) {
                final yearBeginning =
                    timer.now.difference(DateTime(timer.now.year));

                return index < (yearBeginning.inDays / 7).ceil();
              },
            ),
            const DotsSectionTitle(title: 'Days in week'),
            DotsGrid(
              dotsCount: 7,
              dotsInRowCount: 7,
              isFilledCallback: (index) {
                return index < timer.now.weekday;
              },
            ),
            const DotsSectionTitle(title: 'Hours in day'),
            DotsGrid(
              dotsCount: 24,
              dotsInRowCount: 24,
              isFilledCallback: (index) {
                return index < timer.now.hour;
              },
            ),
            const DotsSectionTitle(title: 'Minutes in hour'),
            DotsGrid(
              dotsCount: 60,
              dotsInRowCount: 20,
              isFilledCallback: (index) {
                return index < timer.now.minute;
              },
            ),
            const DotsSectionTitle(title: 'Seconds in minute'),
            DotsGrid(
              dotsCount: 60,
              dotsInRowCount: 20,
              isFilledCallback: (index) {
                return index < timer.now.second;
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  int daysInYear(int year) {
    // Check if the year is a leap year
    final isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

    // Number of days in the year
    final daysInYear = isLeapYear ? 366 : 365;

    return daysInYear;
  }

  int weeksInYear(int year) {
    final days = daysInYear(year);

    // Number of weeks in the year
    return (days / 7).ceil();
  }
}
