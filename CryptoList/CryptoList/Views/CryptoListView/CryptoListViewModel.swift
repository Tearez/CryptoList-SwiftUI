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
	@Published var isNavigationLinkActive: Bool = false
	@Published private(set) var selectedCrypto: String = "" {
		didSet {
			isNavigationLinkActive = !selectedCrypto.isEmpty
		}
	}

	init(service: CryptoWebServiceProtocol) {
		self.service = service
	}

	func resetView() {
		selectedCrypto = ""
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
		selectedCrypto = id
	}
}
