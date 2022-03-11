import 'package:flutter/material.dart';
import 'package:osolna_application/colorData/colors.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:osolna_application/textData/text.dart';
import 'package:osolna_application/viewModel/angry_provider.dart';
import 'package:osolna_application/viewModel/consolation_provider.dart';
import 'package:osolna_application/viewModel/happy_provider.dart';
import 'package:osolna_application/viewModel/love_provider.dart';
import 'package:osolna_application/viewModel/sadness_provider.dart';
import 'package:provider/provider.dart';

// ignore: slash_for_doc_comments
/**
 * [MoodMemoList] This page is that you written moodmemo.
 * It is shown in the form of listView.
 * Shown list : dateTime, moodTitle, subtitle,
 * Functions : Fixing Function, delete Function.
 */

class MoodMemoList extends StatefulWidget {
  final String selectTitle;
  const MoodMemoList({
    Key? key,
    required this.selectTitle,
  }) : super(key: key);

  @override
  State<MoodMemoList> createState() => _MoodMemoListState();
}

class _MoodMemoListState extends State<MoodMemoList> {
  HappyDatabaseProvider? _happyProvider = HappyDatabaseProvider();
  LoveDatabaseProvider? _loveProvider = LoveDatabaseProvider();
  ConsolationDatabaseProvider? _consolationProvider =
      ConsolationDatabaseProvider();
  SadnessDatabaseProvider? _sadnessProvider = SadnessDatabaseProvider();
  AngryDatabaseProvider? _angryProvider = AngryDatabaseProvider();

  /***/

  // ignore: slash_for_doc_comments
  /**
   * [MoodMemos get Method]
   */

  Future<List<Memo>> loadMemo() async {
    if (widget.selectTitle == '행복') {
      return await _happyProvider!.getHappyMemos();
    } else if (widget.selectTitle == '사랑') {
      return await _loveProvider!.getLoveMemos();
    } else if (widget.selectTitle == '위로') {
      return await _consolationProvider!.getConsolationMemos();
    } else if (widget.selectTitle == '슬픔') {
      return await _sadnessProvider!.getSadnessMemos();
    } else if (widget.selectTitle == '화남') {
      return await _angryProvider!.getAngryMemos();
    }
    // ignore: null_check_always_fails
    return null!;
  }

  // ignore: slash_for_doc_comments
  /**
   * [ListView Widget] This Widget is only shown loadMemo() interface
   */

  Widget memoListView() {
    return FutureBuilder<List<Memo>>(
      future: loadMemo(),
      builder: (context, snap) {
        // ignore: unrelated_type_equality_checks
        if (snap.data == null || snap.data!.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: logoColor,
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: (snap.data as List).length,
            itemBuilder: (context, index) {
              var memo = (snap.data as List)[index];
              return Column(
                children: [
                  Text(memo.dateTime!),
                ],
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /**
     * [Providers]
     */
    _happyProvider = Provider.of<HappyDatabaseProvider>(context, listen: false);
    _loveProvider = Provider.of<LoveDatabaseProvider>(context, listen: false);
    _consolationProvider =
        Provider.of<ConsolationDatabaseProvider>(context, listen: false);
    _sadnessProvider =
        Provider.of<SadnessDatabaseProvider>(context, listen: false);
    _angryProvider = Provider.of<AngryDatabaseProvider>(context, listen: false);
    // 그 외에 provider 접근.
    print('memolist');
    // Future<List<Memo>>
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainbackgroundColor,
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Text(
          '오솔나',
          style: TextStyle(
            color: logoColor,
            fontFamily: nanumMyeongjo,
            fontSize: appbarFontSize,
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: Icon(
              Icons.menu,
              size: 25.0,
            ),
          ),
        ],
      ),
      /**
       * [MoodConsumer] This can access multiProvider
       * etc. happy, sad, love..
       */
      body: Consumer5<
          HappyDatabaseProvider,
          LoveDatabaseProvider,
          ConsolationDatabaseProvider,
          SadnessDatabaseProvider,
          AngryDatabaseProvider>(
        builder: (BuildContext context, happyProvider1, loveProvider2,
            consolationProvider3, sadnessProvider4, angryProvider5, child) {
          return Container(
            child: memoListView(),
          );
        },
      ),
    );
  }
}
