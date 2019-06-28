//
//  EphemeralKey.swift
//  Stripe
//
//  Created by Andrew Edwards on 10/17/17.
//

import Foundation

public struct StripeEphemeralKey: StripeModel {
    public var id: String
    public var object: String
    public var associatedObjects: [[String : String]]?
    public var created: Date?
    public var expires: Date?
    public var livemode: Bool?
    public var secret: String?
}
