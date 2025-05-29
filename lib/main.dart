import 'package:bloc_club/data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const font = 'avenir';
  static const Color primaryColor = Color(0xff0D253c);
  static const Color secondaryColor = Color(0xff2D4379);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(fontFamily: font, color: secondaryColor, fontSize: 12),
              titleMedium: TextStyle(fontFamily: font, color: secondaryColor, fontSize: 14),
              headlineMedium:
                  TextStyle(fontFamily: font, fontWeight: FontWeight.bold, color: primaryColor))),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, jonathan!',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset('assets/img/icons/notification', width: 24, height: 24),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore today\'s',
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  itemCount: stories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff376AED),
                                      Color(0xff49B0E2),
                                      Color(0xff9CECFB),
                                    ], begin: Alignment.topLeft)),
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white, borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    child: Image.asset('assets/img/icons/${story.imageFileName}'),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/img/icons/${story.iconFileName}',
                                    width: 24,
                                    height: 24,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            story.name,
                            style: themeData.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
