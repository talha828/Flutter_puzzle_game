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
    ImageModel(image: "assets/cropImage/1.png", index: 1),
    ImageModel(image: "assets/cropImage/2.png", index: 2),
    ImageModel(image: "assets/cropImage/3.png", index: 3),
    ImageModel(image: "assets/cropImage/4.png", index: 4),
    ImageModel(image: "assets/cropImage/5.png", index: 5),
    ImageModel(image: "assets/cropImage/6.png", index: 6),
    ImageModel(image: "assets/cropImage/7.png", index: 7),
    ImageModel(image: "assets/cropImage/8.png", index: 8),
    ImageModel(image: "assets/cropImage/9.png", index: 9),
  ];
  List<ImageModel> list3 = [
    ImageModel(image: "assets/cropImage/1.png", index: 1),
    ImageModel(image: "assets/cropImage/2.png", index: 2),
    ImageModel(image: "assets/cropImage/3.png", index: 3),
    ImageModel(image: "assets/cropImage/4.png", index: 4),
    ImageModel(image: "assets/cropImage/5.png", index: 5),
    ImageModel(image: "assets/cropImage/6.png", index: 6),
    ImageModel(image: "assets/cropImage/7.png", index: 7),
    ImageModel(image: "assets/cropImage/8.png", index: 8),
    ImageModel(image: "assets/cropImage/9.png", index: 9),
  ];
  List list2 = [];
  bool animation = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

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
                  'assets/background.jpg',
                ),
                fit: BoxFit.cover)),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: 140,
            child: Container(
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 200,
                    child: Stack(children: [
                      for (int i = 0; i < list2.length; i++)
                        Container(
                          child: Image.asset(
                            "assets/puzzle/${list2[i]}.png",
                            width: 400,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                    ]),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/puzzle/temp.webp",
                        width: 400,
                        height: 200,
                        fit: BoxFit.fill,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        colorBlendMode: BlendMode.modulate),
                  ),
                  DragTarget<ImageModel>(onWillAccept: (data) {
                    return data!.image != "red";
                  }, onAccept: (data) {
                    print(data);
                    list2.add(data.index);
                    list.remove(data);
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
                          animation=false;
                          setState(() {
                          });
                          Future.delayed(Duration(seconds: 1),(){
                            setState(() {
                              animation=true;
                            });
                          });
                        });
                      });
                    }
                  }, builder: (context, accept, reject) {
                    return Container(
                      child: Image.asset(
                        "assets/puzzle/fram.png",
                        width: 400,
                        height: 200,
                        fit: BoxFit.fill,
                        color: Colors.black,
                      ),
                    );
                  }),
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
                      SizedBox(
                        width: 40,
                      ),
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
