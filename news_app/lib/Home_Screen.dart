// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/HeadLinesWidget.dart';
import 'package:news_app/Independent_News.dart';
import 'package:news_app/Services/NewsHeadlinesApiCall.dart';
import 'package:news_app/categoryNewsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum sourceList { bbcNews, aryNews, cnnNews, aljazeeraEnglish, independent }

final format = DateFormat('MMMM dd, yyyy');
bool loading = false;
String name = '';

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            // initialValue: sourceList.bbcNews,
            onSelected: (value) {
              if (value == sourceList.bbcNews) {
                name = 'bbc-news';
                setState(() {
                  loading = true;

                  sourceFinder(name);
                  Timer(
                    Duration(seconds: 2),
                    () => setState(() {
                      loading = false;
                    }),
                  );
                });
              } else if (value == sourceList.aryNews) {
                name = 'ary-news';
                setState(() {
                  loading = true;
                  sourceFinder(name);
                });
                Timer(
                  Duration(seconds: 2),
                  () => setState(() {
                    loading = false;
                  }),
                );
              } else if (value == sourceList.cnnNews) {
                name = 'cnn';
                setState(() {
                  loading = true;
                  sourceFinder(name);
                });
                Timer(
                  Duration(seconds: 2),
                  () => setState(() {
                    loading = false;
                  }),
                );
              } else if (value == sourceList.aljazeeraEnglish) {
                name = 'al-jazeera-english';
                setState(() {
                  loading = true;
                });
                Timer(
                  Duration(seconds: 2),
                  () => setState(() {
                    loading = false;
                  }),
                );
                sourceFinder(name);
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<sourceList>>[
              PopupMenuItem(value: sourceList.bbcNews, child: Text('bbcNews')),
              PopupMenuItem(value: sourceList.aryNews, child: Text('aryNews')),
              PopupMenuItem(value: sourceList.cnnNews, child: Text('cnnNews')),
              PopupMenuItem(
                value: sourceList.aljazeeraEnglish,
                child: Text('aljazeeraEnglish'),
              ),
            ],
          ),
        ],
        toolbarHeight: 45,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Categorynewsscreen(isScrollable: true);
                },
              ),
            );
          },
          icon: Image.asset('images/category_icon.png'),
        ),
        // ],
        title: Text(
          'News',
          style: GoogleFonts.poppins(
            fontSize: 25,
            letterSpacing: 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:
          ListView(
            children: [
              HeadLinesWidget(),
              // SizedBox(height: 10),
              IndependentNews(isScrollable: false),
            ],
          ),
    );
  }
}
