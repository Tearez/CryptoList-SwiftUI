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

	@Published private(set) var cryptoCurrencies: [CryptoCurrencyModel] = []
	@Published var isNavigationLinkActive: Bool = false
	@Published private(set) var selectedCrypto: CryptoCurrencyDetails? = nil {
		didSet {
			isNavigationLinkActive = selectedCrypto != nil
		}
	}

	init(service: CryptoWebServiceProtocol) {
		self.service = service
	}

	func resetView() {
		selectedCrypto = nil
		cryptoCurrencies = []
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

	func didTapCrypto(with id: String) {
		service
			.getCurrency(with: id)
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { _ in },
				  receiveValue: { [weak self] response in
				self?.selectedCrypto = response
			})
			.store(in: &cancelables)
	}
}
