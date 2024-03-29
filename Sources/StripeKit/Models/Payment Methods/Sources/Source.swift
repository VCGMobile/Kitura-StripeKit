//
//  Source.swift
//  Stripe
//
//  Created by Anthony Castelli on 4/15/17.
//
//

import Foundation

/// The [Source Object](https://stripe.com/docs/api/sources/object).
public struct StripeSource: StripeModel {
    /// Unique identifier for the object.
    public var id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
    public var amount: Int?
    /// The client secret of the source. Used for client-side retrieval using a publishable key.
    public var clientSecret: String?
    /// Information related to the code verification flow. Present if the source is authenticated by a verification code (`flow` is `code_verification`).
    public var codeVerification: StripeSourceCodeVerification?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date?
    /// Three-letter ISO code for the currency associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
    public var currency: StripeCurrency?
    /// The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
    public var customer: String?
    /// The authentication flow of the source. flow is one of `redirect`, `receiver`, `code_verification`, `none`.
    public var flow: StripeSourceFlow?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public var livemode: Bool?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// Information about the owner of the payment instrument that may be used or required by particular source types.
    public var owner: StripeSourceOwner?
    /// Information related to the receiver flow. Present if the source is a receiver (`flow` is `receiver`).
    public var receiver: StripeSourceReceiver?
    /// Information related to the redirect flow. Present if the source is authenticated by a redirect (`flow` is `redirect`).
    public var redirect: StripeSourceRedirect?
    /// Extra information about a source. This will appear on your customer’s statement every time you charge the source.
    public var statementDescriptor: String?
    /// The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
    public var status: StripeSourceStatus?
    /// The type of the source. The type is a payment method, one of ach_credit_transfer, ach_debit, alipay, bancontact, card, card_present, eps, giropay, ideal, multibanco, p24, sepa_debit, sofort, three_d_secure, or wechat. An additional hash is included on the source with a name matching this value. It contains additional information specific to the payment method used.
    public var type: StripeSourceType?
    /// Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
    public var usage: StripeSourceUsage?
    
    public var achCreditTransfer: StripeSourceACHCreditTransfer?
    public var achDebit: StripeSourceACHDebit?
    public var alipay: StripeSourceAlipay?
    public var bancontact: StripeSourceBancontact?
    public var card: StripeSourceCard?
    public var cardPresent: StripeSourceCardPresent?
    public var eps: StripeSourceEPS?
    public var giropay: StripeSourceGiropay?
    public var ideal: StripeSourceIDEAL?
    public var multibanco: StripeSourceMultibanco?
    public var p24: StripeSourceP24?
    public var sepaDebit: StripeSourceSepaDebit?
    public var sofort: StripeSourceSofort?
    public var threeDSecure: StripeSourceThreeDSecure?
    public var wechat: StripeSourceWechat?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        object = try container.decode(String.self, forKey: .object)
        amount = try container.decodeIfPresent(Int.self, forKey: .amount)
        clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
        codeVerification = try container.decodeIfPresent(StripeSourceCodeVerification.self, forKey: .codeVerification)
        created = try container.decodeIfPresent(Date.self, forKey: .created)
        currency = try container.decodeIfPresent(StripeCurrency.self, forKey: .currency)
        flow = try container.decodeIfPresent(StripeSourceFlow.self, forKey: .flow)
        livemode = try container.decodeIfPresent(Bool.self, forKey: .livemode)
        metadata = try container.decode([String: String].self, forKey: .metadata)
        owner = try container.decodeIfPresent(StripeSourceOwner.self, forKey: .owner)
        receiver = try container.decodeIfPresent(StripeSourceReceiver.self, forKey: .receiver)
        redirect = try container.decodeIfPresent(StripeSourceRedirect.self, forKey: .redirect)
        statementDescriptor = try container.decodeIfPresent(String.self, forKey: .statementDescriptor)
        status = try container.decodeIfPresent(StripeSourceStatus.self, forKey: .status)
        usage = try container.decodeIfPresent(StripeSourceUsage.self, forKey: .usage)
        type = try container.decodeIfPresent(StripeSourceType.self, forKey: .type)
        
