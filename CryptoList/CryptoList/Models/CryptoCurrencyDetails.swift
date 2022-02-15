//
//  CryptoCurrencyDetails.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 2.02.22.
//

import Foundation

struct CryptoCurrencyDetails {
	let name: String
	let symbol: String
	let description: String
	let iconUrl: String?
	let marketCap: String?
	let price: Decimal?
	let priceAt: Double?
}
