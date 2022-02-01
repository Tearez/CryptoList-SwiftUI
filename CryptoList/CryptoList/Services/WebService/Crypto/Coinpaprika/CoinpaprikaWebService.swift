//
//  CryptoWebService.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 29.01.22.
//

import Foundation
import Combine

protocol CryptoWebServiceProtocol {
	func getAllCoins() -> AnyPublisher<[CryptoCurrencyModel], Error>
}

final class CoinpaprikaWebService: CryptoWebServiceProtocol {
	private let baseClient = BaseNetworkClient()
	private let configurationProvider: ConfigurationProviderProtocol

	init(configurationProvider: ConfigurationProviderProtocol) {
		self.configurationProvider = configurationProvider
	}

	func getAllCoins() -> AnyPublisher<[CryptoCurrencyModel], Error> {
		let url = buildUrl(with: "/coins")
		let request: AnyPublisher<[CryptoCurrency], Error> = baseClient.request(url: url, method: .get)
		return Publishers.Map(upstream: request) { response in
			response.map {
				CryptoCurrencyModel(id: $0.id,
									name: $0.name,
									symbol: $0.symbol,
									price: nil,
									iconUrl: nil,
									type: $0.type)
			}
		}.eraseToAnyPublisher()
	}

	private func buildUrl(with path: String) -> String {
		return configurationProvider.coinpaprikaBaseUrl + path
	}
}
