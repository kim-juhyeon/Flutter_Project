import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

void main() async {
  runApp(SecondScreen());
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  ///MyApp({key? key}) : super(key: key)
//MyApp 생성자의 인자인 key는 : 상속해준 클래스의 key를 value로 가진다. (상속받은 클래스의 key) (map) (python의 dict형 같이)
//여기서, key는 null일 수 있다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  } // debugshow : true시 debug 표시가 화면에 출력된다. 여기서 buildcontext conetxt는
  // build 메소드를 통해서 위젯을 반환하고 그 안에 buildcontext를 집어넣는다.
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 영화 제목, 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        /*elevation : 그림자* */
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black), //아이콘 색상
        title: Text(
          "Movie Reviews",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, //눌러도 아무 반응을 하지 않음 onPfrssed를 이용하여 여러가지 방법을 사용할 수 있음. (이전,다른 로그인등등)
            icon: Icon(Icons.airline_seat_legroom_normal),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
                8.0), // 전체 여백을 지정하는 옵션 (특정여백으로 left,right 등이 있음)
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Movie', // decoration에서 라벨 이름을 알려줌
                labelStyle: TextStyle(color: Color.fromARGB(255, 94, 45, 137)),
                hintText: "영화 제목을 검색해주세요.",
                focusedBorder: OutlineInputBorder(
                  //입력창 생성 및 생성된 입력창은 둥근모서리로 진행됨 (Radius)
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 131, 61, 102)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search), //검색 아이콘
                  onPressed: () {}, //onPressed 에서 아무것도 지정하지 않았기에 빈창이 출력
                ),
              ),
            ),
          ),
          Divider(
              // 검색창 밑 사진위에를 padding 보다는 divider를 주었음
              thickness: 3,
              height: 1,
              color: Color.fromARGB(255, 239, 242, 226)),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                String category = dataList[index]['category'];
                String imgUrl = dataList[index]['imgUrl'];

                return Card(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imgUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(color: Colors.amber),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          "https://i.ibb.co/ZVbhyqH/emoji.png",
                          width: 62,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "닉네임",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "hello@world.com",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 3 / 1,
              child: PageView(
                children: [
                  Image.network("https://i.ibb.co/0mXKmZq/banner-1.jpg"),
                  Image.network("https://i.ibb.co/DDgYrJR/banner-2.jpg"),
                  Image.network("https://i.ibb.co/v1RMHN4/banner-3.jpg"),
                  Image.network("https://i.ibb.co/NmNsrr2/banner-4.jpg"),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "구매내역",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "리뷰 남긴 영화",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
