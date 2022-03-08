import 'package:finitestatemachine/model/api/contact_api.dart';
import 'package:finitestatemachine/model/contact_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'contact_api_test.mocks.dart';

// void main() {
//   group('ContactAPI', () {
//     ContactAPI contactAPI = ContactAPI();
//     test('get all contacts returns data', () async {
//       var contacts = await contactAPI.getAllContacts();
//       expect(contacts.isNotEmpty, true);
//     });
//   });
// }

@GenerateMocks([ContactAPI])
void main() {
  group('ContactAPI', () {
    ContactAPI contactAPI = MockContactAPI();

    test('get all contacts returns data', () async {
      when(contactAPI.getAllContacts()).thenAnswer(
        (_) async => <Contact>[
          Contact(id: 1, name: 'a', phone: '0'),
        ],
      );
      var contacts = await contactAPI.getAllContacts();
      expect(contacts.isNotEmpty, true);
    });
  });
}
