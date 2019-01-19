//
//  NetworkAPI.swift
//  FVEC
//
//  Created by Enrique Canedo on 5/3/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import Alamofire
import BaseRxApplication
import ObjectMapper

enum NetworkAPI {
    
    case login(BaseEntity)
    case forgot(BaseEntity)
    case user
    case register(BaseEntity)
    case updateUser(BaseEntity)
    case removeUser(BaseEntity)
    case products(Int)
    case checkPostalCode(String)
    case sendEmail(BaseEntity)
    case cart
    case addProduct(BaseEntity)
    case updateProduct(String, BaseEntity)
    case removeProduct(String, BaseEntity)
    case address
    case addAddress(BaseEntity)
    case updateAddress(String, BaseEntity)
    case removeAddress(String)
    case orders
    case order(String)
    case orderItems(String)
    case orderAddress(String)
    case removeOrder(BaseEntity)
    case cartAction(BaseEntity)
    case rate(String, BaseEntity)
    case issue(String, BaseEntity)
    case creditCards
    case removeCreditCard(String)
    case paymentMethod
    case paymentMethods
    case setPaymentMethod(BaseEntity)
    case shipping
    case setShippingMethod(BaseEntity)
    case shippingAddress
    case setShippingAddress(BaseEntity)
    case billingAddress
    case setBillingAddress(BaseEntity)
    case reward
    case promotions
    case privacy
    case conditions
    case policy
    case updateCoupon(BaseEntity)
    case orderCoupon
    case slots(String)
    case setSlot(BaseEntity)
    case setObservation(BaseEntity)
    case observation
    case device(BaseEntity)
    case updateNotification(BaseEntity)
    case notification(BaseEntity)
    case sendInvoice(BaseEntity)
    case updateInvoice(BaseEntity)
    case invoice(BaseEntity)
    case setAbsentHome(BaseEntity)
    case setElevator(BaseEntity)
}

extension NetworkAPI: API {
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseUrl: String {
        #if RELEASE
        return "https://fontvellaencasa.es/api/rest/"
        #else
        return "https://fontvella.theetailers.net/api/rest/"
        #endif
    }
    
    var path: String {
        switch self {
        case .privacy:
            return "x/cms/pages/aviso-legal"
        case .conditions:
            return "x/cms/pages/condiciones-de-contratacion"
        case .policy:
            return "x/cms/pages/privacidad-y-cookies"
        case .login, .forgot:
            return "x/customer/tokens"
        case .user, .updateUser:
            return "customers/me"
        case .removeUser, .updateNotification, .notification, .sendInvoice, .updateInvoice, .invoice:
            return "x/customers/me/actions"
        case .register:
            return "x/customer/register"
        case .products(let category):
            return "x/products" + (category == 0 ? "" : "?category_id=\(category)")
        case .checkPostalCode(let pc):
            return "x/postcodes/\(pc)"
        case .sendEmail:
            return "x/notifications"
        case .cart, .addProduct:
            return "x/carts/mine/items"
        case .updateProduct(let itemId, _), .removeProduct(let itemId, _):
            return "x/carts/mine/items/\(itemId)"
        case .address, .addAddress:
            return "customers/me/addresses"
        case .updateAddress(let itemId, _), .removeAddress(let itemId):
            return "customers/addresses/\(itemId)"
        case .orders:
            return "orders"
        case .order(let itemId):
            return "orders/\(itemId)"
        case .orderItems(let orderId):
            return "orders/\(orderId)/items"
        case .orderAddress(let orderId):
            return "orders/\(orderId)/addresses"
        case .cartAction, .removeOrder:
            return "x/carts/mine/actions"
        case .rate(let itemId, _):
            return "x/orders/\(itemId)/rating"
        case .issue(let itemId, _):
            return "x/orders/\(itemId)/issue"
        case .creditCards:
            return "x/customers/me/credit-cards"
        case .removeCreditCard(let cardId):
            return "x/customers/me/credit-cards/\(cardId)"
        case .paymentMethods:
            return "x/carts/mine/payment-methods"
        case .setPaymentMethod, .paymentMethod:
            return "x/carts/mine/payment-method"
        case .shipping:
            return "x/carts/mine/shipping-methods"
        case .setShippingMethod:
            return "x/carts/mine/shipping-method"
        case .shippingAddress, .setShippingAddress:
            return "x/carts/mine/addresses/shipping"
        case .billingAddress, .setBillingAddress:
            return "x/carts/mine/addresses/billing"
        case .reward:
            return "x/customers/me/reward-points"
        case .promotions:
            return "x/promotions"
        case .updateCoupon, .orderCoupon:
            return "x/carts/mine/coupon"
        case .slots(let date):
            return "x/carts/mine/slots/\(date)"
        case .setSlot:
            return "x/carts/mine/slot"
        case .setObservation, .observation:
            return "x/carts/mine/meta/customer_note"
        case .device:
            return "x/customers/me/devices"
        case .setAbsentHome:
            return "x/carts/mine/meta/absent_home"
        case .setElevator:
            return "x/carts/mine/meta/elevator"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register, .sendEmail, .addProduct, .cartAction, .login, .forgot, .addAddress, .removeUser, .device, .removeOrder, .notification, .updateNotification, .updateInvoice, .invoice, .sendInvoice:
            return .post
        case .updateProduct, .updateUser, .updateAddress, .rate, .issue, .setPaymentMethod, .setShippingMethod, .setBillingAddress, .setShippingAddress, .updateCoupon, .setSlot, .setObservation, .setAbsentHome, .setElevator:
            return .put
        case .removeProduct, .removeAddress, .removeCreditCard:
            return .delete
        default:
            return .get
        }
    }
    
    var encodeType: EncodeType {
        switch self {
        default:
            return .json
        }
    }
    
    var oauth: Bool {
        switch self {
        case .login, .register, .checkPostalCode, .privacy, .forgot:
            return false
        default:
            return true
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .login(let entity), .register(let entity), .sendEmail(let entity), .addProduct(let entity), .updateProduct(_, let entity), .removeProduct(_, let entity), .updateUser(let entity), .addAddress(let entity), .updateAddress(_, let entity), .rate(_, let entity), .issue(_, let entity), .setPaymentMethod(let entity), .setShippingMethod(let entity), .cartAction(let entity), .setShippingAddress(let entity), .setBillingAddress(let entity), .forgot(let entity), .updateCoupon(let entity), .setSlot(let entity), .setObservation(let entity), .removeUser(let entity), .device(let entity), .removeOrder(let entity), .notification(let entity), .updateNotification(let entity), .sendInvoice(let entity), .updateInvoice(let entity), .invoice(let entity), .setAbsentHome(let entity), .setElevator(let entity):
            return entity.toJSON()
        default:
            return nil
        }
    }
    
    var error: BaseErrorEntity {
        return ErrorEntity()
    }
    
    var adapter: BaseRequestAdapter? {
        return BaseRequestAdapter(request: self)
    }
    
    var logLevel: LogLevel {
        #if DEBUG
        return .full
        #else
        return .none
        #endif
    }
    
}
