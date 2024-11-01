// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_analogue_stopwatch/views/stopwatch_painter.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _isRunning = false; // For play/pause toggle
//   final List<String> _lapTimes = []; // To store lap times
//   final Duration _elapsedTime = Duration.zero;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration:
//           const Duration(minutes: 60), // Full rotation in 1 hour (60 minutes)
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   String _getFormattedTime() {
//     final int totalMilliseconds =
//         (_controller.value * 3600000).toInt(); // 1 hour = 3600000 milliseconds
//     final int hours = totalMilliseconds ~/ 3600000;
//     final int minutes = (totalMilliseconds % 3600000) ~/ 60000;
//     final int seconds = (totalMilliseconds % 60000) ~/ 1000;
//     final int milliseconds = (totalMilliseconds % 1000) ~/ 10;

//     // Return time in the format HH:MM:SS.SS
//     return '${hours.toString().padLeft(2, '0')}:'
//         '${minutes.toString().padLeft(2, '0')}:'
//         '${seconds.toString().padLeft(2, '0')}.'
//         '${milliseconds.toString().padLeft(2, '0')}';
//   }

//   void _startStopwatch() {
//     if (!_isRunning) {
//       _controller.forward(from: _controller.value);
//       _isRunning = true;
//     }
//   }

//   void _pauseStopwatch() {
//     if (_isRunning) {
//       _controller.stop();
//       _isRunning = false;
//     }
//   }

//   void _resetStopwatch() {
//     _controller.reset();
//     _isRunning = false;
//     _lapTimes.clear();
//   }

//   void _lapTime() {
//     final formattedLapTime = _getFormattedTime();
//     setState(() {
//       _lapTimes.add(formattedLapTime);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           colors: [Color(0xff00416a), Color(0xffe4e5e6)],
//           stops: [0, 1],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         )),
//         child: Column(
//           children: [
//             CustomPaint(
//               painter: StopwatchPainter(_controller),
//               child: Container(
//                 margin: const EdgeInsets.only(top: 150),
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 decoration: const BoxDecoration(),
//                 child: Center(
//                   child: Stack(
//                     children: [
//                       Positioned(
//                           child: AnimatedBuilder(
//                         animation: _controller,
//                         builder: (context, child) {
//                           return Text(
//                             _getFormattedTime(),
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           );
//                         },
//                       ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const Expanded(
//                 child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                   Text("Hello"),
//                 ],
//               ),
//             )),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 50, top: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                       backgroundColor: Colors.blueAccent,
//                       radius: MediaQuery.of(context).size.height * 0.04,
//                       child: IconButton(
//                           onPressed:
//                               _isRunning ? _getFormattedTime : _startStopwatch,
//                           icon: const Icon(FontAwesomeIcons.play))),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),

