//
//  Invoice.swift
//  Stripe
//
//  Created by Anthony Castelli on 9/4/17.
//
//

import Foundation

/// The [Invoice Object](https://stripe.com/docs/api/invoices/object).
public struct StripeInvoice: StripeModel {
    /// Unique identifier for the object.
    public var id: String?
    /// String representing the object’s type. Objects of the same type share the same value.
    public var object: String
    /// The country of the business associated with this invoice, most often the business creating the invoice.
    public var accountCountry: String?
    /// The public name of the business associated with this invoice, most often the business creating the invoice.
    public var accountName: String?
    /// Final amount due at this time for this invoice. If the invoice’s total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
    public var amountDue: Int?
    /// The amount, in cents, that was paid.
    public var amountPaid: Int?
    /// The amount remaining, in cents, that is due.
    public var amountRemanining: Int?
    /// The fee in cents that will be applied to the invoice and transferred to the application owner’s Stripe account when the invoice is paid.
    public var applicationFee: Int?
    /// Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.
    public var attemptCount: Int?
    /// Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
    public var attempted: Bool?
    ///Controls whether Stripe will perform automatic collection of the invoice. When false, the invoice’s state will not automatically advance without an explicit action.
    public var autoAdvance: Bool?
    /// Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.
    public var billing: StripeInvoiceBiling?
    /// Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.
    public var billingReason: StripeInvoiceBillingReason?
    /// ID of the latest charge generated for this invoice, if any.
    public var charge: String?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public var created: Date?
    /// Three-letter ISO currency code, in lowercase. Must be a supported currency.
    public var currency: StripeCurrency?
    /// Custom fields displayed on the invoice.
    public var customFields: [[String: String]]?
    public var customer: String?
    /// The customer’s address. Until the invoice is finalized, this field will equal customer.address. Once the invoice is finalized, this field will no longer be updated.
    public var customerAddress: StripeAddress?
    /// The customer’s email. Until the invoice is finalized, this field will equal customer.email. Once the invoice is finalized, this field will no longer be updated.
    public var customerEmail: String?
    /// The customer’s name. Until the invoice is finalized, this field will equal customer.name. Once the invoice is finalized, this field will no longer be updated.
    public var customerName: String?
    /// The customer’s phone number. Until the invoice is finalized, this field will equal customer.phone. Once the invoice is finalized, this field will no longer be updated.
    public var customerPhone: String?
    /// The customer’s shipping information. Until the invoice is finalized, this field will equal customer.shipping. Once the invoice is finalized, this field will no longer be updated.
    public var customerShipping: StripeShippingLabel?
    /// The customer’s tax exempt status. Until the invoice is finalized, this field will equal customer.tax_exempt. Once the invoice is finalized, this field will no longer be updated.
    public var customerTaxExempt: String?
    /// The customer’s tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as customer.tax_ids. Once the invoice is finalized, this field will no longer be updated.
    public var customerTaxIds: [StripeInvoiceCustomerTaxId]?
    /// ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription’s default payment method, if any, or to the default payment method in the customer’s invoice settings.
    public var defaultPaymentMethod: String?
    /// ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription’s default source, if any, or to the customer’s default source.
    public var defaultSource: String?
    /// The tax rates applied to this invoice, if any.
    public var defaultTaxRates: [StripeTaxRate]?
    /// An arbitrary string attached to the object. Often useful for displaying to users. Referenced as ‘memo’ in the Dashboard.
    public var description: String?
    public var discount: StripeDiscount?
    /// The date on which payment for this invoice is due. This value will be `null` for invoices where `billing=charge_automatically`.
    public var dueDate: Date?
    /// Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.
    public var endingBalance: Int?
    /// Footer displayed on the invoice.
    public var footer: String?
    /// The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.
    public var hostedInvoiceUrl: String?
    /// The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.
    public var invoicePdf: String?
    /// The individual line items that make up the invoice. lines is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
    public var lines: StripeInvoiceLineItemList?
    /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    public var livemode: Bool?
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public var metadata: [String: String]?
    /// The time at which payment will next be attempted. This value will be `null` for invoices where `billing=send_invoice`.
    public var nextPaymentAttempt: Date?
    /// A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer’s unique invoice_prefix if it is specified.
    public var number: String?
    /// Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer’s account balance.
    public var paid: Bool?
    /// The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.
    public var paymentIntent: String?
    /// End of the usage period during which invoice items were added to this invoice.
    public var periodEnd: Date?
    /// Start of the usage period during which invoice items were added to this invoice.
    public var periodStart: Date?
    /// Total amount of all post-payment credit notes issued for this invoice.
    public var postPaymentCreditNotesAmount: Int?
    /// Total amount of all pre-payment credit notes issued for this invoice.
    public var prePaymentCreditNotesAmount: Int?
    /// This is the transaction number that appears on email receipts sent for this invoice.
    public var receiptNumber: String?
    /// Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.
    public var startingBalance: Int?
    /// Extra information about an invoice for the customer’s credit card statement.
    public var statementDescriptor: String?
    /// The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
    public var status: StripeInvoiceStatus?
    public var statusTransitions: StripeInvoiceStatusTransitions?
    /// The subscription that this invoice was prepared for, if any.
    public var subscription: String?
    /// Only set for upcoming invoices that preview prorations. The time used to calculate prorations.
    public var subscriptionProrationDate: Int?
    /// Total of all subscriptions, invoice items, and prorations on the invoice before any discount is applied.
    public var subtotal: Int?
    /// The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
    public var tax: Int?
    /// If `billing_reason` is set to `subscription_threshold` this returns more information on which threshold rules triggered the invoice.
    public var thresholdReason: StripeInvoiceThresholdReason?
    /// Total after discount.
    public var total: Int?
    /// The aggregate amounts calculated per tax rate for all line items.
    public var totalTaxAmounts: [StripeInvoiceTotalTaxAmount]?
    /// The time at which webhooks for this invoice were successfully delivered (if the invoice had no webhooks to deliver, this will match `created`). Invoice payment is delayed until webhooks are delivered, or until all webhook delivery attempts have been exhausted.
    public var webhooksDeliveredAt: Date?
}

