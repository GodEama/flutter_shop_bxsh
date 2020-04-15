// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homedata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) {
  return HomeDataModel(
    (json['slides'] as List)
        ?.map(
            (e) => e == null ? null : Slide.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['shopInfo'] == null
        ? null
        : ShopInfo.fromJson(json['shopInfo'] as Map<String, dynamic>),
    json['integralMallPic'] == null
        ? null
        : GoodsPic.fromJson(json['integralMallPic'] as Map<String, dynamic>),
    json['toShareCode'] == null
        ? null
        : GoodsPic.fromJson(json['toShareCode'] as Map<String, dynamic>),
    (json['recommend'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendGoods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['advertesPicture'] == null
        ? null
        : GoodsPic.fromJson(json['advertesPicture'] as Map<String, dynamic>),
    (json['floor1'] as List)
        ?.map((e) =>
            e == null ? null : FloorGoods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor2'] as List)
        ?.map((e) =>
            e == null ? null : FloorGoods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor3'] as List)
        ?.map((e) =>
            e == null ? null : FloorGoods.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['saoma'] == null
        ? null
        : GoodsPic.fromJson(json['saoma'] as Map<String, dynamic>),
    json['newUser'] == null
        ? null
        : GoodsPic.fromJson(json['newUser'] as Map<String, dynamic>),
    json['floor1Pic'] == null
        ? null
        : GoodsPic.fromJson(json['floor1Pic'] as Map<String, dynamic>),
    json['floor2Pic'] == null
        ? null
        : GoodsPic.fromJson(json['floor2Pic'] as Map<String, dynamic>),
    json['floor3Pic'] == null
        ? null
        : GoodsPic.fromJson(json['floor3Pic'] as Map<String, dynamic>),
    json['floorName'] == null
        ? null
        : FloorName.fromJson(json['floorName'] as Map<String, dynamic>),
    (json['category'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['reservationGoods'] as List,
  );
}

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'slides': instance.slides,
      'shopInfo': instance.shopInfo,
      'integralMallPic': instance.integralMallPic,
      'toShareCode': instance.toShareCode,
      'recommend': instance.recommend,
      'advertesPicture': instance.advertesPicture,
      'floor1': instance.floor1,
      'floor2': instance.floor2,
      'floor3': instance.floor3,
      'saoma': instance.saoma,
      'newUser': instance.newUser,
      'floor1Pic': instance.floor1Pic,
      'floor2Pic': instance.floor2Pic,
      'floorName': instance.floorName,
      'category': instance.category,
      'floor3Pic': instance.floor3Pic,
      'reservationGoods': instance.reservationGoods,
    };

Slide _$SlideFromJson(Map<String, dynamic> json) {
  return Slide(
    json['image'] as String,
    json['urlType'] as int,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$SlideToJson(Slide instance) => <String, dynamic>{
      'image': instance.image,
      'urlType': instance.urlType,
      'goodsId': instance.goodsId,
    };

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) {
  return ShopInfo(
    json['SHOP_CODE'] as String,
    json['leaderPhone'] as String,
    json['leaderImage'] as String,
    json['SHOP_NAME'] as String,
  );
}

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) => <String, dynamic>{
      'SHOP_CODE': instance.shopCode,
      'leaderPhone': instance.leaderPhone,
      'leaderImage': instance.leaderImage,
      'SHOP_NAME': instance.shopName,
    };

GoodsPic _$GoodsPicFromJson(Map<String, dynamic> json) {
  return GoodsPic(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
    json['urlType'] as int,
  );
}

Map<String, dynamic> _$GoodsPicToJson(GoodsPic instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pictureAddress,
      'TO_PLACE': instance.toPlace,
      'urlType': instance.urlType,
    };

RecommendGoods _$RecommendGoodsFromJson(Map<String, dynamic> json) {
  return RecommendGoods(
    json['image'] as String,
    (json['mallPrice'] as num)?.toDouble(),
    json['goodsName'] as String,
    json['goodsId'] as String,
    (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RecommendGoodsToJson(RecommendGoods instance) =>
    <String, dynamic>{
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'goodsName': instance.goodsName,
      'goodsId': instance.goodsId,
      'price': instance.price,
    };

FloorGoods _$FloorGoodsFromJson(Map<String, dynamic> json) {
  return FloorGoods(
    json['image'] as String,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$FloorGoodsToJson(FloorGoods instance) =>
    <String, dynamic>{
      'image': instance.image,
      'goodsId': instance.goodsId,
    };

FloorName _$FloorNameFromJson(Map<String, dynamic> json) {
  return FloorName(
    json['floor1'] as String,
    json['floor2'] as String,
    json['floor3'] as String,
  );
}

Map<String, dynamic> _$FloorNameToJson(FloorName instance) => <String, dynamic>{
      'floor1': instance.floor1,
      'floor2': instance.floor2,
      'floor3': instance.floor3,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return CategoryModel(
    json['mallCategoryId'] as String,
    json['mallCategoryName'] as String,
    (json['bxMallSubDto'] as List)
        ?.map((e) => e == null
            ? null
            : SubCategoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['image'] as String,
  );
}

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'mallCategoryId': instance.mallCategoryId,
      'mallCategoryName': instance.mallCategoryName,
      'image': instance.image,
      'bxMallSubDto': instance.bxMallSubDto,
    };

SubCategoryModel _$SubCategoryModelFromJson(Map<String, dynamic> json) {
  return SubCategoryModel(
    json['mallSubId'] as String,
    json['mallCategoryId'] as String,
    json['mallSubName'] as String,
    json['comments'] as String,
  );
}

Map<String, dynamic> _$SubCategoryModelToJson(SubCategoryModel instance) =>
    <String, dynamic>{
      'mallSubId': instance.mallSubId,
      'mallCategoryId': instance.mallCategoryId,
      'mallSubName': instance.mallSubName,
      'comments': instance.comments,
    };


    HotGoodsModel _$HotGoodsModelFromJson(Map<String, dynamic> json) {
  return HotGoodsModel(
    json['image'] as String,
    (json['mallPrice'] as num)?.toDouble(),
    json['name'] as String,
    json['goodsId'] as String,
    (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HotGoodsModelToJson(HotGoodsModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'name': instance.name,
      'goodsId': instance.goodsId,
      'price': instance.price,
    };
