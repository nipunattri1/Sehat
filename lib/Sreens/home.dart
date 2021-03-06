import 'package:flutter/material.dart';
import 'package:healthcare/API/news.dart';
import 'package:healthcare/Sreens/covid.dart';
// import 'package:healthcare/API/cases.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:healthcare/widgets/news_dispaly.dart';
import 'package:http/http.dart' as http;
// import 'package:newsapi/newsapi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var newscontent;
  // final newsresult;
  int newsno = 0;
  Future<void> news() async {
    final newsresult =
        await newsapi("api for newsorg here", http.Client());
    print(newsresult);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("found ${newsresult["totalResults"]} articles"),
    ));
    setState(() {
      newscontent = newsresult["articles"];
      newsno = newsresult["totalResults"];
    });

    // print(newscontent[0]);
    return true;
  }

  @override
  void initState() {
    news();
    super.initState();
  }

  final Duration animationDuration = Duration(milliseconds: 300);
  final Duration delay = Duration(milliseconds: 300);
  GlobalKey rectGetterKey = RectGetter.createGlobalKey();
  Rect rect;

  void _onTap() async {
    setState(() => rect = RectGetter.getRectFromKey(rectGetterKey));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() =>
          rect = rect.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      Future.delayed(animationDuration + delay, _goToNextPage);
    });
  }

  void _goToNextPage() {
    Navigator.of(context)
        .push(FadeRouteBuilder(page: covidinfo()))
        .then((_) => setState(() => rect = null));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SafeArea(
        child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Sehat",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontFamily: "CaveatBrush"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Latest Covid news",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                    height: 20,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.local_hospital_sharp),
                                color: Colors.pink,
                                onPressed: () {},
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("hospitals")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.call),
                                color: Colors.pink,
                                onPressed: () {},
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("Helpline")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: RectGetter(
                                key: rectGetterKey,
                                child: IconButton(
                                  icon: Icon(Icons.masks),
                                  color: Colors.pink,
                                  onPressed: _onTap,
                                ),
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("info")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            child: Container(
                              child: IconButton(
                                icon: Icon(Icons.file_copy),
                                color: Colors.pink,
                                onPressed: () {},
                              ),
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(9999.0, 9999.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 1.0, color: Colors.pink),
                              ),
                            ),
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: Colors.pink,
                              border:
                                  Border.all(width: 1.0, color: Colors.pink),
                            ),
                          ),
                          Text("Document")
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                    height: 20,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  ListView.builder(
                      itemCount: newsno ?? 1,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        print(newscontent[index]);
                        return NewsDispaly(
                          source: newscontent[index]['source']['name'] ?? '',
                          author: newscontent[index]['author'] ?? '',
                          title: newscontent[index]['title'] ?? '',
                          description: newscontent[index]["description"] ?? '',
                          urlToImage: newscontent[index]["urlToImage"] ?? '',
                          publishedAt: newscontent[index]["publishedAt"] ?? '',
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
      _ripple(),
    ]);
  }

  Widget _ripple() {
    if (rect == null) {
      return Container();
    }
    return AnimatedPositioned(
      duration: animationDuration,
      left: rect.left,
      right: MediaQuery.of(context).size.width - rect.right,
      top: rect.top,
      bottom: MediaQuery.of(context).size.height - rect.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pink[50],
        ),
      ),
    );
  }
}

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return FadeTransition(opacity: animation1, child: child);
          },
        );
}
