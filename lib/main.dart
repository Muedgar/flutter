import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TheBox()));
}

class TheBox extends StatefulWidget {
  const TheBox({super.key});

  @override
  State<TheBox> createState() => _TheBoxState();
}

class _TheBoxState extends State<TheBox> {
  bool moveRight = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The box"),),
      body: Column(
        children: [
          Expanded(
            child: AnimatedAlign(
              alignment: moveRight ? Alignment.topLeft : Alignment.bottomRight, 
              duration: const Duration(milliseconds: 500),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: moveRight ? Colors.orange : Colors.blue,
                  borderRadius: BorderRadius.circular(moveRight ? 0 : 50)
                )
              )
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                moveRight = !moveRight;
              });
            },
            child: const Text("Move")), 
        ]
      ),
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