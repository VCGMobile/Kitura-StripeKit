////
////  ChargeTests.swift
////  Stripe
////
////  Created by Anthony Castelli on 4/16/17.
////
////
//
//import XCTest
//@testable import Stripe
//@testable import Vapor
//// TODO: - Implement Review tests
//class ChargeTests: XCTestCase {
//    var decoder: JSONDecoder!
//    
//    override func setUp() {
//        decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .secondsSince1970
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//    }
//    
//    let chargeString = """
//{
//  "id": "ch_1BrbM42eZvKYlo2CIu7qiNPF",
//  "object": "charge",
//  "amount": 999,
//  "amount_refunded": 0,
//  "application": "oops",
//  "application_fee": "fee_something",
//  "application_fee_amount": 300,
//  "balance_transaction": "txn_19XJJ02eZvKYlo2ClwuJ1rbA",
//  "billing_details": {
//    "address": {
//      "city": null,
//      "country": null,
//      "line1": null,
//      "line2": null,
//      "postal_code": "12345",
//      "state": null
//    },
//    "email": "a@b.com",
//    "name": null,
//    "phone": null
//  },
//  "captured": false,
//  "created": 1517704056,
//  "currency": "usd",
//  "customer": "cus_A2FVP45tySz01V",
//  "description": null,
//  "destination": null,
//  "dispute": null,
//  "failure_code": "expired_card",
//  "failure_message": "Your card has expired.",
//  "fraud_details": {
//  },
//  "invoice": "in_1BqUzH2eZvKYlo2CV8BYZkYX",
//  "livemode": false,
//  "metadata": {
//  },
//  "on_behalf_of": "some account",
//  "order": "order number",
//  "outcome": {
//    "network_status": "declined_by_network",
//    "reason": "expired_card",
//    "risk_level": "not_assessed",
//    "seller_message": "The bank returned the decline code `expired_card`.",
//    "type": "issuer_declined"
//  },
//  "paid": false,
//  "payment_intent": "bop",
//  "receipt_email": "a@b.com",
//  "receipt_number": "some number",
//  "refunded": false,
//  "refunds": {
//        "data": [],
//        "total_count": 1,
//        "has_more": false,
//        "object": "list",
//        "url": "/v1/charges/ch_1CatgjJrybuur7n4xgpcPVuL/refunds"
//},
//  "review": "prv_123456",
//  "shipping": null,
//  "source": null,
//  "source_transfer": "sickness",
//  "statement_descriptor": "for a shirt",
//  "status": "failed",
//  "transfer_group": "group a",
//  "transfer_data": {
//     "amount": 45,
//     "destination": "acc_123"
//   }
//}
//"""
//    
//    func testChargeParsedProperly() throws {
//        do {
//            let body = HTTPBody(string: chargeString)
//            var headers: HTTPHeaders = [:]
//            headers.replaceOrAdd(name: .contentType, value: MediaType.json.description)
//            let request = HTTPRequest(headers: headers, body: body)
//            let charge = try decoder.decode(StripeCharge.self, from: request, maxSize: 65_536, on: EmbeddedEventLoop()).wait()
//            
//            XCTAssertEqual(charge.id, "ch_1BrbM42eZvKYlo2CIu7qiNPF")
//            XCTAssertEqual(charge.object, "charge")
//            XCTAssertEqual(charge.amount, 999)
//            XCTAssertEqual(charge.amountRefunded, 0)
//            XCTAssertEqual(charge.application, "oops")
//            XCTAssertEqual(charge.applicationFee, "fee_something")
//            XCTAssertEqual(charge.applicationFeeAmount, 300)
//            XCTAssertEqual(charge.balanceTransaction, "txn_19XJJ02eZvKYlo2ClwuJ1rbA")
//            XCTAssertEqual(charge.billingDetails?.address?.postalCode, "12345")
//            XCTAssertEqual(charge.billingDetails?.email, "a@b.com")
//            XCTAssertEqual(charge.captured, false)
//            XCTAssertEqual(charge.created, Date(timeIntervalSince1970: 1517704056))
//            XCTAssertEqual(charge.currency, .usd)
//            XCTAssertEqual(charge.customer, "cus_A2FVP45tySz01V")
//            XCTAssertEqual(charge.failureCode, "expired_card")
//            XCTAssertEqual(charge.failureMessage, "Your card has expired.")
//            XCTAssertEqual(charge.invoice, "in_1BqUzH2eZvKYlo2CV8BYZkYX")
//            XCTAssertEqual(charge.livemode, false)
//            XCTAssertEqual(charge.onBehalfOf, "some account")
//            XCTAssertEqual(charge.order, "order number")
//            
//            // Outcome
//            XCTAssertEqual(charge.outcome?.networkStatus, .declinedByNetwork)
//            XCTAssertEqual(charge.outcome?.reason, "expired_card")
//            XCTAssertEqual(charge.outcome?.riskLevel, .notAssessed)
//            XCTAssertEqual(charge.outcome?.sellerMessage, "The bank returned the decline code `expired_card`.")
//            XCTAssertEqual(charge.outcome?.type, .issuerDeclined)
//            
//            XCTAssertEqual(charge.paid, false)
//            XCTAssertEqual(charge.paymentIntent, "bop")
//            XCTAssertEqual(charge.receiptEmail, "a@b.com")
//            XCTAssertEqual(charge.receiptNumber, "some number")
//            XCTAssertEqual(charge.refunded, false)
//            XCTAssertEqual(charge.review, "prv_123456")
//            XCTAssertEqual(charge.sourceTransfer, "sickness")
//            XCTAssertEqual(charge.statementDescriptor, "for a shirt")
//            XCTAssertEqual(charge.status, .failed)
//            XCTAssertEqual(charge.transferGroup, "group a")
//            XCTAssertEqual(charge.transferData?.amount, 45)
//            XCTAssertEqual(charge.transferData?.destination, "acc_123")
//        }
//        catch {
//            XCTFail("\(error)")
//        }
//    }
//}
