//
//  ConfigurationProvider.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Foundation

protocol ConfigurationProviderProtocol {
	var coinpaprikaBaseUrl: String { get }
	var coinrankingBaseUrl: String { get }
}

final class ConfigurationProvider: ConfigurationProviderProtocol {

	let bundle: Bundle

	init(bundle: Bundle = Bundle.main) {
		self.bundle = bundle
	}

	var coinpaprikaBaseUrl: String {
		return readProperty(for: "CRYPTOLIST_COINPAPRIKA_BASE_URL")
	}

	var coinrankingBaseUrl: String {
		return readProperty(for: "CRYPTOLIST_COINRANKING_BASE_URL")
	}

	private func readProperty<T>(for key: String) -> T {
		guard let object = bundle.object(forInfoDictionaryKey: key) else {
			fatalError("Value does not exist for key: \(key)")
		}

		switch object {
			case let value as T:
				return value
			default:
				fatalError("Value for key \(key) is not of type \(T.self)")
		}
	}
}
