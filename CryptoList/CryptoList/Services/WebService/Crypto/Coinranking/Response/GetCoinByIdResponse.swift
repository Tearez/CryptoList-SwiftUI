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
	let priceAt: Double
	let marketCap: Decimal

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.symbol = try container.decode(String.self, forKey: .symbol)
		self.name = try container.decode(String.self, forKey: .name)
		self.iconUrl = try container.decode(String.self, forKey: .iconUrl)
		self.description = try container.decode(String.self, forKey: .description)
		self.priceAt = try container.decode(Double.self, forKey: .priceAt)

		let priceString = try container.decode(String.self, forKey: .price)
		self.price = Decimal(string: priceString) ?? .zero
		let marketCapString = try container.decode(String.self, forKey: .marketCap)
		self.marketCap = Decimal(string: marketCapString) ?? .zero
	}


	private enum CodingKeys: String, CodingKey {
		case symbol, name, description, iconUrl, price, priceAt, marketCap
	}
}
