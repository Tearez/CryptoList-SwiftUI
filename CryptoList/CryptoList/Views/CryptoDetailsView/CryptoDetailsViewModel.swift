//
//  CryptoDetailsViewModel.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import Foundation

final class CryptoDetailsViewModel {
	private let crypto: CryptoCurrencyDetails

	init(crypto: CryptoCurrencyDetails) {
		self.crypto = crypto
	}

	var cryptoName: String {
		crypto.name
	}

	var cryptoSymbol: String {
		crypto.symbol
	}

	var cryptoDescription: String {
		crypto.description
	}

	var cryptoPrice: String {
		guard let price = crypto.price?.formatted(.currency(code: "USD")) else {
			return ""
		}
		return "Price: \(price)"
	}

	var cryptoPriceAt: String {
		let date: String? = crypto.priceAt
			.map { Date(timeIntervalSince1970: $0) }
			.map { DateFormatter().string(from: $0) }
		guard let formatedDate = date else {
			return ""
		}
		return "Price at: \(formatedDate)"
	}

	var cryptoIconUrl: URL? {
		guard let iconUrl = crypto.iconUrl else {
			return nil
		}
		return URL(string: iconUrl)
	}
}