        if let sourceType = type {
            switch sourceType {
            case .achCreditTransfer:
                achCreditTransfer = try container.decodeIfPresent(StripeSourceACHCreditTransfer.self, forKey: .achCreditTransfer)
                
            case .achDebit:
                achDebit =  try container.decodeIfPresent(StripeSourceACHDebit.self, forKey: .achDebit)
                
            case .alipay:
                alipay = try container.decodeIfPresent(StripeSourceAlipay.self, forKey: .alipay)
                
            case .bancontact:
                bancontact = try container.decodeIfPresent(StripeSourceBancontact.self, forKey: .bancontact)
                
            case .card:
                card = try container.decodeIfPresent(StripeSourceCard.self, forKey: .card)
        
            case .cardPresent:
                cardPresent = try container.decodeIfPresent(StripeSourceCardPresent.self, forKey: .cardPresent)
                
            case .eps:
                eps = try container.decodeIfPresent(StripeSourceEPS.self, forKey: .eps)
                
            case .giropay:
                giropay = try container.decodeIfPresent(StripeSourceGiropay.self, forKey: .giropay)
                
            case .ideal:
                ideal = try container.decodeIfPresent(StripeSourceIDEAL.self, forKey: .ideal)
            
            case .multibanco:
                multibanco = try container.decodeIfPresent(StripeSourceMultibanco.self, forKey: .multibanco)
                
            case .p24:
                p24 = try container.decodeIfPresent(StripeSourceP24.self, forKey: .p24)
                
            case .sepaDebit:
                sepaDebit = try container.decodeIfPresent(StripeSourceSepaDebit.self, forKey: .sepaDebit)
                
            case .sofort:
                sofort = try container.decodeIfPresent(StripeSourceSofort.self, forKey: .sofort)
                
            case .threeDSecure:
                threeDSecure = try container.decodeIfPresent(StripeSourceThreeDSecure.self, forKey: .threeDSecure)
            
            case .wechat:
                wechat = try container.decodeIfPresent(StripeSourceWechat.self, forKey: .wechat)
            }
        }
    }
}

public struct StripeSourceCodeVerification: StripeModel {
    /// The number of attempts remaining to authenticate the source object with a verification code.
    public var attemptsRemaining: Int?
    /// The status of the code verification, either pending (awaiting verification, attempts_remaining should be greater than 0), succeeded (successful verification) or failed (failed verification, cannot be verified anymore as attempts_remaining should be 0).
    public var status: StripeSourceCodeVerificationStatus?
}

public enum StripeSourceCodeVerificationStatus: String, StripeModel {
    case pending
    case succeeded
    case failed
}

public enum StripeSourceFlow: String, StripeModel {
    case redirect
    case receiver
    case codeVerification = "code_verification"
    case none
}

public struct StripeSourceOwner: StripeModel {
    /// Owner’s address.
    public var address: StripeAddress?
    /// Owner’s email address.
    public var email: String?
    /// Owner’s full name.
    public var name: String?
    /// Owner’s phone number (including extension).
    public var phone: String?
    /// Verified owner’s address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedAddress: StripeAddress?
    /// Verified owner’s email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedEmail: String?
    /// Verified owner’s full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedName: String?
    /// Verified owner’s phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    public var verifiedPhone: String?
}

public struct StripeSourceReceiver: StripeModel {
    /// The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
    public var address: String?
    /// The total amount that was charged by you. The amount charged is expressed in the source’s currency.
    public var amountCharged: Int?
    /// The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` is true at all time. The amount received is expressed in the source’s currency.
    public var amountReceived: Int?
    /// The total amount that was returned to the customer. The amount returned is expressed in the source’s currency.
    public var amountReturned: Int?
    /// Type of refund attribute method, one of `email`, `manual`, or `none`.
    public var refundAttributesMethod: StripeSourceReceiverRefundAttributesMethod?
    /// Type of refund attribute status, one of `missing`, `requested`, or `available`.
    public var refundAttributesStatus: StripeSourceReceiverRefundAttributesStatus?
}

public enum StripeSourceReceiverRefundAttributesMethod: String, StripeModel {
    case email
    case manual
    case none
}

public enum StripeSourceReceiverRefundAttributesStatus: String, StripeModel {
    case missing
    case requested
    case available
}

public struct StripeSourceRedirect: StripeModel {
    /// The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.
    public var failureReason: StripeSourceRedirectFailureReason?
    /// The URL you provide to redirect the customer to after they authenticated their payment.
    public var returnUrl: String?
    /// The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).
    public var status: StripeSourceRedirectReason?
    /// The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.
    public var url: String?
}

public enum StripeSourceRedirectFailureReason: String, StripeModel {
    case userAbort = "user_abort"
    case declined
    case processingError = "processing_error"
    case failed
}

public enum StripeSourceRedirectReason: String, StripeModel {
    case pending
    case succeeded
    case notRequired = "not_required"
    case failed
}

public enum StripeSourceStatus: String, StripeModel {
    case canceled
    case chargeable
    case consumed
    case failed
    case pending
}

public enum StripeSourceType: String, StripeModel {
    case achCreditTransfer = "ach_credit_transfer"
    case achDebit = "ach_debit"
    case alipay
    case bancontact
    case card
    case cardPresent = "card_present"
    case eps
    case giropay
    case ideal
    case multibanco
    case p24
    case sepaDebit = "sepa_debit"
    case sofort
    case threeDSecure = "three_d_secure"
    case wechat
}

