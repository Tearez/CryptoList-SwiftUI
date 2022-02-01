//
//  CoinrankingWebService.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Combine
import Alamofire

final class CoinrankingWebService: CryptoWebServiceProtocol {
	private let baseClient = BaseNetworkClient()
	private let configurationProvider: ConfigurationProviderProtocol
	private let storageProvider: StorageProviderProtocol

	init(configurationProvider: ConfigurationProviderProtocol,
		 storageProvider: StorageProviderProtocol) {
		self.configurationProvider = configurationProvider
		self.storageProvider = storageProvider
	}

	func getAllCoins() -> AnyPublisher<[CryptoCurrencyModel], Error> {
		let url = buildUrl(with: "/coins")
		let request: AnyPublisher<GetAllCoinsResponse, Error> = baseClient.request(url: url,
																				   method: .get,
																				   headers: headers)
		return Publishers.Map(upstream: request) { response in
			response.coins.map {
				CryptoCurrencyModel(id: $0.uuid,
									name: $0.name,
									symbol: $0.symbol,
									price: $0.price,
									iconUrl: $0.iconUrl,
									type: nil)
			}
		}.eraseToAnyPublisher()
	}

	var headers: HTTPHeaders {
		let authorizationToken: String = storageProvider.authorizationToken
		let header = HTTPHeader(name: "x-access-token", value: authorizationToken)
		return HTTPHeaders([header])
	}

	private func buildUrl(with path: String) -> String {
		return configurationProvider.coinpaprikaBaseUrl + path
	}
}
