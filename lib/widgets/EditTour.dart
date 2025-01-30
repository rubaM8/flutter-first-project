import 'package:flutter/material.dart';
import 'package:projectapp/models/tour_data_manager.dart';
import 'package:projectapp/screens/initScreen.dart';
import 'package:projectapp/widgets/TourDetails.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class EditTour extends StatefulWidget {
  final ToursModel tour;
  final String name;
  const EditTour(this.tour, this.name, {super.key});

  @override
  _EditTourState createState() => _EditTourState();
}

class _EditTourState extends State<EditTour> {
  @override
  void initState() {
    super.initState();
    _dateRangeController.text = widget.tour.dateRange;
    _tourAboutController.text = widget.tour.tourAbout;
    _locationController.text = widget.tour.location;
    _remarksController.text = widget.tour.remarks;
  }

  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();
  final TextEditingController _dateRangeController = TextEditingController();
  final TextEditingController _tourAboutController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  Future<void> _onRangeselected(
      DateTime? start, DateTime? end, DateTime focusedDay) async {
    setState(() {
      _rangeStart = start;
      _rangeEnd = end;
      _focusedDay = start!;
      if (end != null) {
        _dateRangeController.text =
            '${DateFormat('yyyy MMM dd').format(start)} - ${DateFormat('yyyy MMM dd').format(end)}';
      } else {
        _dateRangeController.text = '';
      }
    });
  }

  Future<void> _updateTheData() async {
    final String tourAbout = _tourAboutController.text;
    final String location = _locationController.text;
    final String remarks = _remarksController.text;
    final String dateRange = _dateRangeController.text;
    final ToursModel newtour = ToursModel(
        dateRange: dateRange,
        tourAbout: tourAbout,
        location: location,
        remarks: remarks);

    setState(() {
      tourData.remove(widget.tour);
      tourData.add(newtour);
    });
    if (mounted) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TourDetails(newtour, widget.name)));
    }
  }

  Future<void> _deleteTheData() async {
    setState(() {
      tourData.remove(widget.tour);
      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => initScreen(widget.name)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color.fromARGB(255, 229, 230, 225),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 58),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => initScreen(widget.name)),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E6E1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color:
                                const Color(0xFF3A4646), // Adjusted color value
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color:
                              Colors.black, // Ensure the icon color is visible
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Add tour reminder",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Nunito',
                        color: Color(0xFF3A4646), // Adjusted color value
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(193, 203, 156, 100),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2040, 12, 12),
                    rangeStartDay: _rangeStart,
                    rangeEndDay: _rangeEnd,
                    onRangeSelected: _onRangeselected,
                    rangeSelectionMode: RangeSelectionMode.toggledOn,
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
                        color: Color.fromARGB(255, 255, 255, 255),
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
                ),
                const SizedBox(height: 24),
                SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.datetime,
                            readOnly: true,
                            controller: _dateRangeController,
                            decoration: const InputDecoration(
                              hintText: 'select Date Range from Calender',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            controller: _tourAboutController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'what is the tour about?',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            controller: _locationController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: const InputDecoration(
                              hintText: 'location',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            controller: _remarksController,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              hintText: 'Remarks',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 50, 70, 70)),
                                color: const Color.fromARGB(0, 255, 255, 255)),
                            child: GestureDetector(
                              onTap: _deleteTheData,
                              child: const Center(
                                child: Text(
                                  'Delete tour',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 50, 70, 70),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Container(
                            height: 48,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: const Color.fromARGB(255, 50, 70, 70)),
                            child: GestureDetector(
                              onTap: _updateTheData,
                              child: const Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
