//
//  Currency.swift
//  CurrencyLayerAPI
//
//  Created by Myo Thandar soe on 18/05/2023.
//

import Foundation
import Alamofire

struct Currency: Codable {
    var success: Bool
    //var source: String
    var base: String
    var date = String()
    var rates = [String: Double]()
    //var quotes = [String: Double]()
}

func apiRequest(url: String, completion: @escaping (Currency) -> ()) {
    Session.default.request(url).responseDecodable(of: Currency.self) { response in
        switch response.result{
        case .success(let currencies):
            print(currencies)
            completion(currencies)
        case .failure(let error):
            print(error)
        }
    }
}
