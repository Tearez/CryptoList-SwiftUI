//
//  CryptoWebService.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 29.01.22.
//

import Foundation
import Combine
import Alamofire

protocol CryptoWebServiceProtocol {
	func getAllCoins() -> AnyPublisher<[CryptoCurrency], Error>
}

final class CryptoWebService: CryptoWebServiceProtocol {
	private let baseClient = BaseNetworkClient()
	private let configurationProvider: ConfigurationProviderProtocol

	init(configurationProvider: ConfigurationProviderProtocol) {
		self.configurationProvider = configurationProvider
	}

	func getAllCoins() -> AnyPublisher<[CryptoCurrency], Error> {
		let url = buildUrl(with: "/coins")
		return baseClient.request(url: url, method: .get)
	}

	private func buildUrl(with path: String) -> String {
		return configurationProvider.coinpaprikaBaseUrl + path
	}
}
