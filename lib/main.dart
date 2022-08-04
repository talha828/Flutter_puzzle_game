import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive_project/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ImageModel> list = [
    ImageModel(image: "assets/cartoon/bracks/1.png", index: 1),
    ImageModel(image: "assets/cartoon/bracks/2.png", index: 2),
    ImageModel(image: "assets/cartoon/bracks/3.png", index: 3),
    ImageModel(image: "assets/cartoon/bracks/4.png", index: 4),
    ImageModel(image: "assets/cartoon/bracks/5.png", index: 5),
    ImageModel(image: "assets/cartoon/bracks/6.png", index: 6),
    ImageModel(image: "assets/cartoon/bracks/7.png", index: 7),
    ImageModel(image: "assets/cartoon/bracks/8.png", index: 8),
    ImageModel(image: "assets/cartoon/bracks/9.png", index: 9),
  ];
  List<ImageModel> list3 = [
    ImageModel(image: "assets/cartoon/bracks/1.png", index: 1),
    ImageModel(image: "assets/cartoon/bracks/2.png", index: 2),
    ImageModel(image: "assets/cartoon/bracks/3.png", index: 3),
    ImageModel(image: "assets/cartoon/bracks/4.png", index: 4),
    ImageModel(image: "assets/cartoon/bracks/5.png", index: 5),
    ImageModel(image: "assets/cartoon/bracks/6.png", index: 6),
    ImageModel(image: "assets/cartoon/bracks/7.png", index: 7),
    ImageModel(image: "assets/cartoon/bracks/8.png", index: 8),
    ImageModel(image: "assets/cartoon/bracks/9.png", index: 9),
  ];
  List list2 = [];
  bool animation = false;
  bool show = false;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        animation = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var width = media.width;
    var height = media.height;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: width,
        height: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/bg_fram.jpg',
                ),
                fit: BoxFit.cover)),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: 140,
            child: Container(
              child: Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(),
                  //   child: Image.asset("assets/puzzle/temp.webp",
                  //       width: 400,
                  //       height: 200,
                  //       fit: BoxFit.fill,
                  //       color: Color.fromRGBO(255, 255, 255, 0.3),
                  //       colorBlendMode: BlendMode.modulate),
                  // ),
                  Container(
                    width: 390,
                    height: 210,
                    child: Stack(children: [
                      for (int i = 0; i < list2.length; i++)
                        Container(
                          child: Image.asset(
                            "assets/cartoon/image/${list2[i]}.png",
                            width: 270,
                            height: 210,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ]),
                  ),
                  Image.asset("assets/puzzle/fram.png",
                      width: 270,
                      height: 210,
                      fit: BoxFit.fill,
                      color: Colors.black.withOpacity(0.2)),
                  Column(
                    children: [
                      Row(
                        children: [
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 1;
                          }, onAccept: (data) {
                            data.index == 1
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 1 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 2;
                          }, onAccept: (data) {
                            data.index == 2
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 2 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 3;
                          }, onAccept: (data) {
                            data.index == 3
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 3 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 4;
                          }, onAccept: (data) {
                            data.index == 4
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 4 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 5;
                          }, onAccept: (data) {
                            data.index == 5
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 5 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 6;
                          }, onAccept: (data) {
                            data.index == 6
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 6 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                        ],
                      ),
                      Row(
                        children: [
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 7;
                          }, onAccept: (data) {
                            data.index == 7
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 7 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 8;
                          }, onAccept: (data) {
                            data.index == 8
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 8 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                          DragTarget<ImageModel>(onWillAccept: (data) {
                            return data!.index == 9;
                          }, onAccept: (data) {
                            data.index == 9
                                ? list2.add(data.index)
                                : print(false);
                            data.index == 9 ? list.remove(data) : print(false);
                            setState(() {});
                            if (list.length < 1) {
                              Future.delayed(Duration(seconds: 1), () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.SUCCES,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: "congratulation",
                                  desc: "you win the game",
                                  btnCancelText: "Ok",
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {},
                                )..show().then((value) {
                                    list.addAll(list3);
                                    list2.clear();
                                    animation = false;
                                    show = false;
                                    setState(() {});
                                    Future.delayed(Duration(seconds: 1), () {
                                      setState(() {
                                        animation = true;
                                      });
                                    });
                                  });
                              });
                            }
                          }, builder: (context, accept, reject) {
                            return SizedBox(
                              width: 90,
                              height: 70,
                            );
                          }),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //alignment: Alignment.center,
                children: [
                  // Container(
                  //   child: Image.asset("assets/puzzle/10.png",width: 200,height: 400,fit: BoxFit.fill,color: Colors.black,),
                  // ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 350,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Draggable<ImageModel>(
                                data: list[index],
                                feedback: Container(
                                  width: 120,
                                  height: 120,
                                  child: AnimatedContainer(
                                    // alignment: Alignment.center,
                                    // color: Colors.white,
                                    curve: Curves.linear,
                                    duration: Duration(seconds: 2),
                                    width: animation ? 90 : 120,
                                    height: 90,
                                    onEnd: () {
                                      setState(() {
                                        animation = animation ? false : true;
                                      });
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        list[index].image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                child: AnimatedContainer(
                                  // alignment: Alignment.center,
                                  // color: Colors.white,
                                  curve: Curves.linear,
                                  duration: Duration(seconds: 2),
                                  width: animation ? 70 : 90,
                                  height: 90,
                                  onEnd: () {
                                    setState(() {
                                      animation = animation ? false : true;
                                    });
                                  },
                                  child: Container(
                                    child: Image.asset(list[index].image),
                                  ),
                                ),
                              );
                            },
                            itemCount: list.length < 4 ? list.length : 3),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
