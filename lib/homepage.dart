import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  DateTime? _selectedDate ;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title input

                Form(
                  key: UniqueKey(),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _titleController,
                        maxLength: 12,
                        decoration: InputDecoration(
                          labelText: 'Enter Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Description Box
                Form(
                  key: UniqueKey(),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _descriptionController,
                        maxLength: 32,
                        decoration: InputDecoration(
                          labelText: 'Enter Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //date picker
                Form(
                  key: _formKey,
                  child: TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                        labelText: 'Pick a Date',
                        filled: true,
                        prefixIcon: Icon(
                          Icons.calendar_today,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        )),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (_picked != null ) {
      setState(() {
        _dateController.text =  _picked.toString().split("")[0];
      });
    }
  }
}
