//
//  CryptoDetailsViewModel.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import Foundation

final class CryptoDetailsViewModel {
	typealias CryptoDetailsFormatter = EpochDateFormatterProtocol & PriceFormatterProtocol

	private let crypto: CryptoCurrencyDetails
	private let formatter: CryptoDetailsFormatter

	init(crypto: CryptoCurrencyDetails,
		 formatter: CryptoDetailsFormatter) {
		self.crypto = crypto
		self.formatter = formatter
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
		guard let price = crypto.price else {
			return ""
		}
		return "Price: \(formatter.formatPrice(price))"
	}

	var cryptoPriceAt: String {
		guard let date = crypto.priceAt else {
			return ""
		}
		return "Price at: \(formatter.formatDateTime(for: date))"
	}

	var cryptoIconUrl: URL? {
		guard let iconUrl = crypto.iconUrl else {
			return nil
		}
		return URL(string: iconUrl)
	}
}
