// 편집 페이지
import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  // 메인 페이지에서 받아온 제목과 내용
  final String title;
  final String content;

  const EditPage({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  // 제목과 내용을 입력받을 컨트롤러
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 컨트롤러에 메인 페이지에서 받아온 제목과 내용을 설정
    titleController.text = widget.title;
    contentController.text = widget.content;
  }

  // 제목과 내용을 수정하고 메인 페이지로 돌아가는 메서드
  void _editDiary() {
  // 제목과 내용을 맵으로 묶어서 결과로 전달
  Map<String, String> editedDiary = {
    'title': titleController.text,
    'content': contentController.text,
  };
  Navigator.pop(context, editedDiary);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다이어리 편집'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  labelText: '내용',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _editDiary,
      ),
    );
  }
}