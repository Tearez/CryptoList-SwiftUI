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
	func getCurrency(with id: String) -> AnyPublisher<CryptoCurrencyDetails, Error>
}

final class CoinpaprikaWebService: BaseNetworkClient, CryptoWebServiceProtocol {
	private let configurationProvider: ConfigurationProviderProtocol

	init(configurationProvider: ConfigurationProviderProtocol) {
		self.configurationProvider = configurationProvider
	}

	func getAllCoins() -> AnyPublisher<[CryptoCurrencyModel], Error> {
		let url = buildUrl(with: "/coins")
		let request: AnyPublisher<[CryptoCurrency], Error> = request(url: url, method: .get)
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

	func getCurrency(with id: String) -> AnyPublisher<CryptoCurrencyDetails, Error> {
		let url = buildUrl(with: "/coins/\(id)")
		let request: AnyPublisher<GetCurrencyByIdResponse, Error> = request(url: url, method: .get)
		return Publishers.Map(upstream: request) { response in
			CryptoCurrencyDetails(name: response.name,
								  symbol: response.symbol,
								  description: response.description,
								  iconUrl: nil,
								  marketCap: nil,
								  price: nil,
								  priceAt: nil)
		}.eraseToAnyPublisher()
	}

	private func buildUrl(with path: String) -> String {
		return configurationProvider.coinpaprikaBaseUrl + path
	}
}
