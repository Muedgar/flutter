import 'package:flutter/material.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
      ),
      home: const Header(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  static const List<TaskData> tasks = [
    TaskData(
      title: 'Team Meeting 🙌',
      description: 'Group discussion for\nthe new product.',
      time: '10:00 AM',
      progress: 0.48,
      startColor: Color(0xFF596CFF),
      endColor: Color(0xFF6C78F6),
    ),
    TaskData(
      title: 'UI Design 🏀',
      description: 'Make a homepage for\nthe Olakart app.',
      time: '11:00 AM',
      progress: 0.65,
      startColor: Color(0xFFED4F76),
      endColor: Color(0xFFF16283),
    ),
    TaskData(
      title: 'Development 💻',
      description: 'Build the first version\nof the application.',
      time: '1:30 PM',
      progress: 0.30,
      startColor: Color(0xFF12B98C),
      endColor: Color(0xFF36CFA5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive, but kept within a sensible range.
    final taskCardWidth = ((screenWidth - 40) * 0.72)
        .clamp(235.0, 285.0)
        .toDouble();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 96,
        leadingWidth: 88,

        // Left menu button
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: HeaderActionButton(
              icon: Icons.menu_rounded,
              tooltip: 'Open menu',
              onPressed: () {
                // Open your drawer or menu here.
              },
            ),
          ),
        ),

        // Right profile button
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: ProfileButton(
                onPressed: () {
                  // Open the profile page here.
                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              const Text(
                'Good Morning, Rifat!',
                style: TextStyle(
                  color: AppColors.mutedText,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              // Main heading
              Text.rich(
                TextSpan(
                  children: const [
                    TextSpan(text: 'You have '),
                    TextSpan(
                      text: '49 tasks',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(text: '\nthis month 👍'),
                  ],
                ),
                style: const TextStyle(
                  color: AppColors.navy,
                  fontSize: 35,
                  height: 1.15,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 38),

              // Search field
              SizedBox(
                height: 66,
                child: TextField(
                  textInputAction: TextInputAction.search,
                  cursorColor: AppColors.primary,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search a task....',
                    hintStyle: const TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(
                        left: 17,
                        right: 11,
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColors.mutedText,
                        size: 31,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 60,
                    ),
                    filled: true,
                    fillColor: AppColors.searchBackground,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                  onChanged: (query) {
                    // Filter tasks here.
                  },
                ),
              ),

              const SizedBox(height: 34),

              // Task status filters
              const Row(
                children: [
                  Expanded(
                    child: StatusCard(
                      label: 'To-Do',
                      icon: Icons.assignment_rounded,
                      accentColor: Color(0xFFEC5578),
                      iconBackground: Color(0xFFFFEEF2),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatusCard(
                      label: 'Progress',
                      icon: Icons.pending_actions_rounded,
                      accentColor: Color(0xFFFFC52E),
                      iconBackground: Color(0xFFFFF8E5),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: StatusCard(
                      label: 'Done',
                      icon: Icons.task_alt_rounded,
                      accentColor: Color(0xFF13BE91),
                      iconBackground: Color(0xFFE7FBF5),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 42),

              // Today's Tasks heading
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Today’s Tasks",
                      style: TextStyle(
                        color: AppColors.navy,
                        fontSize: 30,
                        height: 1,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Show all tasks.
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.mutedText,
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Horizontally scrolling task cards
              SizedBox(
                height: 270,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  physics: const BouncingScrollPhysics(),
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    return TaskCard(
                      task: tasks[index],
                      width: taskCardWidth,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const HeaderActionButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.headerButtonBackground,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Tooltip(
          message: tooltip,
          child: SizedBox(
            width: 54,
            height: 54,
            child: Icon(
              icon,
              color: const Color(0xFF757A98),
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFC72C),
      elevation: 8,
      shadowColor: const Color(0x55FFC72C),
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: const SizedBox(
          width: 54,
          height: 54,
          child: Center(
            // Replace this emoji with Image.asset for an exact avatar.
            child: Text(
              '🧑🏻‍💼',
              style: TextStyle(fontSize: 31),
            ),
          ),
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color accentColor;
  final Color iconBackground;

  const StatusCard({
    super.key,
    required this.label,
    required this.icon,
    required this.accentColor,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.statusCardBackground,
      borderRadius: BorderRadius.circular(38),
      child: InkWell(
        onTap: () {
          // Select this status.
        },
        borderRadius: BorderRadius.circular(38),
        child: Container(
          height: 168,
          padding: const EdgeInsets.symmetric(
            horizontal: 7,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            border: Border.all(
              color: const Color(0xFFF4F4FA),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: accentColor.withOpacity(0.55),
                    width: 1.3,
                  ),
                ),
                child: Icon(
                  icon,
                  color: accentColor,
                  size: 37,
                ),
              ),
              const SizedBox(height: 15),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.navy,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final TaskData task;
  final double width;

  const TaskCard({
    super.key,
    required this.task,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (task.progress * 100).round();

    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            task.startColor,
            task.endColor,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: task.startColor.withOpacity(0.25),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            // Open task details.
          },
          child: Stack(
            children: [
              // Subtle decorative patterns.
              Positioned(
                top: -55,
                right: -50,
                child: DecorativeCircle(
                  size: 150,
                  borderWidth: 13,
                ),
              ),
              Positioned(
                bottom: -75,
                left: 55,
                child: DecorativeCircle(
                  size: 190,
                  borderWidth: 12,
                ),
              ),
              Positioned(
                top: 42,
                left: -35,
                child: DecorativeCircle(
                  size: 85,
                  borderWidth: 8,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  23,
                  23,
                  23,
                  25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 17),

                    Text(
                      task.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.68),
                        fontSize: 17,
                        height: 1.32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      task.time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Progress',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          '$percentage%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 13),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: task.progress,
                        minHeight: 6,
                        backgroundColor:
                            Colors.white.withOpacity(0.28),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DecorativeCircle extends StatelessWidget {
  final double size;
  final double borderWidth;

  const DecorativeCircle({
    super.key,
    required this.size,
    required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.07),
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}

class TaskData {
  final String title;
  final String description;
  final String time;
  final double progress;
  final Color startColor;
  final Color endColor;

  const TaskData({
    required this.title,
    required this.description,
    required this.time,
    required this.progress,
    required this.startColor,
    required this.endColor,
  });
}

class AppColors {
  static const navy = Color(0xFF171D52);
  static const primary = Color(0xFF6373F5);

  static const mutedText = Color(0xFFB5B5BC);

  static const headerButtonBackground = Color(0xFFF8F8FF);
  static const searchBackground = Color(0xFFF7F7F8);
  static const statusCardBackground = Color(0xFFFCFCFF);
}