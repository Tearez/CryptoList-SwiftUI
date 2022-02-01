//
//  CryptoCurrency.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Foundation

struct CryptoCurrencyModel: Identifiable {
	let id: String
	let name: String
	let symbol: String
	let price: Decimal?
	let iconUrl: String?
	let type: CryptoType?
}
