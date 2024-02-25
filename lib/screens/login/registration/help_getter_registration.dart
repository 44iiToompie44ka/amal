import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HelpGetterRegistration extends StatefulWidget {
  @override
  _HelpGetterRegistrationState createState() => _HelpGetterRegistrationState();
}

class _HelpGetterRegistrationState extends State<HelpGetterRegistration> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _childrenCountController = TextEditingController();
  final _ageController = TextEditingController();
  final _descController = TextEditingController();
  File? _image;

  String _selectedType = 'Продуктовая корзина';
  String _selectedType1 = 'Пенсионер';

List<String> raisingType = [
  'Продуктовая корзина',
  'Одежда',
  'Лекарства',
  'Сбор в школу',
  'Тепло (Уголь для отопления)'
];
  List<String> status = ['Пенсионер', 'Мать одиночка', 'Инвалид'];

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      String imageUrl = await uploadImage();
      try {
        await FirebaseFirestore.instance.collection('helpgetters').add({
          'raisingfor': _selectedType,
          'status': _selectedType1,
          'name': _nameController.text,
          'fathername': _fatherNameController.text,
          'surname': _surnameController.text,
          'childrenCount': int.parse(_childrenCountController.text),
          'age': int.parse(_ageController.text),
          'desc': _descController.text,
          'image': imageUrl,
        });

        _selectedType = '';
        _selectedType1 = '';
        _nameController.clear();
        _fatherNameController.clear();
        _surnameController.clear();
        _childrenCountController.clear();
        _ageController.clear();
        _descController.clear();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Заявка успешно подана!'),
          ),
        );
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка: $e'),
          ),
        );
      }
    }
  }

  Future<String> uploadImage() async {
    if (_image == null) {
      return '';
    }

    try {
      String imageName =
          '${DateTime.now().millisecondsSinceEpoch}.png'; // Use a unique name for the image
      Reference storageReference =
          FirebaseStorage.instance.ref().child(imageName);
      await storageReference.putFile(_image!);
      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Ошибка загрузки изображения: $e');
      return '';
    }
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Заявка благополучителя'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: _getImage,
                child: const Text('Выбрать изображение'),
              ),
              _image != null
                  ? Image.file(
                      _image!,
                      height: 100,
                      width: 100,
                    )
                  : const SizedBox.shrink(),
              // Type Dropdown
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
                    return 'Пожалуйста, выберите потребность!';
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
                controller: _fatherNameController,
                decoration: const InputDecoration(labelText: 'Отчество'),
                validator: (value) {
                  // Validation logic here
                  return null;
                },
              ),
              TextFormField(
                controller: _surnameController,
                decoration: const InputDecoration(labelText: 'Фамилия'),
                validator: (value) {
                  // Validation logic here
                  return null;
                },
              ),
              TextFormField(
                controller: _childrenCountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Количество детей'),
                validator: (value) {
                  // Validation logic here
                  return null;
                },
              ),
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Оставить заявку'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
