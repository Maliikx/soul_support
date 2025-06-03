import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart';

class PaymobManager {
  dio.Dio dioClient = dio.Dio();

  Future<String> paywithPaymob(int amount) async {
    try {
      String token = await getToken();
      int orderId = await getorderId(token: token, amount: (100 * amount).toString());
      String paymentKey = await getPaymentKey(
        token: token,
        orderId: orderId.toString(),
        amount: (100 * amount).toString(),
      );
      return paymentKey;
    } catch (e) {
      print("Paymob error: $e");
      rethrow;
    }
  }

  Future<String> getToken() async {
    try {
      dio.Response response = await dioClient.post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {
          "api_key": "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBek1Ua3pNaXdpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS56eFppUVBnT21MM1hsM1h6UHFEYmU2RTNkaVNLaUNfa2FBaXc0MjdQOG55Wnl3c2tjSlRjUVNIQU15RGZfTFNoZ2FYb3FIS0hvWjBlSUFDTS1KR0k1UQ=="
        },
      );
      return response.data['token'];
    } catch (e) {
      print("getToken error: $e");
      rethrow;
    }
  }

  Future<int> getorderId({required String token, required String amount}) async {
    try {
      dio.Response response = await dioClient.post(
        'https://accept.paymob.com/api/ecommerce/orders',
        data: {
          "auth_token": token,
          "delivery_needed": "true",
          "amount_cents": amount,
          "currency": "EGP",
          "items": []
        },
      );
      return response.data['id'];
    } catch (e) {
      print("getOrderId error: $e");
      rethrow;
    }
  }

  Future<String> getPaymentKey({
    required String token,
    required String orderId,
    required String amount,
  }) async {
    try {
      dio.Response response = await dioClient.post(
        'https://accept.paymob.com/api/acceptance/payment_keys',
        data: {
          "auth_token": token,
          "amount_cents": amount,
          "currency": "EGP",
          "integration_id": 5020546,
          "lock_order_when_paid": "false",
          "order_id": orderId,
          "billing_data": {
            "apartment": "NA",
            "email": "johndoe@example.com",
            "floor": "3",
            "first_name": "John",
            "street": "123 Street",
            "building": "5A",
            "phone_number": "+201000000000",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "Cairo",
            "country": "NA",
            "last_name": "Doe",
            "state": "NA"
          },
        },
      );
      return response.data['token'];
    } catch (e) {
      print("getPaymentKey error: $e");
      rethrow;
    }
  }
}
