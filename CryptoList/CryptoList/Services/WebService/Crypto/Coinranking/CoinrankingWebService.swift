//
//  CoinrankingWebService.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Combine
import Alamofire

final class CoinrankingWebService: BaseNetworkClient, CryptoWebServiceProtocol {
	private let configurationProvider: ConfigurationProviderProtocol
	private let storageProvider: StorageProviderProtocol

	init(configurationProvider: ConfigurationProviderProtocol,
		 storageProvider: StorageProviderProtocol) {
		self.configurationProvider = configurationProvider
		self.storageProvider = storageProvider
	}

	func getAllCoins() -> AnyPublisher<[CryptoCurrencyModel], Error> {
		let url = buildUrl(with: "/coins")
		let request: AnyPublisher<GetAllCoinsResponse, Error> = request(url: url,
																		method: .get,
																		headers: headers)
		return Publishers.Map(upstream: request) { response in
			response.data.coins.map { coin in
				CryptoCurrencyModel(id: coin.uuid,
									name: coin.name,
									symbol: coin.symbol,
									price: coin.price,
									iconUrl: coin.iconUrl,
									type: nil)
			}
		}.eraseToAnyPublisher()
	}

	func getCurrency(with id: String) -> AnyPublisher<CryptoCurrencyDetails, Error> {
		let url = buildUrl(with: "/coin/\(id)")
		let request: AnyPublisher<GetCoinByIdResponse, Error> = request(url: url,
																		method: .get,
																		headers: headers)
		return request.map { response in
			let coin = response.data.coin
			return CryptoCurrencyDetails(name: coin.name,
										 symbol: coin.symbol,
										 description: coin.description,
										 iconUrl: coin.iconUrl,
										 marketCap: nil,
										 price: coin.price,
										 priceAt: coin.priceAt)
		}.eraseToAnyPublisher()
	}

	private var headers: HTTPHeaders? {
		return storageProvider.authorizationToken
			.map { HTTPHeader(name: "x-access-token", value: $0) }
			.map { HTTPHeaders([$0]) }
	}

	private func buildUrl(with path: String) -> String {
		return configurationProvider.coinrankingBaseUrl + path
	}
}
