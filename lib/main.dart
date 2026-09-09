
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: BouncingBall()));
}

class BouncingBall extends StatefulWidget {
  const BouncingBall({super.key});

  @override
  State<BouncingBall> createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> movement;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this
    );

    movement = Tween<double>(
      begin: -150,
      end: 150
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut
      )
    );

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bouncing Ball')),
      body: Center(
        child: AnimatedBuilder(
          animation: movement,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, movement.value),
              child: child
            );
          },
          child: Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle
            )
          ),
        )
      )
    );
  }
}

// box animation left to right, top to bottom
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: TheBox()));
// }

// class TheBox extends StatefulWidget {
//   const TheBox({super.key});

//   @override
//   State<TheBox> createState() => _TheBoxState();
// }

// class _TheBoxState extends State<TheBox> {
//   bool moveRight = false;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("The box"),),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimatedAlign(
//               alignment: moveRight ? Alignment.topLeft : Alignment.bottomRight, 
//               duration: const Duration(milliseconds: 500),
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.blue
//               )
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 moveRight = !moveRight;
//               });
//             },
//             child: const Text("Move")), 
//         ]
//       ),
//     );
//   }
// }

// Exercise 2:
// void main() {
//   runApp(MaterialApp(home: TheBox()));
// }

// class TheBox extends StatefulWidget {
//   const TheBox({super.key});

//   @override
//   State<TheBox> createState() => _TheBoxState();
// }

// class _TheBoxState extends State<TheBox> {
//   bool moveRight = false;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("The box"),),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimatedAlign(
//               alignment: moveRight ? Alignment.topLeft : Alignment.bottomRight, 
//               duration: const Duration(milliseconds: 500),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 500),
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: moveRight ? Colors.orange : Colors.blue,
//                   borderRadius: BorderRadius.circular(moveRight ? 0 : 50)
//                 )
//               )
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 moveRight = !moveRight;
//               });
//             },
//             child: const Text("Move")), 
//         ]
//       ),
//     );
//   }
// }

// Exercise 3:
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: GrowBox()));
// }

// class GrowBox extends StatefulWidget {
//   const GrowBox({super.key});

//   @override
//   State<GrowBox> createState() => _GrowBoxState();
// }

// class _GrowBoxState extends State<GrowBox> {
//   bool large = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Grow Box')),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               large = !large;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 700),
//             curve: Curves.easeInOut,
//             width: large ? 250 : 100,
//             height: large ? 250 : 100,
//             color: Colors.green,
//             child: const Center(
//               child: Text(
//                 'Tap me',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Exercise 4

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: ColorBox()));
// }

// class ColorBox extends StatefulWidget {
//   const ColorBox({super.key});

//   @override
//   State<ColorBox> createState() => _ColorBoxState();
// }

// class _ColorBoxState extends State<ColorBox> {
//   bool changed = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Change Color')),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               changed = !changed;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(seconds: 1),
//             width: 150,
//             height: 150,
//             color: changed ? Colors.purple : Colors.yellow,
//             child: const Center(child: Text('Tap me'))
//           )
//         )
//       )
//     );
//   }
// }

// Exercise 5

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: FadeBox()));
// }

// class FadeBox extends StatefulWidget {
//   const FadeBox({super.key});

//   @override 
//   State<FadeBox> createState() => _FadeBoxState();
// }

// class _FadeBoxState extends State<FadeBox> {
//   bool visible = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Fade Box')),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: AnimatedOpacity(
//                 opacity: visible ? 1 : 0,
//                 duration: const Duration(seconds: 1),
//                 child: Container(
//                   width: 150,
//                   height: 150,
//                   color: Colors.red
//                 )
//               )
//             )
//           ),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 visible = !visible;
//               });
//             },
//             child: Text(visible ? 'Hide' : 'Show'),
//           )
//         ],
//       )
//     );
//   }
// }

// Exercise 6


// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: RotateBox()));
// }

// class RotateBox extends StatefulWidget {
//   const RotateBox({super.key});

//   @override
//   State<RotateBox> createState() => _RotateBoxState();
// }

// class _RotateBoxState extends State<RotateBox> {
//   double turns = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Rotate Box')),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               turns += 0.25;
//             });
//           },
//           child: AnimatedRotation(
//             turns: turns,
//             duration: const Duration(milliseconds: 500),
//             child: Container(
//               width: 130,
//               height: 130,
//               color: Colors.teal,
//               child: const Center(
//                 child: Text(
//                   'Tap me',
//                   style: TextStyle(color: Colors.white)
//                 ),
//               )
//             )
//           )
//         ),
//       )
//     );
//   }
// }
