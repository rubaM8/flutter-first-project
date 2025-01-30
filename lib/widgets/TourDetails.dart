import 'package:flutter/material.dart';
import 'package:projectapp/models/tour_data_manager.dart';
import 'package:projectapp/screens/initScreen.dart';
import 'package:projectapp/widgets/EditTour.dart';

class TourDetails extends StatelessWidget {
  final ToursModel tour;
  final String name;

  const TourDetails(this.tour, this.name, {super.key});

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
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
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
                                    builder: (context) => initScreen(name)));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E6E1),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: const Color(
                                    0xFF3A4646), // Adjusted color value
                                width: 1,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors
                                  .black, // Ensure the icon color is visible
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Tour details",
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
                        height: 580,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(193, 203, 156, 100),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 580,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 58, 70, 70),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                            Center(
                                child: SizedBox(
                              height: 580,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Image.asset(
                                        'assets/images/Image.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      tour.dateRange,
                                      style: const TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 229, 230, 225)),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(tour.tourAbout,
                                        style: const TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 229, 230, 225))),
                                    const SizedBox(height: 12),
                                    Text(tour.location,
                                        style: const TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromARGB(
                                                255, 229, 230, 225))),
                                    const SizedBox(height: 12),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(tour.remarks,
                                          style: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 229, 230, 225))),
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color.fromARGB(255, 58, 70, 70)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditTour(tour, name)),
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                color: Color.fromARGB(255, 229, 230, 225),
                                fontSize: 14,
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
