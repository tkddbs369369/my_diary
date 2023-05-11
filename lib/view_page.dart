// 열람 페이지
import 'package:flutter/material.dart';
import 'edit_page.dart';

class ViewPage extends StatefulWidget {
  // 메인 페이지에서 받아온 제목과 내용
  String title;
  String content;

   ViewPage({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  // 편집 페이지로 이동하는 메서드
  void _goToEditPage() async {
    // 결과를 받아올 수 있는 네비게이션
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditPage(
                title: widget.title,
                content: widget.content,
              )),
    );
    // 결과가 null이 아니면 상태 업데이트
    if (result != null) {
      setState(() {
        widget.title = result['title'];
        widget.content = result['content'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다이어리 열람'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _goToEditPage,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(widget.content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// flutter를 사용해서 나만의 다이어리 앱을 만들려고 해. 주요 기능은 추가, 편집, 삭제, 열람이야 화면계층은 다음과 같아 메인,추가,편집,열람 페이지가 따로따로 있어야하고 메인에서는 다이어리 제목을 리스트로 보여줘 사용자가 그 제목을 클릭하면 열람 페이지로 들어가고 제목/내용등을 볼 수 있어야해. 그리고 열람 페이지의 오른쪽 위에 편집 버튼이 있어서 그것을 누르면 편집 페이지로 넘어가. 편집페이지에서는 제목과 내용을 수정할 수 있어야해. 삭제 버튼은 제목 리스트 오른쪽에 있는데 누르면 해당하는 리스트를 삭제해야해. 추가는 가장 기본적인데 오른쪽 아래에 추가 버튼이 있어서 제목과 내용을 입력하면 자동으로 리스트에 추가해도록해야해