import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projectapp/models/tour_data_manager.dart'; // Import your model
import 'package:projectapp/widgets/TourDetails.dart';
import 'package:projectapp/widgets/addATourBody.dart';
import 'package:table_calendar/table_calendar.dart';

class InitScreenBody extends StatefulWidget {
  final String name;

  const InitScreenBody(this.name, {super.key});

  @override
  _InitScreenBodyState createState() => _InitScreenBodyState();
}

class _InitScreenBodyState extends State<InitScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    String greeting() {
      if (today.hour < 12) {
        return 'Good Morning';
      } else if (today.hour < 17) {
        return 'Good Afternoon';
      } else {
        return 'Good Evening';
      }
    }

    int textualizeYear(String parse) {
      if (parse.trim().toLowerCase() == 'jan') {
        return 01;
      } else if (parse.trim().toLowerCase() == 'feb')
        return 02;
      else if (parse.trim().toLowerCase() == 'mar')
        return 03;
      else if (parse.trim().toLowerCase() == 'apr')
        return 04;
      else if (parse.trim().toLowerCase() == 'may')
        return 05;
      else if (parse.trim().toLowerCase() == 'jun')
        return 06;
      else if (parse.trim().toLowerCase() == 'jul')
        return 07;
      else if (parse.trim().toLowerCase() == 'aug')
        return 08;
      else if (parse.trim().toLowerCase() == 'sep')
        return 09;
      else if (parse.trim().toLowerCase() == 'oct')
        return 10;
      else if (parse.trim().toLowerCase() == 'nov')
        return 11;
      else if (parse.trim().toLowerCase() == 'dec')
        return 12;
      else
        return 0;
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 229, 230, 225),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting(),
                      style:
                          const TextStyle(fontSize: 15, fontFamily: 'Nunito'),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddATourBody(widget.name)),
                    );
                  },
                  child: Container(
                    height: 39,
                    width: 122,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(children: [
                          TextSpan(
                            text: '+ ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 23,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          TextSpan(
                            text: ' Add tour',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 15,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(193, 203, 156, 100),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      TableCalendar(
                        focusedDay: today,
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2040, 12, 12),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                          weekendStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                          ),
                        ),
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Color.fromARGB(110, 255, 255, 255),
                            shape: BoxShape.circle,
                          ),
                          selectedTextStyle: TextStyle(
                            color: Color.fromARGB(255, 58, 70, 70),
                          ),
                          todayTextStyle: TextStyle(
                            color: Color.fromARGB(255, 58, 70, 70),
                          ),
                          defaultTextStyle: TextStyle(
                            color: Color.fromARGB(255, 58, 70, 70),
                          ),
                          defaultDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                        headerStyle: const HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: Color.fromARGB(255, 58, 70, 70),
                            fontSize: 18,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65),
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(58, 70, 70, 10),
                          )),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 290,
                                child: tourData.isEmpty
                                    ? Column(children: [
                                        SvgPicture.asset(
                                          'assets/images/bro.svg',
                                          width: 203.6,
                                          height: 153.4,
                                        ),
                                        const SizedBox(height: 12),
                                        const Center(
                                            child: Text('No tours available'))
                                      ])
                                    : ListView.builder(
                                        itemCount: tourData.length,
                                        itemBuilder: (context, index) {
                                          final tour = tourData[index];
                                          return GestureDetector(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TourDetails(
                                                            tour, widget.name)),
                                              );
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff3A4646),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 8.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8,
                                                                    vertical:
                                                                        4),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border:
                                                                  Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    229,
                                                                    230,
                                                                    225),
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child:
                                                                CountdownTimer(
                                                              endTime: DateTime(
                                                                      int.parse(
                                                                          tour.dateRange.split('-')[0].split(' ')[
                                                                              0]),
                                                                      textualizeYear(
                                                                          tour.dateRange.split('-')[0].split(' ')[
                                                                              1]),
                                                                      int.parse(tour
                                                                          .dateRange
                                                                          .split('-')[
                                                                              0]
                                                                          .split(
                                                                              ' ')[2]),
                                                                      00,
                                                                      00,
                                                                      00)
                                                                  .millisecondsSinceEpoch,
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 10,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        229,
                                                                        230,
                                                                        225,
                                                                        1),
                                                                fontFamily:
                                                                    'Nunito',
                                                              ),
                                                              endWidget: const Text(
                                                                  "your tour timer is over!",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            229,
                                                                            230,
                                                                            225,
                                                                            1),
                                                                    fontFamily:
                                                                        'Nunito',
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        subtitle: RichText(
                                                            text: TextSpan(
                                                                children: [
                                                              TextSpan(
                                                                text:
                                                                    '${tour.dateRange}\n',
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          229,
                                                                          230,
                                                                          225,
                                                                          1),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    '${tour.tourAbout}\n',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            229,
                                                                            230,
                                                                            225,
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Nunito'),
                                                              ),
                                                              WidgetSpan(
                                                                child: Row(
                                                                  children: [
                                                                    SvgPicture
                                                                        .asset(
                                                                      'assets/images/location-sign-svgrepo-com.svg',
                                                                      width: 12,
                                                                      height:
                                                                          12,
                                                                    ),
                                                                    Text(
                                                                      '${tour.location}\n',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Color.fromRGBO(
                                                                            229,
                                                                            230,
                                                                            225,
                                                                            1),
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Nunito',
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ])),
                                                        title: const Text(""),
                                                        isThreeLine: true,
                                                      ),
                                                    ])),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
