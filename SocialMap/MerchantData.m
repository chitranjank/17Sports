//
//  MerchantData.m
//  17sports
//
//  Created by mebusw on 13-8-19.
//  Copyright (c) 2013年 mebusw. All rights reserved.
//

#import "MerchantData.h"

@implementation MerchantData

+(NSArray*) allMerchants {
    NSMutableArray *all = [NSMutableArray array];
    [all addObjectsFromArray:[MerchantData allMerchantsOfGolf]];
    [all addObjectsFromArray:[MerchantData allMerchantsOfHorse]];
    [all addObjectsFromArray:[MerchantData allMerchantsOfSwimming]];
    return all;
}


+(NSArray*) allMerchantsOfGolf {
    return [NSMutableArray arrayWithArray:@[
            @{
            @"id": @67,
            @"name": @"天津峪景山地高尔夫俱乐部",
            @"latitude": @40.094230,
            @"longitude": @117.523355,
            @"address": @"天津市蓟县毛家峪长寿度假村",
            @"phone": @"022-88826203",
            @"price": @"760",
            @"images": @[@"67.jpg"],
            @"description": @"球场内地形险峻，落差超过164码，18个球洞全部建在著名风景区盘山东麓的山体上。"
            },
            @{
            @"id": @68,
            @"name": @"天津杨柳青高尔夫俱乐部",
            @"latitude": @39.1488,
            @"longitude": @117.008188,
            @"address": @"天津市西青区杨柳青镇一经路立交桥北",
            @"phone": @"022-27937878",
            @"price": @"400",
            @"images": @[@"68.jpg"],
            @"description": @"于1999年十月正式对外营业的杨柳青高尔夫俱乐部是一个大型的国际锦标级具有三十六个球洞的高尔夫度假村。"
            },
            @{
            @"id": @69,
            @"name": @"天津天鹅湖高尔夫俱乐部",
            @"latitude": @39.404747,
            @"longitude": @117.057755,
            @"address": @"天津市武清开发区福源道20号",
            @"phone": @"022-82115588",
            @"price": @"600",
            @"images": @[@"69.jpg"],
            @"description": @"标准为9洞36杆，球场三面环水，梯台及果岭置于岛上，极具挑战且难度较大。"
            },
            @{
            @"id": @70,
            @"name": @"天津京基高尔夫俱乐部",
            @"latitude": @38.974625,
            @"longitude": @117.292736,
            @"address": @"天津市津南区八里台镇津港公路北侧",
            @"phone": @"022-58378111",
            @"price": @"400",
            @"images": @[@"70.jpg"],
            @"description": @"球场占地面积1100亩，为国际标准18洞锦标赛场地，标准杆72杆，球道总长度6961码。"
            },
            @{
            @"id": @71,
            @"name": @"天津国际温泉高尔夫俱乐部",
            @"latitude": @39.138036,
            @"longitude": @117.388375,
            @"address": @"天津市空港经济区中心大道西五道",
            @"phone": @"022-24891930/0391",
            @"price": @"510",
            @"images": @[@"71.jpg"],
            @"description": @"球场占地面积67.5万平方米，建筑面积7400余平方米，属国际标准18孔道高球夫球场。"
            },
            @{
            @"id": @72,
            @"name": @"天津华纳高尔夫俱乐部",
            @"latitude": @39.025052,
            @"longitude": @117.688502,
            @"address": @"天津经济技术开发区南海路一号",
            @"phone": @"022-25326009",
            @"price": @"640",
            @"images": @[@"72.jpg"],
            @"description": @"华纳球场是一个球道全长6736码、标准72杆的18洞国际比赛标准球场。"
            },
            @{
            @"id": @73,
            @"name": @"天津龙海国际高尔夫俱乐部",
            @"latitude": @39.154336,
            @"longitude": @117.769891,
            @"address": @"天津市滨海新区218省道",
            @"phone": @"022-67201818",
            @"price": @"350",
            @"images": @[@"73.jpg"],
            @"description": @"该球场充分利用渤海海滨的天然景色和邻近水库区大片的沼泽地貌，创造出在中国境内独特的欧式海滨球场的风貌。"
            },
            @{
            @"id": @74,
            @"name": @"天津阿罗马高尔夫俱乐部",
            @"latitude": @38.937508,
            @"longitude": @117.548347,
            @"address": @"天津市滨海新区大港官森林公园绿化基地",
            @"phone": @"022-63285000",
            @"price": @"960",
            @"images": @[@"74.jpg"],
            @"description": @"俱乐部总占地面积2640000平方米。整个球场由韩国著名CNA高尔夫设计院按照国际标准精心设计并施工."
            },
            @{
            @"id": @75,
            @"name": @"天津京津新城帝景高尔夫俱乐部",
            @"latitude": @39.526669,
            @"longitude": @117.363552,
            @"address": @"天津市宝坻区京津新城内津蓟高速专设第三出口",
            @"phone": @"022-22412818",
            @"price": @"1080",
            @"images": @[@"75.jpg"],
            @"description": @"帝景高尔夫俱乐部拥有国际标准27洞高尔夫球场，前9洞水岸球场由美国著名设计大师J.Michael Poellot担当设计，球场，整体湖水环绕、小桥流水，设计风格迥异。"
            },
            @{
            @"id": @76,
            @"name": @"天津松江团泊湖高尔夫俱乐部",
            @"latitude": @38.914247,
            @"longitude": @117.159555,
            @"address": @"天津市静海县团泊镇津王路",
            @"phone": @"022-68505299",
            @"price": @"900",
            @"images": @[@"76.jpg"],
            @"description": @"球场由五届英国公开赛冠军Peter Thomson先生的TP公司负责设计。林克斯球场(C、D球场)设计巧妙刁钻、变化多端，炮台式果岭和深沉的沙坑是球场的一大特色。"
            },
            @{
            @"id": @77,
            @"name": @"天津江南领世郡高尔夫球场",
            @"latitude": @39.036277,
            @"longitude": @117.260722,
            @"address": @"天津市外环线17号桥(津港桥)东2公里处",
            @"phone": @"022-88829128",
            @"price": @"400",
            @"images": @[@"77.jpg"],
            @"description": @"拥有36个打位的天然真草练习场、星级高级会所一座、规划27洞国际标准高尔夫球场，其中包括9洞灯光球场。"
            },
            @{
            @"id": @78,
            @"name": @"天津滨海森林高尔夫球场",
            @"latitude": @39.097016,
            @"longitude": @117.679269,
            @"address": @"天津塘沽塘汉路789号",
            @"phone": @"022-25271000",
            @"price": @"600",
            @"images": @[@"78.jpg"],
            @"description": @"27洞总长为10937码，每18洞全长平均在7200码以上，标准杆72杆。"
            },
            @{
            @"id": @79,
            @"name": @"天津滨海湖高尔夫俱乐部",
            @"latitude": @39.145566,
            @"longitude": @117.556130,
            @"address": @"天津市滨海新区塘黄路塘黄分离式桥北400米处",
            @"phone": @"022-25271101",
            @"price": @"840",
            @"images": @[@"79.jpg"],
            @"description": @"锦标赛级别的球场包括南北两个18洞，其中北18洞位于湖心岛上，球道临水，岸线蜿蜒曲折。"
            },
            @{
            @"id": @80,
            @"name": @"天津蓟县盘山高尔夫俱乐部",
            @"latitude": @40.0695,
            @"longitude": @117.293627,
            @"address": @"蓟县燕山西大街706号",
            @"phone": @"022-59131222",
            @"price": @"500",
            @"images": @[@"80.jpg"],
            @"description": @"天津盘山高尔夫球会北依盘山，球场规模为36洞公园式国际标准高尔夫球场。"
            },
            @{
            @"id": @81,
            @"name": @"天津星耀五洲高尔夫俱乐部",
            @"latitude": @38.898369,
            @"longitude": @117.325197,
            @"address": @"天津津南区八里台镇天嘉湖星耀五洲",
            @"phone": @"022-60398027",
            @"price": @"660",
            @"images": @[@"81.jpg"],
            @"description": @"18洞锦标级球场总占地1100亩，环绕11000亩可与西湖水面相媲美的天嘉湖而建。"
            },
            @{
            @"id": @82,
            @"name": @"天津北国高尔夫练习场",
            @"latitude": @39.1016,
            @"longitude": @117.247869,
            @"address": @"天津市河东区光华路2号余门",
            @"phone": @"022-84283982",
            @"price": @"60元/100粒",
            @"images": @[@"82.jpg"],
            @"description": @"北国高尔夫练习场坐落在河东二宫体键中心院内，两层共设32个打位。"
            },
            @{
            @"id": @83,
            @"name": @"天津鼎基高尔夫练习场",
            @"latitude": @39.067508,
            @"longitude": @117.38445,
            @"address": @"天津市河东区津塘公路52号",
            @"phone": @"022-84111799",
            @"price": @"30元/50粒",
            @"images": @[@"83.jpg"],
            @"description": @""
            },
            @{
            @"id": @84,
            @"name": @"天津瑞景高尔夫练习场",
            @"latitude": @39.179311,
            @"longitude": @117.143238,
            @"address": @"天津市丁字沽三号路延长线瑞景居住区",
            @"phone": @"022-26685858",
            @"price": @"30元/位",
            @"images": @[@"84.jpg"],
            @"description": @"练习场占地4万余平方米，总长300码，内部装修高雅气派，设施规范合理。一层设打位26个。"
            },
            @{
            @"id": @85,
            @"name": @"天津迪康高尔夫练习场",
            @"latitude": @39.067338,
            @"longitude": @117.190072,
            @"address": @"天津市环湖中路与黑牛城道交口（南300米处）郁江西道旁",
            @"phone": @"022-23930001",
            @"price": @"",
            @"images": @[@"85.jpg"],
            @"description": @"迪康高尔夫练习场占地面积25000平方米，可击打170码的距离。场地设有40多个打位供球手练习。"
            },
            @{
            @"id": @86,
            @"name": @"天津三友高尔夫练习场",
            @"latitude": @39.060836,
            @"longitude": @117.66865,
            @"address": @"天津塘沽区海洋高新技术开发区金江路东",
            @"phone": @"022-25215598",
            @"price": @"",
            @"images": @[@"86.jpg"],
            @"description": @"拥有双层，40个打位，长240码，还拥有专业的高尔夫教学系统及挥球分析室，中、韩职业教练 。"
            },
            @{
            @"id": @87,
            @"name": @"森奥高尔夫练习场",
            @"latitude": @39.074469,
            @"longitude": @117.173158,
            @"address": @"天津市南开区卫津南路奥体中心东入口",
            @"phone": @"022-23350066 ",
            @"price": @"80元/100粒",
            @"images": @[@"87.jpg"],
            @"description": @"设置二层60个高球打席，击打距离约为200码"
            },
            @{
            @"id": @88,
            @"name": @"天津格瑞国际高尔夫练习场",
            @"latitude": @39.053763,
            @"longitude": @117.27305,
            @"address": @"天津市河西区浯水道58号",
            @"phone": @"022-88191188",
            @"price": @"",
            @"images": @[@"88.jpg"],
            @"description": @"高尔夫练习场打位60个草坪面积10万多平方米"
            },
            @{
            @"id": @89,
            @"name": @"天津park室内高尔夫练习场",
            @"latitude": @39.0777,
            @"longitude": @117.172030,
            @"address": @"天津南开区宾水西道奥林匹克中心体育场103-2室",
            @"phone": @"022-23820882",
            @"price": @"",
            @"images": @[@"89.jpg"],
            @"description": @"PGA高尔夫学院是一家集室内模拟高尔夫练习场及室内教学为一体的高尔夫教练场。"
            },
            @{
            @"id": @90,
            @"name": @"天津王朝高尔夫练习场",
            @"latitude": @39.269552,
            @"longitude": @117.228097,
            @"address": @"天津市北辰区津围公路29号王朝御苑酒堡庄园院内",
            @"phone": @"022-26894990",
            @"price": @"",
            @"images": @[@"90.jpg"],
            @"description": @"练习场占地面积30000平方米，全长260码，现有22个打位，两个VIP包房，视野广阔。"
            },
            @{
            @"id": @91,
            @"name": @"天津松江高尔夫练习场",
            @"latitude": @39.067263,
            @"longitude": @117.21045,
            @"address": @"天津市河西区友谊南路梅江南汐岸国际小区旁",
            @"phone": @"022-28048012",
            @"price": @"",
            @"images": @[@"91.jpg"],
            @"description": @"临近友谊南路梅江南，内部装修高雅气派，设施规范合理。"
            },
            @{
            @"id": @92,
            @"name": @"天津滨海益友练习场",
            @"latitude": @39.002258,
            @"longitude": @117.705427,
            @"address": @"天津市滨海新区新港二号路",
            @"phone": @"022-25921188",
            @"price": @"",
            @"images": @[@"92.jpg"],
            @"description": @"位于滨海新区新港二号路，远离市区，周边环境优美。"
            },
            @{
            @"id": @93,
            @"name": @"天津天竺天池高尔夫球练习场",
            @"latitude": @39.103319,
            @"longitude": @117.173077,
            @"address": @"天津市南开区八里台聂功桥西侧",
            @"phone": @"022-23911593",
            @"price": @"",
            @"images": @[@"93.jpg"],
            @"description": @"拥有总50杆的A、B、C、D四个室外练习场，还设有室内练习场以及室内模拟高尔夫设备。"
            },
            @{
            @"id": @94,
            @"name": @"可那夫高尔夫练习场",
            @"latitude": @39.086355,
            @"longitude": @117.167302,
            @"address": @"天津市南开区水上公园东路动物园东门旁50米处",
            @"phone": @"022-23931210",
            @"price": @"",
            @"images": @[@"94.jpg"],
            @"description": @"球场面积60000多平方米，清澈宽敞的湖面周围盘绕了9洞难度各异的模拟果岭、43个空间舒适的发球打位。"
            },
            @{
            @"id": @95,
            @"name": @"JS室内高尔夫练习场",
            @"latitude": @39.069038,
            @"longitude": @117.143430,
            @"address": @"河西区阳光100商业街2楼",
            @"phone": @"022-83959878",
            @"price": @"",
            @"images": @[@"95.jpg"],
            @"description": @"设有室内练习场以及室内模拟高尔夫设备，为高尔夫爱好者提供一个有力的练习平台。"
            },
            @{
            @"id": @96,
            @"name": @"天津G&G室内高尔夫练习场",
            @"latitude": @39.118905,
            @"longitude": @117.187316,
            @"address": @"天津和平区南京路92号增1号华侨大厦负2",
            @"phone": @"022-23921936",
            @"price": @"",
            @"images": @[@"96.jpg"],
            @"description": @"位于市区繁华路段，内部装修高雅气派，设施规范合理。"
            },
            ]];
}

