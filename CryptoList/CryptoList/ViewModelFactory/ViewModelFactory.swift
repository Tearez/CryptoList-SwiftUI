//
//  ViewModelFactory.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 30.01.22.
//

import Foundation
import Swinject

final class ViewModelFactory: ObservableObject {
	private let dependencyContainer: Container

	init(container: Container = Container()) {
		dependencyContainer = container
		registerDependencies()
	}

	func buildCoinpaprikaCryptoListViewModel() -> CryptoListViewModel {
		let childContainer = Container(parent: dependencyContainer)
		childContainer.register(CryptoWebServiceProtocol.self) { resolver in
			let configurationProvider = resolver.resolve(ConfigurationProviderProtocol.self)!
			return CoinpaprikaWebService(configurationProvider: configurationProvider)
		}
		.inObjectScope(.transient)

		return CryptoListViewModel(service: childContainer.resolve(CryptoWebServiceProtocol.self)!)
	}

	func buildCoinrankingCryptoListViewModel() -> CryptoListViewModel {
		let childContainer = Container(parent: dependencyContainer)
		childContainer.register(CryptoWebServiceProtocol.self) { resolver in
			let configurationProvider = resolver.resolve(ConfigurationProviderProtocol.self)!
			let storageProvider = resolver.resolve(StorageProviderProtocol.self)!
			return CoinrankingWebService(configurationProvider: configurationProvider,
										 storageProvider: storageProvider)
		}
		.inObjectScope(.transient)

		return CryptoListViewModel(service: childContainer.resolve(CryptoWebServiceProtocol.self)!)
	}

	func buildCryptoDetailsViewModel(crypto: CryptoCurrencyDetails) -> CryptoDetailsViewModel {
		CryptoDetailsViewModel(crypto: crypto,
							   formatter: dependencyContainer.resolve(CryptoDetailsViewModel.CryptoDetailsFormatter.self)!)
	}

	func buildSignInViewModel() -> SignInViewModel {
		SignInViewModel(localStorage: dependencyContainer.resolve(StorageProviderProtocol.self)!)
	}

	private func registerDependencies() {
		dependencyContainer.register(ConfigurationProviderProtocol.self) { _ in
			return ConfigurationProvider()
		}
		.inObjectScope(.container)

		dependencyContainer.register(CryptoDetailsViewModel.CryptoDetailsFormatter.self) { _ in
			return CryptoFormatter()
		}
		.inObjectScope(.transient)

		dependencyContainer.register(StorageProviderProtocol.self) { _ in
			return LocalStorageProvider()
		}.inObjectScope(.container)
	}
}
