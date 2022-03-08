import 'package:dio/dio.dart';
import 'package:finitestatemachine/model/contact_model.dart';

class ContactAPI {
  Future<List<Contact>> getAllContacts() async {
    final response = await Dio(BaseOptions(connectTimeout: 3000)).get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
    List<Contact> contacts = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
        .toList();
    return contacts;
  }
}