public enum StripeInvoiceBiling: String, StripeModel {
    case chargeAutomatically = "charge_automatically"
    case sendInvoice = "send_invoice"
}

public enum StripeInvoiceBillingReason: String, StripeModel {
    case subscriptionCycle = "subscription_cycle"
    case subscriptionCreate = "subscription_create"
    case subscriptionUpdate = "subscription_update"
    case subscription
    case manual
    case upcoming
    case subscriptionThreshold = "subscription_threshold"
}

public struct StripeInvoiceCustomerTaxId: StripeModel {
    /// The type of the tax ID, one of eu_vat, nz_gst, au_abn, or unknown
    public var type: StripeTaxIDType?
    /// The value of the tax ID.
    public var value: String?
}

public enum StripeInvoiceStatus: String, StripeModel {
    case draft
    case open
    case paid
    case uncollectible
    case void
}

public struct StripeInvoiceStatusTransitions: StripeModel {
    /// The time that the invoice draft was finalized.
    public var finalizedAt: Date?
    /// The time that the invoice was marked uncollectible.
    public var markedUncollectableAt: Date?
    /// The time that the invoice was paid.
    public var paidAt: Date?
    /// The time that the invoice was voided.
    public var voidedAt: Date?
}

public struct StripeInvoiceThresholdReason: StripeModel {
    /// The total invoice amount threshold boundary if it triggered the threshold invoice.
    public var amountGte: Int?
    /// Indicates which line items triggered a threshold invoice.
    public var itemReasons: [StripeInvoiceThresholdReasonItemReason]?
}

public struct StripeInvoiceThresholdReasonItemReason: StripeModel {
    /// The IDs of the line items that triggered the threshold invoice.
    public var lineItemIds: [String]?
    /// The quantity threshold boundary that applied to the given line item.
    public var usageGte: Int?
}

public struct StripeInvoiceTotalTaxAmount: StripeModel {
    /// The amount, in cents, of the tax.
    public var amount: Int?
    /// Whether this tax amount is inclusive or exclusive.
    public var inclusive: Bool?
    /// The tax rate that was applied to get this tax amount.
    public var taxRate: String?
}

public struct StripeInvoiceList: StripeModel {
    public var object: String
    public var hasMore: Bool
    public var url: String?
    public var data: [StripeInvoice]?
}
