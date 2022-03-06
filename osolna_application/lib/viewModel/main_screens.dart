import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/slideData/sliding_data.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/main_memo_screen.dart';
import 'package:osolna_application/viewModel/mood_memo_list_screen.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodSelectScreen] This class is MoodSelectScreen
 * By using carouselSlider, choice today mood card
 */
// ignore: must_be_immutable
class MoodSelectScreen extends StatefulWidget {
  const MoodSelectScreen({Key? key}) : super(key: key);

  @override
  State<MoodSelectScreen> createState() => _MoodSelectScreenState();
}

class _MoodSelectScreenState extends State<MoodSelectScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('MoodSelectScreen');
    return CarouselSlider.builder(
      itemCount: MoodSelect.card.length,
      itemBuilder: (BuildContext context, int index, int _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '오늘의 나의 감정은',
              style: TextStyle(
                color: maintextColor,
                fontFamily: nanumMyeongjo,
              ),
            ),
            SizedBox(
              height: size.height / 25,
            ),
            Text(
              MoodSelect.card[index].moodTitle!,
              style: TextStyle(
                color: maintextColor,
                fontSize: subTextSize,
                fontFamily: nanumMyeongjo,
              ),
            ),
            SizedBox(
              height: size.height / 25,
            ),
            /**
             * deliver moodTitle data to [MainMemoScreen]
             */
            GestureDetector(
              onTap: () async {
                if (MoodSelect.card[index].moodTitle == '행복') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '사랑') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '위로') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '슬픔') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                } else if (MoodSelect.card[index].moodTitle == '화남') {
                  final selectMoodText = MoodSelect.card[index].moodTitle;
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return MainMemoScreen(moodText: selectMoodText);
                  }));
                }
              },
              child: Image.asset(
                MoodSelect.card[index].image!,
                height: size.height / 2,
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        initialPage: 0,
        aspectRatio: 16 / 9,
        height: size.height / 1,
      ),
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [MoodStorageScreen] This class is MoodMemo Storage
 * if you finished your written memo Through save button enable to show  
 */
class MoodStorageScreen extends StatefulWidget {
  const MoodStorageScreen({Key? key}) : super(key: key);

  @override
  State<MoodStorageScreen> createState() => _MoodStorageScreenState();
}

class _MoodStorageScreenState extends State<MoodStorageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('MoodStorageScreen');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /**
         * By using onTap of GestureDetector shown you written MoodMemo list
         * 텍스트 클릭했을때 무드 타이틀에 리스트 목록을 표시 리스트 목록을 표시하는 페이지가 필요함 
         */
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MoodMemoList()));
          },
          child: Text(
            '행복',
            style: TextStyle(
              color: Colors.white,
              fontFamily: nanumMyeongjo,
              fontSize: hintTextSize,
            ),
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Text(
          '사랑',
          style: TextStyle(
            color: Colors.white,
            fontFamily: nanumMyeongjo,
            fontSize: hintTextSize,
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Text(
          '위로',
          style: TextStyle(
            color: Colors.white,
            fontFamily: nanumMyeongjo,
            fontSize: hintTextSize,
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Text(
          '슬픔',
          style: TextStyle(
            color: Colors.white,
            fontFamily: nanumMyeongjo,
            fontSize: hintTextSize,
          ),
        ),
        SizedBox(
          height: size.height / 10,
        ),
        Text(
          '화남',
          style: TextStyle(
            color: Colors.white,
            fontFamily: nanumMyeongjo,
            fontSize: hintTextSize,
          ),
        ),
      ],
    );
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoScreen]
 */
class SimpleMemoScreen extends StatefulWidget {
  const SimpleMemoScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoScreen> createState() => _SimpleMemoScreenState();
}

class _SimpleMemoScreenState extends State<SimpleMemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ignore: slash_for_doc_comments
/**
 * [SimpleMemoStorageScreen]
 */
class SimpleMemoStorageScreen extends StatefulWidget {
  const SimpleMemoStorageScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMemoStorageScreen> createState() =>
      _SimpleMemoStorageScreenState();
}

class _SimpleMemoStorageScreenState extends State<SimpleMemoStorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
