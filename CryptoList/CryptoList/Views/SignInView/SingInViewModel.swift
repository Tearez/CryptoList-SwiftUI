//
//  SingInViewModel.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import Foundation

final class SignInViewModel: ObservableObject {
	private let localStorage: StorageProviderProtocol
	@Published var inputText: String = ""
	@Published var isNavigationLinkActive: Bool = false

	init(localStorage: StorageProviderProtocol) {
		self.localStorage = localStorage
	}

	func toggleNavigationLink() {
		isNavigationLinkActive = (localStorage.authorizationToken != nil)
	}

	func fillInput() {
		inputText = localStorage.authorizationToken ?? ""
	}

	func saveInput() {
		localStorage.setAuthorizationToken(inputText)
	}
}
