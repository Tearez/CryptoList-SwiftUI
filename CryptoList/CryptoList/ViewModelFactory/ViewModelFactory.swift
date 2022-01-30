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

	private func registerDependencies() {
		dependencyContainer.register(CryptoWebServiceProtocol.self) { _ in
			return CryptoWebService()
		}
		.inObjectScope(.container)
	}

	func buildCryptoListViewModel() -> CryptoListViewModel {
		CryptoListViewModel(service: dependencyContainer.resolve(CryptoWebServiceProtocol.self)!)
	}
}
