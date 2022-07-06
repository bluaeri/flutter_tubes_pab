import 'package:flutter/material.dart';
import 'package:sm_private_concert_ticket/data/group_data.dart';
import 'package:sm_private_concert_ticket/ui/detail_screen.dart';
// import 'package:groupticketingapp/widget/app_widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _groupData = groupData();

  Size get _size => MediaQuery.of(context).size;

  double get _groupItemWidth => _size.width / 2 + 48;
  ScrollController _groupScrollController = ScrollController();
  ScrollController _backgroundScrollController = ScrollController();
  double _maxgroupTranslate = 65;
  int _groupIndex = 0;

  @override
  Widget build(BuildContext context) {
    _groupScrollController.addListener(() {
      _backgroundScrollController.jumpTo(
          _groupScrollController.offset * (_size.width / _groupItemWidth));
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _backgroundListView(),
          _groupListView(),
          _detailButton(context)
        ],
      ),
    );
  }

  Widget _backgroundListView() {
    return ListView.builder(
      controller: _backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: _groupData.groupList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return Container(
          width: _size.width,
          height: _size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -_size.width / 3,
                right: -_size.width / 3,
                child: Image(
                  image: _groupData.groupList[index].image.image,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(.6),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.3),
                        Colors.black.withOpacity(.95)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 0.5, 0.9]),
                ),
              ),
              Container(
                height: _size.height * .25,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Align(
                  alignment: Alignment.center,
                  child: Image(
                    width: _size.width / 1.8,
                    image: _groupData.groupList[index].imageText.image,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _groupListView() {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: Container(
        height: _size.height * .75,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ScrollSnapList(
            listController: _groupScrollController,
            onItemFocus: (item) {
              _groupIndex = item;
            },
            itemSize: _groupItemWidth,
            padding: EdgeInsets.zero,
            itemCount: _groupData.groupList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _groupItem(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _groupItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: _groupScrollController,
            builder: (ctx, child) {
              double activeOffset = index * _groupItemWidth;

              double translate =
                  _groupTranslate(_groupScrollController.offset, activeOffset);

              return SizedBox(
                height: translate,
              );
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: _groupData.groupList[index].image.image,
              width: _size.width / 2,
            ),
          ),
          SizedBox(
            height: _size.height * .02,
          ),
          AnimatedBuilder(
            animation: _groupScrollController,
            builder: (context, child) {
              double activeOffset = index * _groupItemWidth;
              double opacity = _groupDescriptionOpacity(
                  _groupScrollController.offset, activeOffset);

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    Text(
                      _groupData.groupList[index].name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: _size.height * .01,
                    ),
                    Text(
                      _groupData.groupList[index].fandom,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _size.width / 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: _size.height * .01,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _detailButton(BuildContext context) {
    return Container(
      height: _size.height * .10,
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Align(
        alignment: Alignment.topCenter,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Color.fromARGB(255, 249, 176, 21),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          // color: AppColor.primary,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (ctx, a1, a2) => DetailScreen(
                  group: _groupData.groupList[_groupIndex],
                  size: _size,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: _size.height * .08,
            child: Center(
              child: Text(
                'Detail',
                style: TextStyle(
                    color: Color.fromARGB(255, 249, 176, 21),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _groupDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (_groupScrollController.offset + _groupItemWidth <= activeOffset) {
      opacity = 0;
    } else if (_groupScrollController.offset <= activeOffset) {
      opacity =
          ((_groupScrollController.offset - (activeOffset - _groupItemWidth)) /
              _groupItemWidth *
              100);
    } else if (_groupScrollController.offset < activeOffset + _groupItemWidth) {
      opacity = 100 -
          (((_groupScrollController.offset - (activeOffset - _groupItemWidth)) /
                  _groupItemWidth *
                  100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  double _groupTranslate(double offset, double activeOffset) {
    double translate;
    if (_groupScrollController.offset + _groupItemWidth <= activeOffset) {
      translate = _maxgroupTranslate;
    } else if (_groupScrollController.offset <= activeOffset) {
      translate = _maxgroupTranslate -
          ((_groupScrollController.offset - (activeOffset - _groupItemWidth)) /
              _groupItemWidth *
              _maxgroupTranslate);
    } else if (_groupScrollController.offset < activeOffset + _groupItemWidth) {
      translate =
          ((_groupScrollController.offset - (activeOffset - _groupItemWidth)) /
                  _groupItemWidth *
                  _maxgroupTranslate) -
              _maxgroupTranslate;
    } else {
      translate = _maxgroupTranslate;
    }
    return translate;
  }
}
