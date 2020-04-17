import 'package:flutter/material.dart';
import 'package:my_shop/model/homedata.dart';
import '../service/service_mothod.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  var showText = '正在加载数据';
  var formData = {'lon': '116.31027221679688', 'lat': '40.10198233557799'};

  EasyRefreshController _refreshController = EasyRefreshController();
  int page = 1;
  List<HotGoodsModel> hotGoodsList = [];

  // @override
  // void initState() {
  //   _getHotGoods();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: Container(
            child: EasyRefresh(
          controller: _refreshController,
          footer: ClassicalFooter(
            bgColor: Colors.white,
            textColor: Colors.pink,
            noMoreText: '别拉了，到底了',
            loadingText: '努力加载中',
            infoText: '上拉加载更多'
          ),
          child: ListView(
            children: <Widget>[
              FutureBuilder(
                future: postRequest('homePageContent', formdata: formData),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var datas = json.decode(snapshot.data.toString());
                    Map homeMap = datas['data'] as Map;
                    var homeData = HomeDataModel.fromJson(homeMap);
                    var column = Column(
                      children: <Widget>[
                        SwiperDiy(swiperDatas: homeData.slides),
                        TopNavigator(navigatorList: homeData.category), //导航组件
                        AdBanner(
                            advertesPicture:
                                homeData.advertesPicture.pictureAddress),
                        LeaderPhone(
                          shopInfo: homeData.shopInfo,
                        ),
                        TopPicsNav(
                          pics: [
                            homeData.saoma,
                            homeData.integralMallPic,
                            homeData.newUser
                          ],
                        ),
                        Recommend(
                          recommendList: homeData.recommend,
                        ),
                        FloorTitle(
                            pictureAddress: homeData.floor1Pic.pictureAddress),
                        FloorContent(floorGoodsList: homeData.floor1),
                        FloorTitle(
                            pictureAddress: homeData.floor2Pic.pictureAddress),
                        FloorContent(floorGoodsList: homeData.floor2),
                        FloorTitle(
                            pictureAddress: homeData.floor3Pic.pictureAddress),
                        FloorContent(floorGoodsList: homeData.floor3),
                        _hotGoods(),
                      ],
                    );
                    return SingleChildScrollView(
                      child: column,
                    );
                  } else {
                    return Center(
                      child: Text('加载中。。。。。'),
                    );
                  }
                },
              ),
            ],
          ),
          onLoad: () async {
            await postRequest('homePageBelowConten', formdata: {'page': page})
                .then((val) {
              var data = json.decode(val.toString());
              List<HotGoodsModel> newGoodsList = (data['data'] as List)
                  ?.map((e) => e == null
                      ? null
                      : HotGoodsModel.fromJson(e as Map<String, dynamic>))
                  ?.toList();
                  bool hasData = false;
                  if (newGoodsList != null) {
                    if (newGoodsList.length > 19){
                      hasData = true;
                    }
                  } 
              _refreshController.finishLoad(noMore: !hasData);

              setState(() {
                if (newGoodsList != null) {
                    if (newGoodsList.length > 0){
                      hotGoodsList.addAll(newGoodsList);
                      page++;
                    }
                  } 
                
              });
            });
          },
        )));
  }

  void _getHotGoods() {
    var formPage = {'page': page};
    postRequest('homePageBelowConten', formdata: formPage).then((val) {
      var data = json.decode(val.toString());
      List<HotGoodsModel> newGoodsList = (data['data'] as List)
          ?.map((e) => e == null
              ? null
              : HotGoodsModel.fromJson(e as Map<String, dynamic>))
          ?.toList();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  //火爆专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  //火爆专区子项
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              print('点击了火爆商品');
            },
            child: Container(
              width: ScreenUtil().setWidth(372),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(bottom: 3.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val.image,
                    width: ScreenUtil().setWidth(375),
                  ),
                  Text(
                    val.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                  ),
                  Row(
                    children: <Widget>[
                      Text('￥${val.mallPrice}'),
                      Text(
                        '￥${val.price}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text(' ');
    }
  }

  //火爆专区组合
  Widget _hotGoods() {
    return Container(
        child: Column(
      children: <Widget>[
        hotTitle,
        _wrapList(),
      ],
    ));
  }
}

class SwiperDiy extends StatelessWidget {
  final List<Slide> swiperDatas;
  SwiperDiy({this.swiperDatas});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (context, int index) {
          Slide slide = swiperDatas[index];
          return Image.network(
            slide.image,
            fit: BoxFit.fill,
          );
        },
        itemCount: swiperDatas.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class TopNavigator extends StatelessWidget {
  final List<CategoryModel> navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, CategoryModel item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item.image, width: ScreenUtil().setWidth(95)),
          Text(item.mallCategoryName),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 4) {
      navigatorList.removeRange(4, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(130),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((CategoryModel item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;

  AdBanner({Key key, this.advertesPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(advertesPicture),
        onTap: () {},
      ),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final ShopInfo shopInfo;

  LeaderPhone({Key key, this.shopInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(shopInfo.leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + shopInfo.leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class TopPicsNav extends StatelessWidget {
  final List<GoodsPic> pics;
  TopPicsNav({Key key, this.pics}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, GoodsPic item) {
    return InkWell(
      onTap: () {
        print('点击了图片');
      },
      child: Image.network(
        item.pictureAddress,
        width: ScreenUtil().setWidth(230),
        height: ScreenUtil().setHeight(290),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(230),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        padding: EdgeInsets.all(4.0),
        children: pics.map((GoodsPic item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//商品推荐
class Recommend extends StatelessWidget {
  final List<RecommendGoods> recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommedList()],
      ),
    );
  }

//推荐商品标题
  Widget _titleWidget() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
        child: Text('商品推荐', style: TextStyle(color: Colors.pink)));
  }

  Widget _recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  Widget _item(index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(280),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index].image),
            Text('￥${recommendList[index].mallPrice}'),
            Text(
              '￥${recommendList[index].price}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String pictureAddress; // 图片地址
  FloorTitle({Key key, this.pictureAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(pictureAddress),
    );
  }
}

//楼层商品组件
class FloorContent extends StatelessWidget {
  final List<FloorGoods> floorGoodsList;

  FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_firstRow(), _otherGoods()],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(FloorGoods goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Image.network(goods.image),
      ),
    );
  }
}