//       // Bottom Navigation Bar
//       bottomNavigationBar: CurvedNavigationBar(
//         //color: const Color(0xFF43ACD3),
//         color: const Color(0xff00416a).withOpacity(0.9),
//         backgroundColor: const Color(0xffe4e5e6),
//         animationDuration: const Duration(milliseconds: 200),
//         items: [
//           Icon(
//             FontAwesomeIcons.stopwatch,
//             color: Colors.white,
//             size: MediaQuery.of(context).size.height * 0.03,
//           ),
//           Icon(
//             Icons.hourglass_empty,
//             color: Colors.white,
//             size: MediaQuery.of(context).size.height * 0.03,
//           ),
//         ],
//         onTap: (index) {},
//       ),
//     );
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analogue_stopwatch/views/stopwatch_painter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isRunning = false;
  bool _showControls = false;
  final List<String> _lapTimes = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(minutes: 60), // Full rotation in 1 hour (60 minutes)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getFormattedTime() {
    final int totalMilliseconds =
        (_controller.value * 3600000).toInt(); // 1 hour = 3600000 milliseconds
    final int hours = totalMilliseconds ~/ 3600000;
    final int minutes = (totalMilliseconds % 3600000) ~/ 60000;
    final int seconds = (totalMilliseconds % 60000) ~/ 1000;
    final int milliseconds = (totalMilliseconds % 1000) ~/ 10;

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}.'
        '${milliseconds.toString().padLeft(2, '0')}';
  }

  void _startStopwatch() {
    setState(() {
      _controller.forward(from: _controller.value);
      _isRunning = true;
      _showControls = true;
    });
  }

  void _pauseStopwatch() {
    setState(() {
      _controller.stop();
      _isRunning = false;
    });
  }

  void _resetStopwatch() {
    setState(() {
      _controller.reset();
      _isRunning = false;
      _showControls = false;
      _lapTimes.clear();
    });
  }

  // void _lapTime() {
  //   final formattedLapTime = _getFormattedTime();
  //   setState(() {
  //     _lapTimes.add(formattedLapTime);
  //   });
  // }

  void _lapTime() {
    final formattedLapTime = _getFormattedTime();
    setState(() {
      _lapTimes.add(formattedLapTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00416a), Color(0xffe4e5e6)],
            stops: [0, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            CustomPaint(
              painter: StopwatchPainter(_controller),
              child: Container(
                margin: EdgeInsets.only(top: height * 0.15),
                width: width * 0.8,
                height: height * 0.4,
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Text(
                        _getFormattedTime(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // const Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //         Text("Hello"),
            //       ],
            //     ),
            //   ),
            // ),

            // Expanded(child: SingleChildScrollView(
            //   child: Column(
            //     children: [

            //     ],
            //   ) ,
            // )),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: _lapTimes
            //           .map((lapTime) => Padding(
            //                 padding: const EdgeInsets.symmetric(vertical: 4.0),
            //                 child: Text(
            //                   lapTime,
            //                   style: const TextStyle(
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ))
            //           .toList(),
            //     ),
            //   ),
            // ),

            // Expanded(
            //   child: SingleChildScrollView(
            //     child: Column(
            //       children: [
            //         // Title row
            //         Padding(
            //           padding: EdgeInsets.symmetric(vertical: height * 0.006),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: const [
            //               Text(
            //                 'Lap',
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 'Lap Time',
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //               Text(
            //                 'Total',
            //                 style: TextStyle(
            //                   fontSize: 16,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         // Lap times
            //         ..._lapTimes.asMap().entries.map((entry) {
            //           int index = entry.key;
            //           String lapTime = entry.value;
            //           String totalTime =
            //               _getFormattedTime(); // Total elapsed time

            //           return Padding(
            //             padding: const EdgeInsets.symmetric(vertical: 4.0),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Text(
            //                   'Lap ${index + 1}',
            //                   style: const TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   lapTime,
            //                   style: const TextStyle(fontSize: 16),
            //                 ),
            //                 Text(
            //                   totalTime,
            //                   style: const TextStyle(fontSize: 16),
            //                 ),
            //               ],
            //             ),
            //           );
            //         }).toList(),
            //       ],
            //     ),
            //   ),
            // ),

            // Non-scrollable Title Row + Scrollable Lap Times
            Expanded(
              child: Column(
                children: [
                  // Fixed Title Row
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.006),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Lap',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Lap Time',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Scrollable Lap Times
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: _lapTimes.asMap().entries.map((entry) {
                          int index = entry.key;
                          String lapTime = entry.value;
                          String totalTime =
                              _getFormattedTime(); // Total elapsed time

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Lap ${index + 1}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  lapTime,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  totalTime,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(bottom: height * 0.05, top: height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_showControls) ...[
                    GestureDetector(
                      onTap: _lapTime,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(
                          Icons.flag,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: _isRunning ? _pauseStopwatch : _startStopwatch,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(_isRunning
                            ? FontAwesomeIcons.pause
                            : FontAwesomeIcons.play),
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: _resetStopwatch,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: MediaQuery.of(context).size.height * 0.04,
                        child: Icon(FontAwesomeIcons.rotateRight),
                      ),
                    ),
                  ] else
                    GestureDetector(
                      onTap: _startStopwatch,
                      child: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: MediaQuery.of(context).size.height * 0.04,
                          child: Icon(FontAwesomeIcons.play)),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: const Color(0xff00416a).withOpacity(0.9),
      //   backgroundColor: const Color(0xffe4e5e6),
      //   animationDuration: const Duration(milliseconds: 200),
      //   items: [
      //     Icon(
      //       FontAwesomeIcons.stopwatch,
      //       color: Colors.white,
      //       size: MediaQuery.of(context).size.height * 0.03,
      //     ),
      //     Icon(
      //       Icons.hourglass_empty,
      //       color: Colors.white,
      //       size: MediaQuery.of(context).size.height * 0.03,
      //     ),
      //   ],
      //   onTap: (index) {},
      // ),
    );
  }
}
