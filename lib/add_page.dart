// 추가 페이지
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // 제목과 내용을 입력받을 컨트롤러
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  // 제목과 내용을 저장하고 메인 페이지로 돌아가는 메서드
  void _saveDiary() {
    // 제목과 내용을 맵으로 묶어서 결과로 전달
    Navigator.pop(context, {
      'title': titleController.text,
      'content': contentController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다이어리 추가'),
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
        onPressed: _saveDiary,
      ),
    );
  }
}