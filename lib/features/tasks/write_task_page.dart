import 'package:flutter/material.dart';

class WriteTaskPage extends StatelessWidget {
  const WriteTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write Task'),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: FilledButton(
            onPressed: () async {},
            child: const Text('Save'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Home"),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Description"),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: 5,
              minLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                const Text("Done"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
