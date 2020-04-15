import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';
part 'homedata.g.dart';

@JsonSerializable()
class HomeDataModel {
  HomeDataModel(this.slides,this.shopInfo, this.integralMallPic ,this.toShareCode, this.recommend,this.advertesPicture,this.floor1,
  this.floor2,this.floor3,this.saoma, this.newUser, this.floor1Pic, this.floor2Pic, this.floor3Pic,this.floorName,this.category,
  this.reservationGoods
  );
  final List<Slide> slides;
  final ShopInfo shopInfo;
  // @JsonKey(nullable: false)
  final GoodsPic integralMallPic;
  // @JsonKey(nullable: false)
  final GoodsPic toShareCode;
  // @JsonKey(nullable: false)
  final List<RecommendGoods> recommend;
  // @JsonKey()
  final GoodsPic advertesPicture;
  // @JsonKey(nullable: false)
  final List<FloorGoods> floor1;
  final List<FloorGoods> floor2;
  final List<FloorGoods> floor3; 
  final GoodsPic saoma;
  final GoodsPic newUser;
  final GoodsPic floor1Pic;
  final GoodsPic floor2Pic;
  final FloorName floorName;
  final List<CategoryModel> category;
  final GoodsPic floor3Pic;
  final List reservationGoods;


  factory HomeDataModel.fromJson(Map<String,dynamic> json) => _$HomeDataModelFromJson(json);
  Map<String,dynamic> toJson() => _$HomeDataModelToJson(this);
}
@JsonSerializable()
class Slide {
  Slide(this.image,this.urlType,this.goodsId);
  final String image;
  final int urlType;
  final String goodsId;

  factory Slide.fromJson(Map<String,dynamic> json) => _$SlideFromJson(json);
  Map<String,dynamic> toJson() => _$SlideToJson(this);
}

@JsonSerializable()
class ShopInfo {
  @JsonKey(name: 'SHOP_CODE')
  final String shopCode;

  final String leaderPhone;
  final String leaderImage;
  @JsonKey(name: 'SHOP_NAME')
  final String shopName;
  ShopInfo(this.shopCode,this.leaderPhone,this.leaderImage,this.shopName);

  factory ShopInfo.fromJson(Map<String,dynamic> json) => _$ShopInfoFromJson(json);
  Map<String,dynamic> toJson() => _$ShopInfoToJson(this);
}

@JsonSerializable()
class GoodsPic {
  GoodsPic(this.pictureAddress,this.toPlace,this.urlType);
  @JsonKey(name: 'PICTURE_ADDRESS')
  final String pictureAddress;
  @JsonKey(name: 'TO_PLACE')
  final String toPlace;

  final int urlType;

  factory GoodsPic.fromJson(Map<String,dynamic> json) => _$GoodsPicFromJson(json);
  Map<String,dynamic> toJson() => _$GoodsPicToJson(this);
}

@JsonSerializable()
class RecommendGoods {
  RecommendGoods(this.image, this.mallPrice, this.goodsName, this.goodsId, this.price);
  final String image;
  final double mallPrice;

  final String goodsName;
  final String goodsId;
  final double price;

  factory RecommendGoods.fromJson(Map<String,dynamic> json) => _$RecommendGoodsFromJson(json);
  Map<String,dynamic> toJson() => _$RecommendGoodsToJson(this);
}

@JsonSerializable()
class FloorGoods {
  FloorGoods(this.image, this.goodsId);
  final String image;

  final String goodsId;

  factory FloorGoods.fromJson(Map<String,dynamic> json) => _$FloorGoodsFromJson(json);
  Map<String,dynamic> toJson() => _$FloorGoodsToJson(this);
}

@JsonSerializable()
class FloorName {
  FloorName(this.floor1, this.floor2, this.floor3);
  final String floor1;
  final String floor2;

  final String floor3;

  factory FloorName.fromJson(Map<String,dynamic> json) => _$FloorNameFromJson(json);
  Map<String,dynamic> toJson() => _$FloorNameToJson(this);
}


@JsonSerializable()
class CategoryModel {
  CategoryModel(this.mallCategoryId, this.mallCategoryName, this.bxMallSubDto, this.image);
  final String mallCategoryId;
  final String mallCategoryName;
  final String image;

  final List<SubCategoryModel> bxMallSubDto;

  factory CategoryModel.fromJson(Map<String,dynamic> json) => _$CategoryModelFromJson(json);
  Map<String,dynamic> toJson() => _$CategoryModelToJson(this);
}


@JsonSerializable()
class SubCategoryModel {
  SubCategoryModel(this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments);
  final String mallSubId;
  final String mallCategoryId;

  final String mallSubName;
  final String comments;

  factory SubCategoryModel.fromJson(Map<String,dynamic> json) => _$SubCategoryModelFromJson(json);
  Map<String,dynamic> toJson() => _$SubCategoryModelToJson(this);
}

@JsonSerializable()
class HotGoodsModel {
  HotGoodsModel(this.image, this.mallPrice, this.name, this.goodsId, this.price);
  final String image;
  final double mallPrice;

  final String name;
  final String goodsId;
  final double price;

  factory HotGoodsModel.fromJson(Map<String,dynamic> json) => _$HotGoodsModelFromJson(json);
  Map<String,dynamic> toJson() => _$HotGoodsModelToJson(this);
}