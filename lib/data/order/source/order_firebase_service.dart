import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_app/data/order/models/add_to_cart_req.dart';
import 'package:store_app/data/order/models/order_registration_req.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProducts();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReq orderRegistrationReq);
  Future<Either> getOrders();
}

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Cart').add(
            addToCartReq.toMap(),
          );
      return const Right('Add to cart successfully');
    } catch (e) {
      return const Left('Add to cart failed');
    }
  }

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Cart').get();
      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return const Left('Get cart products failed');
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Cart').doc(id).delete();
      return const Right('Remove cart product successfully');
    } catch (e) {
      return const Left('Remove cart product failed');
    }
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Orders').add(order.toMap());

      for (var item in order.products) {
        await FirebaseFirestore.instance.collection('Users').doc(user.uid).collection('Cart').doc(item.id).delete();
      }

      return const Right('Order registred successfully');
    } catch (e) {
      return const Left('Order registration failed');
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).collection('Orders').get();
      return Right(returnedData.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      return const Left('Get orders failed');
    }
  }
}
