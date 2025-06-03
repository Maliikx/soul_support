import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class PaymentGetway extends StatefulWidget {
  final String paymentToken;

  const PaymentGetway({required this.paymentToken});

  @override
  State<PaymentGetway> createState() =>_PaymentGetway();
}

class _PaymentGetway extends State<PaymentGetway> {
  @override
  // Void initState() {
  //   super.initState();
  //   startPayment();
  // }

  InAppWebViewController? _webViewController;
  void startPayment() {
    _webViewController?.loadUrl(
        urlRequest: URLRequest(
            url: WebUri(
      'https://accept.paymob.com/api/acceptance/iframe/908571?payment_token${widget.paymentToken}',
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          javaScriptEnabled: true,
        )),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          startPayment();
        },
        onLoadStop: (controller, url) {
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters['success'] == 'true') {
            print("success");
          } else if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters['success'] == 'false') {
            print("failed");
          }
        },
      ),
    );
  }
}
