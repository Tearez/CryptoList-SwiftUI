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

	func buildCryptoListViewModel() -> CryptoListViewModel {
		CryptoListViewModel(service: dependencyContainer.resolve(CryptoWebServiceProtocol.self)!)
	}

	private func registerDependencies() {
		dependencyContainer.register(ConfigurationProviderProtocol.self) { _ in
			return ConfigurationProvider()
		}
		.inObjectScope(.container)
		dependencyContainer.register(CryptoWebServiceProtocol.self) { resolver in
			let configurationProvider = resolver.resolve(ConfigurationProviderProtocol.self)!
			return CryptoWebService(configurationProvider: configurationProvider)
		}
		.inObjectScope(.container)
	}
}