public enum StripeSourceUsage: String, StripeModel {
    case reusable
    case singleUse = "single_use"
}

// MARK: - Sources
public struct StripeSourceACHCreditTransfer: StripeModel {
    public var accountNumber: String?
    public var bankName: String?
    public var fingerprint: String?
    public var routingNumber: String?
    public var swiftCode: String?
}

public struct StripeSourceACHDebit: StripeModel {
    public var bankName: String?
    public var country: String?
    public var fingerprint: String?
    public var last4: String?
    public var routingNumber: String?
    public var type: String?
}

public struct StripeSourceAlipay: StripeModel {
    public var nativeUrl: String?
    public var statementDescriptor: String?
}

public struct StripeSourceBancontact: StripeModel {
    public var bankCode: String?
    public var bankName: String?
    public var bic: String?
    public var ibnLast4: String?
    public var preferredLanguage: String?
}

public struct StripeSourceCard: StripeModel {
    public var addressLine1Check: String?
    public var addressZipCheck: String?
    public var brand: StripeCardBrand?
    public var country: String?
    public var cvcCheck: String?
    public var dynamicLast4: String?
    public var expMonth: Int?
    public var expYear: Int?
    public var fingerprint: String?
    public var funding: StripeCardFundingType?
    public var last4: String?
    public var name: String?
    public var threeDSecure: String?
    public var tokenizationMethod: String?
}

public struct StripeSourceCardPresent: StripeModel {
    public var applicationCryptogram: String?
    public var applicationPreferredName: String?
    public var authorizationCode: String?
    public var authorizationResponseCode: String?
    public var brand: StripeCardBrand?
    public var country: String?
    public var cvmType: String?
    public var dataType: String?
    public var dedicatedFileName: String?
    public var emvAuthdata: String?
    public var evidenceCustomerSignature: String?
    public var evidenceTransactionCertificate: String?
    public var expMonth: Int?
    public var expyear: Int?
    public var fingerprint: String?
    public var funding: StripeCardFundingType?
    public var last4: String?
    public var posDeviceId: String?
    public var posEntryMode: String?
    public var readMethod: String?
    public var reader: String?
    public var terminalVerificationResults: String?
    public var transactionStatusInformation: String?
}

public struct StripeSourceEPS: StripeModel {
    // The Eps sources do not have any specific property today.
    // The only ones available in the spec are for private betas.
}

public struct StripeSourceGiropay: StripeModel {
    public var bankCode: String?
    public var bic: String?
    public var bankName: String?
}

public struct StripeSourceIDEAL: StripeModel {
    public var bank: String?
    public var bic: String?
    public var ibanLast4: String?
}

public struct StripeSourceMultibanco: StripeModel {
    public var entity: String?
    public var reference: String?
}

public struct StripeSourceP24: StripeModel {
    public var reference: String?
}

public struct StripeSourceSepaDebit: StripeModel {
    public var bankCode: String?
    public var branchCode: String?
    public var country: String?
    public var fingerprint: String?
    public var last4: String?
    public var mandateReference: String?
    public var mandateUrl: String?
}

public struct StripeSourceSofort: StripeModel {
    public var bankCode: String?
    public var bankName: String?
    public var bic: String?
    public var country: String?
    public var ibanLast4: String?
    public var verifiedName: String?
}

public struct StripeSourceThreeDSecure: StripeModel {
    public var addressLine1Check: String?
    public var addressZipCheck: String?
    public var authenticated: Bool?
    public var brand: StripeCardBrand?
    public var card: String?
    public var country: String?
    public var customer: String?
    public var cvcCheck: String?
    public var dynamicLast4: String?
    public var expMonth: Int?
    public var expYear: Int?
    public var fingerprint: String?
    public var funding: StripeCardFundingType?
    public var last4: String?
    public var threedSecure: StripeSourceThreeDSecureSupportStatus?
    public var tokenizationMethod: StripeCardTokenizedMethod?
}

public enum StripeSourceThreeDSecureSupportStatus: String, StripeModel {
    case notSupported = "not_supported"
    case required
    case recommended
    case optional
}

public struct StripeSourceWechat: StripeModel {
    // Stripe has no offocial documentation details
    /// https://stripe.com/docs/api/charges/object#charge_object-payment_method_details-wechat
}

public struct StripeSourcesList: StripeModel {
    public var object: String
    public var hasMore: Bool
    public var url: String?
    public var data: [StripePaymentSource]?
}

extension StripeSourcesList {
    public var bankAccounts: [StripeBankAccount]? {
        return data?.compactMap { $0.bankAccount }
    }
    
    public var cards: [StripeCard]? {
        return data?.compactMap { $0.card }
    }
    
    public var sources: [StripeSource]? {
        return data?.compactMap { $0.source }
    }
}
