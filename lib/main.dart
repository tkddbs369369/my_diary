import 'package:flutter/material.dart';
import 'add_page.dart';
import 'edit_page.dart';
import 'view_page.dart';

void main() {
  runApp(MaterialApp(
    home: const MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 다이어리 제목과 내용을 저장할 리스트
  List<String> titles = [];
  List<String> contents = [];

  // 다이어리 추가 페이지로 이동하는 메서드
  void _goToAddPage() async {
    // 결과를 받아올 수 있는 네비게이션
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPage()),
    );
    // 결과가 null이 아니면 리스트에 추가하고 상태 업데이트
    if (result != null) {
      setState(() {
        titles.add(result['title']);
        contents.add(result['content']);
      });
    }
  }

  // 다이어리 편집 페이지로 이동하는 메서드
  void _goToEditPage(int index) async {
    // 결과를 받아올 수 있는 네비게이션
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditPage(
                title: titles[index],
                content: contents[index],
              )),
    );
    // 결과가 null이 아니면 리스트에 수정하고 상태 업데이트
    if (result != null) {
      setState(() {
        titles[index] = result['title'];
        contents[index] = result['content'];
      });
    }
  }

  // 다이어리 열람 페이지로 이동하는 메서드
  void _goToViewPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ViewPage(
                title: titles[index],
                content: contents[index],
              )),
    );
  }

  // 다이어리 삭제하는 메서드
  void _deleteDiary(int index) {
    setState(() {
      titles.removeAt(index);
      contents.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다이어리 앱'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(titles[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteDiary(index),
            ),
            onTap: () => _goToViewPage(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _goToAddPage,
      ),
    );
  }
}