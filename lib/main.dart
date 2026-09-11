
import 'package:flutter/material.dart';



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


// Exercise 7
// void main() {
//   runApp(const MaterialApp(home: BouncingBall()));
// }

// class BouncingBall extends StatefulWidget {
//   const BouncingBall({super.key});

//   @override
//   State<BouncingBall> createState() => _BouncingBallState();
// }

// class _BouncingBallState extends State<BouncingBall> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> movement;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       duration: const Duration(milliseconds: 700),
//       vsync: this
//     );

//     movement = Tween<double>(
//       begin: -150,
//       end: 150
//     ).animate(
//       CurvedAnimation(
//         parent: controller,
//         curve: Curves.easeInOut
//       )
//     );

//     controller.repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Bouncing Ball')),
//       body: Center(
//         child: AnimatedBuilder(
//           animation: movement,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(0, movement.value),
//               child: child
//             );
//           },
//           child: Container(
//             width: 70,
//             height: 70,
//             decoration: const BoxDecoration(
//               color: Colors.orange,
//               shape: BoxShape.circle
//             )
//           ),
//         )
//       )
//     );
//   }
// }

// Exercise 8
// void main() {
//   runApp(MaterialApp(home: PulsingCircle()));
// }

// class PulsingCircle extends StatefulWidget {
//   const PulsingCircle({super.key});

//   @override
//   State<PulsingCircle> createState() => _PulsingCircleState();
// }

// class _PulsingCircleState extends State<PulsingCircle> with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> scale;

//   @override
//   void initState() {
//     super.initState();

//     controller = AnimationController(
//       duration: const Duration(microseconds: 800),
//       vsync: this
//     );

//     scale = Tween<double>(
//       begin: 0.7,
//       end: 1.3
//     ).animate(
//       CurvedAnimation(parent: controller, curve: Curves.easeInOut)
//     );

//     controller.repeat(reverse: true);
//   }

//   @override  
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Pulsing Circle')),
//       body: Center(
//         child: ScaleTransition(
//           scale: scale,
//           child: Container(
//             width: 120,
//             height: 120,
//             decoration: const BoxDecoration(
//               color: Colors.pink,
//               shape: BoxShape.circle
//             )
//           )
//         )
//       )
//     );
//   }
// }

// Exercise 9

// void main() {
//   runApp(const MaterialApp(home: SwitchBoxes()));
// }

// class SwitchBoxes extends StatefulWidget {
//   const SwitchBoxes({super.key});

//   @override
//   State<SwitchBoxes> createState() => _SwitchBoxesState();
// }

// class _SwitchBoxesState extends State<SwitchBoxes> {
//   bool showFirst = true;

//   @override  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Switch Boxes')),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               showFirst = !showFirst;
//             });
//           },
//           child: AnimatedSwitcher(
//             duration: const Duration(microseconds: 700),
//             transitionBuilder: (child, animation) {
//               return SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(-1, 0),
//                   end: Offset.zero
//                 ).animate(animation),
//                 child: child
//               );
//             },
//             child: Container(
//               key: ValueKey(showFirst),
//               width: 180,
//               height: 180,
//               color: showFirst ? Colors.blue : Colors.orange,
//               child: Center(
//                 child: Text(
//                   showFirst ? 'First Box' : 'Second Box',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20
//                   )
//                 )
//               )
//             )
//           )
//         )
//       )
//     );
//   }
// }

// Exercise 10
// void main() {
//   runApp(const MaterialApp(home: DraggableBox()));
// }

// class DraggableBox extends StatefulWidget {
//   const DraggableBox({super.key});

//   @override
//   State<DraggableBox> createState() => _DraggableBoxState();
// }

// class _DraggableBoxState extends State<DraggableBox> {
//   Offset position = Offset.zero;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Draggable Box')),
//       body: Center(
//         child: GestureDetector(
//           onPanUpdate: (details) {
//             setState(() {
//               position += details.delta;
//             });
//           },
//           onPanEnd: (details) {
//             setState(() {
//               position = Offset.zero;
//             });
//           },
//           child: AnimatedContainer(
//             duration: position == Offset.zero ? const Duration(milliseconds: 500) : Duration.zero,
//             curve: Curves.elasticOut,
//             transform: Matrix4.translationValues(position.dx, position.dy, 0),
//             width: 100,
//             height: 100,
//             color: Colors.deepPurple,
//             child: const Center(
//               child: Text('Drag me',
//               style: TextStyle(color: Colors.white))
//             )
//           )
//         )
//       )
//     );
//   }
// }