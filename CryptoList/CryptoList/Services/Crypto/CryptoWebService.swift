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

	func getAllCoins() -> AnyPublisher<[CryptoCurrency], Error> {
		return baseClient.request(url: "https://api.coinpaprika.com/v1/coins", method: .get)
	}
}
