//
//  GetCoinByIdResponse.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import Foundation

struct GetCoinByIdResponse: Decodable {
	let data: GetCoinByIdResponseData
}

struct GetCoinByIdResponseData: Decodable {
	let coin: GetCoinByIdResponseCoin
}

struct GetCoinByIdResponseCoin: Decodable {
	let name: String
	let symbol: String
	let description: String
	let iconUrl: String
	let price: Decimal
	let priceAt: Int
	let marketCap: Decimal
}
