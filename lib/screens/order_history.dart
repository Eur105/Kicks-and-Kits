import 'package:flutter/material.dart';
import 'order_details.dart';
import 'track_orders.dart';

// Enum for order status
enum OrderStatus { all, pending, shipped, delivered, canceled }

// Dummy order data
class Order {
  final String id;
  final String productName;
  final String productImage;
  final String date;
  final double price;
  final OrderStatus status;

  Order({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.date,
    required this.price,
    required this.status,
  });

  // Get current step for tracking
  int get currentStep {
    switch (status) {
      case OrderStatus.pending:
        return 0;
      case OrderStatus.shipped:
        return 1;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.canceled:
        return -1;
      default:
        return 0;
    }
  }
}

// Sample data
List<Order> orders = [
  Order(
    id: 'ORD123',
    productName: 'Manchester United Home Kit',
    productImage: 'assets/manu_home.png',
    date: 'March 15, 2025',
    price: 89.99,
    status: OrderStatus.pending,
  ),
  Order(
    id: 'ORD124',
    productName: 'Real Madrid Away Kit',
    productImage: 'assets/real_away.png',
    date: 'March 12, 2025',
    price: 79.99,
    status: OrderStatus.shipped,
  ),
  Order(
    id: 'ORD125',
    productName: 'Barcelona Third Kit',
    productImage: 'assets/barca_third.png',
    date: 'March 10, 2025',
    price: 84.99,
    status: OrderStatus.delivered,
  ),
  Order(
    id: 'ORD126',
    productName: 'Juventus Home Kit',
    productImage: 'assets/juve_home.png',
    date: 'March 5, 2025',
    price: 85.99,
    status: OrderStatus.canceled,
  ),
];

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text(
            'Order History',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Pending'),
              Tab(text: 'Shipped'),
              Tab(text: 'Delivered'),
              Tab(text: 'Canceled'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            OrderList(OrderStatus.all),
            OrderList(OrderStatus.pending),
            OrderList(OrderStatus.shipped),
            OrderList(OrderStatus.delivered),
            OrderList(OrderStatus.canceled),
          ],
        ),
      ),
    );
  }
}

// Order List Widget
class OrderList extends StatelessWidget {
  final OrderStatus status;
  OrderList(this.status);

  @override
  Widget build(BuildContext context) {
    List<Order> filteredOrders =
        orders
            .where(
              (order) => status == OrderStatus.all || order.status == status,
            )
            .toList();

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: filteredOrders[index]);
      },
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.productName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Order ID: ${order.id}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Date: ${order.date}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${order.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      order.productImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (order.status == OrderStatus.pending ||
                      order.status == OrderStatus.shipped)
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TrackOrderScreen(
                                  orderId: order.id,
                                  currentStep: order.currentStep,
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Track Order",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
