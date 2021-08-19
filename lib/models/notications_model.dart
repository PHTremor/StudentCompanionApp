class CustomNotification {
  String imageUrl;
  String title;
  String publisher;
  String description;

  CustomNotification({
    this.imageUrl,
    this.title,
    this.publisher,
    this.description,
  });
}

List<CustomNotification> notifications = [
  CustomNotification(
    imageUrl: 'assets/images/event1.jpg',
    title: 'Welcome Notification 1',
    publisher: 'The University Registrar',
    description:
        'This is the welcome notification example in the app powered by Dart and flutter',
  ),
  CustomNotification(
    imageUrl: 'assets/images/event1.jpg',
    title: 'Welcome to Mzuzu University',
    publisher: 'Student Comp App',
    description:
        'This is the welcome notification example in the app powered by Dart and flutter',
  ),
  CustomNotification(
    imageUrl: 'assets/images/event1.jpg',
    title: 'Welcome to Mzuzu Nofications',
    publisher: 'MUSREC',
    description:
        'This is the welcome notification example in the app powered by Dart and flutter',
  ),
];
