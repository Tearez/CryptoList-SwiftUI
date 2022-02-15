//
//  GetAllCoinsResponse.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Foundation

struct GetAllCoinsResponse: Decodable {
	let data: GetAllCoinsResponseData
}

struct GetAllCoinsResponseData: Decodable {
	let coins: [GetAllCoinsCoinResponse]
}

struct GetAllCoinsCoinResponse: Decodable {
	let uuid: String
	let symbol: String
	let name: String
	let iconUrl: String
	let price: Decimal

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.uuid = try container.decode(String.self, forKey: .uuid)
		self.symbol = try container.decode(String.self, forKey: .symbol)
		self.name = try container.decode(String.self, forKey: .name)
		self.iconUrl = try container.decode(String.self, forKey: .iconUrl)

		let priceString = try container.decode(String.self, forKey: .price)
		self.price = Decimal(string: priceString) ?? .zero
	}

	private enum CodingKeys: String, CodingKey {
		case uuid, symbol, name, iconUrl, price
	}
}
