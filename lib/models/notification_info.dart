class NotificationModel {
  static final items = [
    NotificationList(
        date: 'Feb 12, 2022', text: 'Your cab was blocked due to poor ratings')
  ];
}

class NotificationList {
  final String text;
  final String date;

  NotificationList({required this.date, required this.text});
}