+(NSArray*) allMerchantsOfHorse {
    return [NSMutableArray arrayWithArray:@[
            @{
            @"id": @97,
            @"name": @"熙博乐马术俱乐部",
            @"latitude": @39.153652,
            @"longitude": @117.01085,
            @"address": @"天津市西青区杨柳青镇双河村",
            @"phone": @"13920336688",
            @"price": @"",
            @"images": @[@"97.jpg"],
            @"description": @"目前有马15匹，品种包括：温血马、纯血马、阿拉伯马、半血马、蒙古马、果下马等。"
            },
            @{
            @"id": @98,
            @"name": @"汇川马友会",
            @"latitude": @38.711158,
            @"longitude": @117.490019,
            @"address": @"天津大港油田红旗路与开发道交口南行800米",
            @"phone": @"13821367644 ",
            @"price": @"450元/次",
            @"images": @[@"98.jpg"],
            @"description": @"汇川马友会成立于2011年10月，总占地面积一万多平米。"
            },
            @{
            @"id": @99,
            @"name": @"松江马场",
            @"latitude": @38.944275,
            @"longitude": @117.310483,
            @"address": @"天津市津南区八里台镇国家农业科技园区内",
            @"phone": @"022-28559999",
            @"price": @"",
            @"images": @[@"99.jpg"],
            @"description": @"国际标准马场占地面积52000平方米，拥有室内灯光马术练习场、国际马会标准障碍赛场."
            },
            @{
            @"id": @100,
            @"name": @"牧歌骑士马友会",
            @"latitude": @39.127411,
            @"longitude": @117.008975,
            @"address": @"天津市西青区杨柳青镇杨柳青庄园内(津同公路)",
            @"phone": @"13802130339",
            @"price": @"100元",
            @"images": @[@"100.jpg"],
            @"description": @"临近市区，环境优雅，马术爱好者的首选之地。"
            },
            @{
            @"id": @101,
            @"name": @"英雅马术俱乐部",
            @"latitude": @39.088872,
            @"longitude": @116.964572,
            @"address": @"天津市西青区辛口镇当城村东淀生态农场",
            @"phone": @"13132131106",
            @"price": @"120元/鞍时（45分钟）",
            @"images": @[@"101.jpg"],
            @"description": @"坐落在天津西青区辛口镇当成东淀生态农场,离天津市区最近的马场。"
            },
            @{
            @"id": @102,
            @"name": @"龙源马术俱乐部",
            @"latitude": @39.190980,
            @"longitude": @117.027172,
            @"address": @"天津北辰区红光农场京福公路旁",
            @"phone": @"022-26955898/26957391",
            @"price": @"",
            @"images": @[@"102.jpg"],
            @"description": @"成立于1998年，占地200多亩，俱乐部占地200多亩，现有进口马，国产马数十匹。"
            },
            @{
            @"id": @103,
            @"name": @"环亚国际马球会",
            @"latitude": @39.091477,
            @"longitude": @117.068363,
            @"address": @"天津滨海新区海泰华科九路16号",
            @"phone": @"022—83728888—7866",
            @"price": @"",
            @"images": @[@"103.jpg"],
            @"description": @"中国规模最大的马球会——天津环亚国际马球会，坐落于风景优美，交通便利的西青区。"
            },
            
            ]];
}

