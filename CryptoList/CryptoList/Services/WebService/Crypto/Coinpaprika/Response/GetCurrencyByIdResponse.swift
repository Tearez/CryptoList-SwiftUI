//
//  GetCurrencyByIdResponse.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import Foundation

struct GetCurrencyByIdResponse: Decodable {
	let name: String
	let symbol: String
	let description: String
}
