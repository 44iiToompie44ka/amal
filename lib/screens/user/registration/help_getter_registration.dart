import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: HelpGetterRegistration(),
  ));
}

class HelpGetterRegistration extends StatefulWidget {
  @override
  _HelpGetterRegistrationState createState() => _HelpGetterRegistrationState();
}

class _HelpGetterRegistrationState extends State<HelpGetterRegistration> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Add this line

  final _nameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _childrenCountController = TextEditingController();
  final _ageController = TextEditingController();
  final _descController = TextEditingController();
  File? _image;

  String _selectedType = 'Продуктовая корзина';
  String _selectedType1 = '';

  List<String> raisingType = [
    'Продуктовая корзина',
    'Одежда',
    'Лекарства',
    'Сбор в школу',
    'Тепло (Уголь для отопления)'
  ];
  List<String> status = ['', 'Пенсионер', 'Мать одиночка', 'Инвалид'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Заявка Благополучателя"),
        centerTitle: false,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildPage1(),
          _buildPage2(),
          _buildPage3(),
          _buildPage4(),
          _buildPage5(),
          _buildPage6(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                  setState(() {
                    _currentPage--;
                  });
                }
              },
              icon: Icon(Icons.arrow_back),
            ),
            Text('Page ${_currentPage + 1} of 6'),
            IconButton(
              onPressed: () {
                if (_currentPage < 5) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                  setState(() {
                    _currentPage++;
                  });
                } else {
                  // Handle submission on the last page
                  _submitForm();
                }
              },
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  // ... (previous code)

Widget _buildPage1() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: _selectedType1,
          onChanged: (newValue) {
            setState(() {
              _selectedType1 = newValue!;
            });
          },
          items: status.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(labelText: 'Статус'),
        ),
        if (_selectedType1 == 'Пенсионер')
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(labelText: 'Описание'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
          ),
        if (_selectedType1 == 'Инвалид')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fatherNameController,
                decoration: const InputDecoration(labelText: 'Отчество'),
                validator: (value) {
                  // Validation logic here
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
                items: raisingType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Тип'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a raising type!';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          ),
        if (_selectedType1 == 'Мать одиночка')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: 'Фамилия'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the surname';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Описание'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
                items: raisingType.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Тип'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a raising type!';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _getImage,
                child: const Text('Прикрепите фотографию семьи'),
              ),
            ],
          ),
      ],
    ),
  );
}

// ... (remaining code)


  Widget _buildPage2() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:DropdownButtonFormField<String>(
        value: _selectedType1,
        onChanged: (newValue) {
          setState(() {
            _selectedType1 = newValue!;
          });
        },
        items: status.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(labelText: 'Статус'),
      ),
      /* DropdownButtonFormField<String>(
        value: _selectedType,
        onChanged: (newValue) {
          setState(() {
            _selectedType = newValue!;
          });
        },
        items: raisingType.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(labelText: 'Тип'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Пожалуйста, выберите потребность!';
          }
          return null;
        },
      ),*/
    );
  }

  Widget _buildPage3() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        value: _selectedType1,
        onChanged: (newValue) {
          setState(() {
            _selectedType1 = newValue!;
          });
        },
        items: status.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(labelText: 'Статус'),
      ),
    );
  }

  Widget _buildPage4() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(labelText: 'Имя'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the name';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPage5() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: _childrenCountController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(labelText: 'Количество детей'),
        validator: (value) {
          // Validation logic here
          return null;
        },
      ),
    );
  }

  Widget _buildPage6() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _ageController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Возраст'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descController,
            decoration: const InputDecoration(labelText: 'Описание'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please describe your situation';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // All form fields are valid, proceed with form submission
      // Your submission logic here

      // Show a success message or navigate to the next screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form submitted successfully!'),
        ),
      );
    }
  }
}
