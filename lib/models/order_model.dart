class Order {
  final String orderId;
  final String customer;
  final String product;
  final int quantity;
  final double total;

  Order({
    required this.orderId,
    required this.customer,
    required this.product,
    required this.quantity,
    required this.total,
  });
}
