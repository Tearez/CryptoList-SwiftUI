//
//  GetAllCurrenciesResponse.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 29.01.22.
//

import Foundation

struct GetAllCurrenciesResponse: Decodable {
	let currencies: [CryptoCurrency]
}

struct CryptoCurrency: Decodable, Identifiable {
	let id: String
	let name: String
	let symbol: String
	let type: CryptoType
}

enum CryptoType: String, Decodable {
	case coin = "coin"
	case token = "token"
}
