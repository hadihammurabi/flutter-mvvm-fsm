import 'package:finitestatemachine/model/api/contact_api.dart';
import 'package:finitestatemachine/model/contact_model.dart';
import 'package:flutter/material.dart';

enum ContactViewState {
  none,
  loading,
  error,
}

class ContactViewModel with ChangeNotifier {
  final ContactAPI contactAPI = ContactAPI();

  ContactViewState _state = ContactViewState.none;
  ContactViewState get state => _state;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  changeState(ContactViewState s) {
    _state = s;
    notifyListeners();
  }

  getAllContacts() async {
    changeState(ContactViewState.loading);

    try {
      final c = await contactAPI.getAllContacts();
      _contacts = c;
      notifyListeners();
      changeState(ContactViewState.none);
    } catch (e) {
      changeState(ContactViewState.error);
    }
  }
}
