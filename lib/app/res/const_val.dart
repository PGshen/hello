import 'package:flutter/material.dart';

class ConstVal {
  static const String appName = "Hello";

  static const themeColorIndex = "theme_color_index";

  static final themeColor = <MaterialColor, String>{
    Colors.red: "红色",
    Colors.orange: "橙色",
    Colors.yellow: "黄色",
    Colors.green: "绿色",
    Colors.blue: "蓝色",
    Colors.indigo: "紫色"
  };

  static const tabColors = [
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.cyanAccent,
    Colors.blueAccent,
    Colors.indigoAccent
  ];

  static const String bookInfo = """
[
  {
    "image":"assets/images/bg01.webp",
    "name":"高等数学",
    "info":"高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：数列、极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科、财经类研究生考试的基础科目。"
  },
    {
    "image":"assets/images/bg02.webp",
    "name":"线性代数",
    "info":"线性代数是数学的一个分支，它的研究对象是向量，向量空间（或称线性空间），线性变换和有限维的线性方程组。向量空间是现代数学的一个重要课题；因而，线性代数被广泛地应用于抽象代数和泛函分析中；通过解析几何，线性代数得以被具体表示。线性代数的理论已被泛化为算子理论。"

  },
    {
    "image":"assets/images/bg03.webp",
    "name":"大学英语",
    "info":"英语（一）即原研究生入学统考“英语”，所有学术型硕士研究生（英语专业选考其他语种）（十三大门类，110个一级学科）和部分专业型硕士（法律硕士、临床医学硕士、口腔医学硕士、建筑学硕士、护理硕士、汉语国际教育硕士、公共卫生硕士等）必考英语（一）"

  },
    {
    "image":"assets/images/bg04.webp",
    "name":"数据结构",
    "info":"数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。"

  },
    {
    "image":"assets/images/bg05.webp",
    "name":"C语言",
    "info":"C语言是一门面向过程的、抽象化的通用程序设计语言，广泛应用于底层开发。C语言能以简易的方式编译、处理低级存储器。"

  }
]
""";
}
