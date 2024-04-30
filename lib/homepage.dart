import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  //DateTime? _selectDate();
  TimeOfDay? _selectedTime ;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  get selectedTime => null;

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
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                      labelText: 'Pick a Date',
                      filled: true,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      )),
                  readOnly: true,
                  onTap: () async {
                    _selectDate();
                  },
                ),
                SizedBox(height: 10),
                //time picker
                TextField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                      labelText: 'Pick a Date',
                      filled: true,
                      prefixIcon: Icon(
                        Icons.watch_later_outlined,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      )),
                  readOnly: true,
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _selectedTime = pickedTime;
                        _timeController.text = _selectedTime!.format(context); 
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(_picked);
      });
    }
  }
}