+(NSArray*) allMerchantsOfSwimming {
    return [NSMutableArray arrayWithArray:@[
            @{
            @"id": @1,
            @"name": @"复康路游泳馆",
            @"latitude": @39.098988,
            @"longitude": @117.164366,
            @"address": @"天津市南开区复康路7号增2号",
            @"phone": @"022-23351962",
            @"price": @"40元/人/次",
            @"images": @[@"1.jpg"],
            @"description": @"拥有50×21米的8条泳道标准池，及21×18米浅水池各一座。其中标准池水深1.9—2.1米，浅水池水深1.4米。"
            },
            @{
            @"id": @2,
            @"name": @"天津大学游泳馆",
            @"latitude": @39.107077,
            @"longitude": @117.170769,
            @"address": @"天津市南开区卫津路 92 号天津大学校内太雷路西侧",
            @"phone": @"022-27408061",
            @"price": @"6元 /小时",
            @"images": @[@"2.jpg"],
            @"description": @"天津大学游泳馆为标准泳池，泳池长 50 米、宽 25 米、深 1.65 — 1.9 米"
            },
            
            @{
            @"id": @3,
            @"name": @"天津市游泳跳水馆",
            @"latitude": @39.094511,
            @"longitude": @117.158116,
            @"address": @"天津市南开区水上公园北道48号",
            @"phone": @"022-23378409",
            @"price": @"70元/人/次",
            @"images": @[@"3.jpg"],
            @"description": @"游泳池为21X50米， 8 条泳道，水深2米至3米，并设有600人的看台坐席。"
            },
            
            @{
            @"id": @4,
            @"name": @"三源益康游泳馆",
            @"latitude": @39.112008,
            @"longitude": @117.225636,
            @"address": @"河东区六纬路70号三源益康文化体育中心院内",
            @"phone": @"022-84503808",
            @"price": @"20 元 /1.5 小时",
            @"images": @[@"4.jpg"],
            @"description": @"设有四季恒温带循环水消毒系统的标准游泳馆( 25m*50m )，并配有儿童戏水池、热水淋浴"
            },
            
            @{
            @"id": @5,
            @"name": @"天津市干部疗养院",
            @"latitude": @39.087488,
            @"longitude": @117.152244,
            @"address": @"天津市南开区育梁道2号",
            @"phone": @"022-23678064",
            @"price": @"15元",
            @"images": @[@"5.jpg"],
            @"description": @" 院占地面积55000平方米（80亩），建筑面积23500余平方米，绿地植被30000平方米，人工湖水面4000平方米"
            },
            
            @{
            @"id": @6,
            @"name": @"大港游泳馆",
            @"latitude": @38.839883,
            @"longitude": @117.439547,
            @"address": @"天津市大港区喜荣街112—2号",
            @"phone": @"022-62085666",
            @"price": @"",
            @"images": @[@"6.jpg"],
            @"description": @"拥有深水馆、浅水馆、运动员热身池和儿童戏水池各一座，建筑面积16000平米"
            },
            
            @{
            @"id": @7,
            @"name": @"天津工业大学游泳馆（河东）",
            @"latitude": @39.128508,
            @"longitude": @117.244769,
            @"address": @"天津市河东区程林庄路 63 号 工业大学游泳馆",
            @"phone": @"022-24528087",
            @"price": @"",
            @"images": @[@"7.jpg"],
            @"description": @"本馆于 2003 年建成使用，为标准 10 道 50 米比赛专用游泳馆。"
            },
            
            @{
            @"id": @8,
            @"name": @"天津商业大学游泳馆",
            @"latitude": @39.150169,
            @"longitude": @117.132222,
            @"address": @"天津市红桥区咸阳路2号天津商业大学内",
            @"phone": @"022-26684060",
            @"price": @"",
            @"images": @[@"8.jpg"],
            @"description": @"游泳馆拥有长 50 米 X26 米、 10 泳道、外溢式、循环净化、洁净明亮的标准泳池一座，附有宽敞的更衣间和淋浴间。"
            },
            
            @{
            @"id": @9,
            @"name": @"南开中学游泳馆",
            @"latitude": @39.128386,
            @"longitude": @117.165122,
            @"address": @"天津市南开区四马路22号",
            @"phone": @"022-27023820",
            @"price": @"",
            @"images": @[@"9.jpg"],
            @"description": @"总面积为 3000 余平方米，泳池为 50mX25m 有 8 条泳道(深浅区各四道)。深水区水深 2 米，浅水区水深为 1.10 米。"
            },
            
            @{
            @"id": @10,
            @"name": @"天津二中游泳馆",
            @"latitude": @39.156022,
            @"longitude": @117.201230,
            @"address": @"天津市河北区昆纬路 109 号",
            @"phone": @"022-26235299",
            @"price": @"",
            @"images": @[@"10.jpg"],
            @"description": @"该馆建筑面积近 1600 平方米，为 8 泳道 25 米短池。"
            },
            
            @{
            @"id": @11,
            @"name": @"和平游泳馆",
            @"latitude": @39.119752,
            @"longitude": @117.20265,
            @"address": @"天津市和平区保定道23号",
            @"phone": @"022-23394322",
            @"price": @"90分钟/20元",
            @"images": @[@"11.jpg"],
            @"description": @"馆内外面貌焕然一新，环境清新幽雅，多年来被市体育局评为开放优秀单位"
            },
            
            @{
            @"id": @12,
            @"name": @"南开体育中心游泳馆",
            @"latitude": @39.115480,
            @"longitude": @117.146327,
            @"address": @"南开区鞍山西道三潭路 165 号",
            @"phone": @"022-27372728",
            @"price": @"",
            @"images": @[@"12.jpg"],
            @"description": @"南开体育中心游泳馆是设有 8 条泳道的国际标准比赛用池，深浅池兼备。"
            },
            @{
            @"id": @13,
            @"name": @"河西游泳馆",
            @"latitude": @39.102652,
            @"longitude": @117.212525,
            @"address": @"天津市河西区琼州道103号",
            @"phone": @"022-83815841",
            @"price": @"",
            @"images": @[@"13.jpg"],
            @"description": @"该馆建筑面积 1040 平方米 , 为 25×25 米六泳道标准短池。"
            },
            @{
            @"id": @14,
            @"name": @"四十三中游泳馆",
            @"latitude": @39.124441,
            @"longitude": @117.123216,
            @"address": @"天津市南开区三谭路165号四十三中学校内",
            @"phone": @"022-27372728",
            @"price": @"25元/1.5小时",
            @"images": @[@"14.jpg"],
            @"description": @"位于四十三中内，水质清澈，环境优雅。"
            },
            @{
            @"id": @15,
            @"name": @"天津医科大学游泳馆",
            @"latitude": @39.105338,
            @"longitude": @117.17955,
            @"address": @"天津市和平区气象台路22号天津医科大学内",
            @"phone": @"022-23542816",
            @"price": @"25元/次",
            @"images": @[@"15.jpg"],
            @"description": @"医科大学游泳馆，价格优惠，拥有潜水此、戏水池、深水池各一个。"
            },
            @{
            @"id": @16,
            @"name": @"今晚报大厦游泳馆",
            @"latitude": @39.1225 ,
            @"longitude": @117.169663,
            @"address": @"天津市南开区南京路358号今晚大酒店1楼",
            @"phone": @"022-27501380",
            @"price": @"",
            @"images": @[@"16.jpg"],
            @"description": @"位于今晚大酒店一楼，格局高档，环境优雅"
            },
            @{
            @"id": @17,
            @"name": @"体育学院游泳馆",
            @"latitude": @39.073197,
            @"longitude": @117.181136,
            @"address": @"天津市河西区卫津南路51号天津体育学院内",
            @"phone": @"022-23016132",
            @"price": @"",
            @"images": @[@"17.jpg"],
            @"description": @"位于天津体育学院内，是天津为数不多的专业性场馆之一。"
            },
            @{
            @"id": @18,
            @"name": @"天津中学游泳馆",
            @"latitude": @39.137063,
            @"longitude": @117.144333,
            @"address": @"天津市南开区华苑小区中孚路41号天津中学",
            @"phone": @"022-23713120",
            @"price": @"",
            @"images": @[@"18.jpg"],
            @"description": @"位于天津中学内，交通方便，价格合理"
            },
            @{
            @"id": @19,
            @"name": @"耀华中学游泳池",
            @"latitude": @39.104469,
            @"longitude": @117.190427,
            @"address": @"和平区山西路耀华中学校区内",
            @"phone": @"022-23396979",
            @"price": @"",
            @"images": @[@"19.jpg"],
            @"description": @"位于耀华中学内，地处市区繁华路段"
            },
            @{
            @"id": @20,
            @"name": @"欣苑游泳馆",
            @"latitude": @39.093880,
            @"longitude": @117.146816,
            @"address": @"南开区欣苑路欣苑大厦游泳馆",
            @"phone": @"022-23692729",
            @"price": @"",
            @"images": @[@"20.jpg"],
            @"description": @"临近天津社科院，周边多居民小区，价格合理"
            },
            @{
            @"id": @21,
            @"name": @"三源康体游泳馆",
            @"latitude": @39.126941 ,
            @"longitude": @117.176105,
            @"address": @"天津市和平区荣安大街167号",
            @"phone": @"022-27233681",
            @"price": @"",
            @"images": @[@"21.jpg"],
            @"description": @"临近荣安大街，水质清澈，环境优雅"
            },
            @{
            @"id": @22,
            @"name": @"天津工业大学游泳馆（大学城）",
            @"latitude": @39.071066,
            @"longitude": @117.121136,
            @"address": @"西青区宾水西道延长线399号",
            @"phone": @"022-83956781",
            @"price": @"40元/次",
            @"images": @[@"22.jpg"],
            @"description": @"游泳馆拥有一个标准的10道泳池（50米）和一个8泳道的训练池（25米）."
            },
            @{
            @"id": @23,
            @"name": @"英派斯游泳健身会所",
            @"latitude": @39.066786 ,
            @"longitude": @117.206983,
            @"address": @"河西区梅江九华山路蓝水园内",
            @"phone": @"022-23250066",
            @"price": @"",
            @"images": @[@"23.jpg"],
            @"description": @"高端健身会所，环境优雅，设施完备"
            },
            @{
            @"id": @24,
            @"name": @"第二游泳池",
            @"latitude": @39.115113 ,
            @"longitude": @117.187855,
            @"address": @"和平区西安道66号",
            @"phone": @"022-23394283",
            @"price": @"",
            @"images": @[@"24.jpg"],
            @"description": @"多年经营，价格合理，拥有良好的泳池管理经验"
            },
            @{
            @"id": @25,
            @"name": @"康体中心游泳馆",
            @"latitude": @39.128508,
            @"longitude": @117.244769,
            @"address": @"河东区中环线红星路东大通时尚花园会馆院内",
            @"phone": @"022-58999350",
            @"price": @"",
            @"images": @[@"25.jpg"],
            @"description": @"临近河东区中环线，交通方便，环境优雅"
            },
            @{
            @"id": @26,
            @"name": @"天津三中游泳馆",
            @"latitude": @39.181077 ,
            @"longitude": @117.150161,
            @"address": @"红桥区丁字沽一号路向东道三中院内",
            @"phone": @"022-86513074",
            @"price": @"25元/1.5小时",
            @"images": @[@"26.jpg"],
            @"description": @"拥有6条25米泳道，设施完善"
            },
            @{
            @"id": @27,
            @"name": @"天津财经大学游泳馆",
            @"latitude": @39.06265,
            @"longitude": @117.26645,
            @"address": @"河西区珠江道25号财院东门A座内",
            @"phone": @"022-88186026",
            @"price": @"",
            @"images": @[@"27.jpg"],
            @"description": @"位于财经大学校区内，环境优雅，价格合理"
            },
            @{
            @"id": @28,
            @"name": @"新华中学游泳馆",
            @"latitude": @39.110736,
            @"longitude": @117.205888,
            @"address": @"和平区马场道99号",
            @"phone": @"022-23280356",
            @"price": @"",
            @"images": @[@"28.jpg"],
            @"description": @"位于马场道，周边环境优雅，交通便利"
            },
            @{
            @"id": @29,
            @"name": @"北师大天津附中游泳馆",
            @"latitude": @39.072644 ,
            @"longitude": @117.262194,
            @"address": @"河西区大沽南路1010号",
            @"phone": @"022-28190238",
            @"price": @"",
            @"images": @[@"29.jpg"],
            @"description": @"临近大沽南路，设备一流、水质清澈，管理严谨"
            },
            @{
            @"id": @30,
            @"name": @"双发游泳馆",
            @"latitude": @39.233511,
            @"longitude": @117.150691,
            @"address": @"北辰区北仓道6号增1号双发大酒店1楼",
            @"phone": @"022-26836666",
            @"price": @"",
            @"images": @[@"30.jpg"],
            @"description": @"位于双发大酒店内，定期换水以保障水质新鲜，水温常年保持28--35度之间。"
            },
            @{
            @"id": @31,
            @"name": @"四季馨园游泳馆",
            @"latitude": @39.06705,
            @"longitude": @117.253938,
            @"address": @"河西区东江路57号四季馨园内",
            @"phone": @"022-28151828",
            @"price": @"",
            @"images": @[@"31.jpg"],
            @"description": @"临近河西区东江路，位于居民小区内，环境优雅，价格合理。"
            },
            @{
            @"id": @32,
            @"name": @"泰丰家园游泳馆",
            @"latitude": @39.037383,
            @"longitude": @117.702711,
            @"address": @"滨海新区第四大街99号泰丰家园内",
            @"phone": @"022-",
            @"price": @"",
            @"images": @[@"32.jpg"],
            @"description": @"临近滨海新区第四大街，远离市区，空气清新。"
            },
            @{
            @"id": @33,
            @"name": @"广顺园游泳馆",
            @"latitude": @39.100830 ,
            @"longitude": @117.209455,
            @"address": @"河西区广东路广顺园小区内",
            @"phone": @"022-23260504",
            @"price": @"",
            @"images": @[@"33.jpg"],
            @"description": @"位于居民小区内，环境优雅，价格合理。"
            },
            @{
            @"id": @34,
            @"name": @"宝宝树婴儿游泳馆",
            @"latitude": @39.066066,
            @"longitude": @117.213711,
            @"address": @"河西区友谊南路涟水园6号楼1门",
            @"phone": @"022-28148890",
            @"price": @"",
            @"images": @[@"34.jpg"],
            @"description": @"临近友谊南路，有专门供婴儿游泳的水池。"
            },
            @{
            @"id": @35,
            @"name": @"山海天游泳馆",
            @"latitude": @39.085330,
            @"longitude": @117.152547,
            @"address": @"南开区水上西路",
            @"phone": @"022-23855979",
            @"price": @"",
            @"images": @[@"35.jpg"],
            @"description": @"临近水上公园，环境优美，交通便利"
            },
            @{
            @"id": @36,
            @"name": @"华馨公寓游泳馆",
            @"latitude": @39.146811,
            @"longitude": @117.190333,
            @"address": @"河北区华昌大街华馨公寓旁",
            @"phone": @"",
            @"price": @"",
            @"images": @[@"36.jpg"],
            @"description": @"临近河北区华馨公寓，价格合理"
            },
            @{
            @"id": @37,
            @"name": @"恋日风景游泳馆",
            @"latitude": @39.138091 ,
            @"longitude": @117.239969,
            @"address": @"河东区晨阳道恋日风景小区 ",
            @"phone": @"022-24590818",
            @"price": @"",
            @"images": @[@"37.jpg"],
            @"description": @"位于恋日风景校区内，环境优美，价格合理"
            },
            @{
            @"id": @38,
            @"name": @"北岸华庭游泳馆",
            @"latitude": @39.140788,
            @"longitude": @117.194872,
            @"address": @"河北区胜利路北岸华庭院内",
            @"phone": @"022-24469945",
            @"price": @"",
            @"images": @[@"38.jpg"],
            @"description": @"位于居民小区内，交通便利"
            },
            @{
            @"id": @39,
            @"name": @"金帆大厦游泳池",
            @"latitude": @39.027533 ,
            @"longitude": @117.679761,
            @"address": @"滨海新区第一大街49号",
            @"phone": @"022-25326666",
            @"price": @"",
            @"images": @[@"39.jpg"],
            @"description": @"临近滨海新区第一大街，周边环境优美，交通便利"
            },
            @{
            @"id": @40,
            @"name": @"香水园游泳馆",
            @"latitude": @39.066786,
            @"longitude": @117.206983,
            @"address": @"河西区梅江九华山路",
            @"phone": @"022-88384979",
            @"price": @"",
            @"images": @[@"40.jpg"],
            @"description": @"位于河西区九华山路，交通便利，价格合理"
            },
            @{
            @"id": @41,
            @"name": @"干部俱乐部南楼游泳馆",
            @"latitude": @39.094572 ,
            @"longitude": @117.186169,
            @"address": @"河西区马场道188号 ",
            @"phone": @"022-23327088 ",
            @"price": @"",
            @"images": @[@"41.jpg"],
            @"description": @"位于马场道内，设施完善，价格合理"
            },
            @{
            @"id": @42,
            @"name": @"十四中游泳馆",
            @"latitude": @39.162883 ,
            @"longitude": @117.210733,
            @"address": @"河北区水产前街45号十四中内",
            @"phone": @"022-26431753",
            @"price": @"",
            @"images": @[@"42.jpg"],
            @"description": @"位于十四中学内，价格合理"
            },
            @{
            @"id": @43,
            @"name": @"紫云游泳馆",
            @"latitude": @39.006483,
            @"longitude": @117.705002,
            @"address": @"滨海新区新港三号路紫云学校内",
            @"phone": @"022-66700222",
            @"price": @"",
            @"images": @[@"43.jpg"],
            @"description": @"临近滨海新区新港三号路，周边环境优雅"
            },
            @{
            @"id": @44,
            @"name": @"凌一母婴高级会所婴儿游泳",
            @"latitude": @39.157969 ,
            @"longitude": @117.171041,
            @"address": @"红桥区河北大街金领国际8-2201号",
            @"phone": @"022-86683691",
            @"price": @"",
            @"images": @[@"44.jpg"],
            @"description": @"提供母婴游泳服务，设施完善，水质清澈"
            },
            @{
            @"id": @45,
            @"name": @"裕阳花园游泳馆",
            @"latitude": @39.136166 ,
            @"longitude": @117.207138,
            @"address": @"河东区新兆路裕阳花园小区内",
            @"phone": @"022-24324795",
            @"price": @"",
            @"images": @[@"45.jpg"],
            @"description": @"位于居民小区内，环境优雅，价格合理"
            },
            @{
            @"id": @46,
            @"name": @"天津市三毛艺术学校游泳馆",
            @"latitude": @39.142672,
            @"longitude": @117.206341,
            @"address": @"河东区华龙道",
            @"phone": @"15022591466",
            @"price": @"",
            @"images": @[@"46.jpg"],
            @"description": @"临近河东区华龙道，配有专业的游泳教练"
            },
            @{
            @"id": @47,
            @"name": @"尖山温泉游泳馆",
            @"latitude": @39.080013,
            @"longitude": @117.2201,
            @"address": @"河西区泰山路26号",
            @"phone": @"022-28271385",
            @"price": @"",
            @"images": @[@"47.jpg"],
            @"description": @"临近河西区泰山路，设施完善，价格合理"
            },
            @{
            @"id": @48,
            @"name": @"第四人民游泳池",
            @"latitude": @39.163597,
            @"longitude": @117.18895,
            @"address": @"河北区月纬路27号",
            @"phone": @"022-26264247",
            @"price": @"",
            @"images": @[@"48.jpg"],
            @"description": @"位于河北区月纬路，设备齐全，管理规范，服务一流。"
            },
            @{
            @"id": @49,
            @"name": @"莱茵春天游泳馆",
            @"latitude": @39.043688 ,
            @"longitude": @117.648305,
            @"address": @"滨海新区福州道",
            @"phone": @"022-62031106",
            @"price": @"",
            @"images": @[@"49.jpg"],
            @"description": @"临近滨海新区福州道，环境优雅，价格合理"
            },
            @{
            @"id": @50,
            @"name": @"威斯汀室内恒温泳池",
            @"latitude": @39.115602,
            @"longitude": @117.197438,
            @"address": @"和平区南京路101号威斯汀酒店5楼",
            @"phone": @"022-23890174",
            @"price": @"",
            @"images": @[@"50.jpg"],
            @"description": @"位于南京路威斯汀酒店，地处市区繁华路段，格局高雅，设施一流。"
            },
            @{
            @"id": @51,
            @"name": @"第三中学游泳馆",
            @"latitude": @39.182536,
            @"longitude": @117.151255,
            @"address": @"红桥区向东道",
            @"phone": @"022-26526521",
            @"price": @"",
            @"images": @[@"51.jpg"],
            @"description": @"位于红桥区向东道，环境优雅，价格合理"
            },
            @{
            @"id": @52,
            @"name": @"泰达水世界",
            @"latitude": @39.002258,
            @"longitude": @117.704427,
            @"address": @"滨海新区奥运路11号泰达时尚健身休闲广场5号馆",
            @"phone": @"022-65321888",
            @"price": @"",
            @"images": @[@"52.jpg"],
            @"description": @"位于泰达时尚健身休闲广场，周边交通便利，场馆设施完备，管理严格。"
            },
            @{
            @"id": @53,
            @"name": @"河东区游泳馆",
            @"latitude": @39.113844 ,
            @"longitude": @117.233438,
            @"address": @"河东区津塘路52号河东体育场院内",
            @"phone": @"",
            @"price": @"",
            @"images": @[@"53.jpg"],
            @"description": @"位于河东体育场内，设备齐全，管理规范，服务一流。"
            },
            @{
            @"id": @54,
            @"name": @"大学城游泳馆",
            @"latitude": @39.070075 ,
            @"longitude": @117.738491,
            @"address": @"滨海新区第十三大街科技大学大学城",
            @"phone": @"",
            @"price": @"",
            @"images": @[@"54.jpg"],
            @"description": @"位于滨海新区第十三大街科技大学城内，环境优雅，价格合理"
            },
            @{
            @"id": @55,
            @"name": @"喜来登酒店游泳馆",
            @"latitude": @39.079888 ,
            @"longitude": @117.189613,
            @"address": @"河西区紫金山路喜来登大酒店1楼",
            @"phone": @"022-23520775",
            @"price": @"",
            @"images": @[@"55.jpg"],
            @"description": @"位于喜来登大酒店内，格局高雅，设施完备，服务一流。"
            },
            @{
            @"id": @56,
            @"name": @"米兰翠景园游泳馆",
            @"latitude": @39.145541,
            @"longitude": @117.152202,
            @"address": @"红桥区芥园道米兰翠景园小区内",
            @"phone": @"022-27566868",
            @"price": @"",
            @"images": @[@"56.jpg"],
            @"description": @"位于居民小区内，环境优雅，价格合理"
            },
            @{
            @"id": @57,
            @"name": @"泰丰游泳馆",
            @"latitude": @39.042180 ,
            @"longitude": @117.700011,
            @"address": @"滨海新区第五大街80号泰丰会馆",
            @"phone": @"",
            @"price": @"",
            @"images": @[@"57.jpg"],
            @"description": @"位于泰丰会馆内，设备齐全，管理规范，服务一流。"
            },
            @{
            @"id": @58,
            @"name": @"西青游泳馆",
            @"latitude": @39.139308,
            @"longitude": @117.012369,
            @"address": @"近郊新华道(近百顺大卖场)",
            @"phone": @"022-27931656",
            @"price": @"",
            @"images": @[@"58.jpg"],
            @"description": @"临近西青区新华道，水质清澈，价格合理"
            },
            @{
            @"id": @59,
            @"name": @"仁恒海河广场运动中心游泳馆",
            @"latitude": @39.136669,
            @"longitude": @117.184725,
            @"address": @"南开区东马路137号仁恒海河广场5号楼运动中心内",
            @"phone": @"022-58915666-500",
            @"price": @"",
            @"images": @[@"59.jpg"],
            @"description": @"位于仁恒海河广场内，设备齐全，管理规范，服务一流。"
            },
            @{
            @"id": @60,
            @"name": @"派森游泳馆",
            @"latitude": @39.05385,
            @"longitude": @117.169041,
            @"address": @"西青区雅乐道杨楼涵溪园",
            @"phone": @"022-87825557",
            @"price": @"",
            @"images": @[@"60.jpg"],
            @"description": @"位于居民小区内，环境优雅，价格合理"
            },
            @{
            @"id": @61,
            @"name": @"泰达国际会馆绿波水疗中心游泳馆",
            @"latitude": @39.098988,
            @"longitude": @117.164366,
            @"address": @"南开区复康路7号增2号",
            @"phone": @"022-58695555",
            @"price": @"",
            @"images": @[@"61.jpg"],
            @"description": @"位于泰达国际会馆内，格局高雅，设备齐全，管理规范，服务一流。"
            },
            @{
            @"id": @62,
            @"name": @"名仕达游泳馆",
            @"latitude": @39.097122,
            @"longitude": @117.224744,
            @"address": @"河西区解放南路名仕达花园",
            @"phone": @"13821469647",
            @"price": @"",
            @"images": @[@"62.jpg"],
            @"description": @"位于名仕达花园，环境优雅，价格合理。"
            },
            @{
            @"id": @63,
            @"name": @"欢乐海魔方",
            @"latitude": @39.104663 ,
            @"longitude": @117.744336,
            @"address": @"天津滨海新区旅游区中央大道旁（永定新河桥）安康道与山岚路交口",
            @"phone": @"022-66208854",
            @"price": @"200元",
            @"images": @[@"63.jpg"],
            @"description": @"由世界知名的DPI公司担当规划设计，按照国家5A级景区标准，依据国际主题景区品质精心打造“中国人自已的水上乐园”。"
            },
            @{
            @"id": @64,
            @"name": @"天津米立方海世界",
            @"latitude": @38.920561,
            @"longitude": @117.419066,
            @"address": @"天津市津南区小站镇津歧路与盛塘路交汇处",
            @"phone": @"022-28526666",
            @"price": @"120元",
            @"images": @[@"64.jpg"],
            @"description": @"米立方海世界全年室温30度、水温28度，24小时循环消毒处理，水的纯净度达到国际标准。"
            },
            @{
            @"id": @65,
            @"name": @"天海风水上休闲运动俱乐部",
            @"latitude": @39.184619,
            @"longitude": @117.480394,
            @"address": @"天津市东丽区东丽湖万科城国际滑水会所",
            @"phone": @"022-24888877",
            @"price": @"",
            @"images": @[@"65.jpg"],
            @"description": @"拥有世界顶级的符合国际标准的人工赛道-----兰多湾国际滑水赛道。"
            },
            @{
            @"id": @66,
            @"name": @"天津欢乐谷主题公园",
            @"latitude": @39.189744 ,
            @"longitude": @117.477266,
            @"address": @"天津市东丽区东丽湖旅游度假区东丽之光大道",
            @"phone": @"022-24886888",
            @"price": @"150元/人",
            @"images": @[@"66.jpg"],
            @"description": @"全园分为六大主题区：演艺中心、欢乐时光、海洋之心、维京海港、圣诞村、飞跃加勒比。"
            },
            ]];
}
@end
