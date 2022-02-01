//
//  GetAllCoinsResponse.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Foundation

struct GetAllCoinsResponse: Decodable {
	let coins: [Coin]
}

struct Coin: Decodable {
	let uuid: String
	let symbol: String
	let name: String
	let iconUrl: String
	let price: Decimal
}
