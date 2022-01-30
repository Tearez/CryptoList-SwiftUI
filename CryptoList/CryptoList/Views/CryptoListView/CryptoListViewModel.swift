//
//  CryptoListViewModel.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 30.01.22.
//

import Combine
import Foundation

class CryptoListViewModel: ObservableObject {
	private let service: CryptoWebServiceProtocol
	private var cancelables = Set<AnyCancellable>()

	@Published private(set) var cryptoCurrencies: [CryptoCurrency] = []

	init(service: CryptoWebServiceProtocol) {
		self.service = service
	}

	func getAll() {
		service
			.getAllCoins()
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { _ in },
				  receiveValue: { [weak self] response in
				self?.cryptoCurrencies = response
			})
			.store(in: &cancelables)
	}
}
