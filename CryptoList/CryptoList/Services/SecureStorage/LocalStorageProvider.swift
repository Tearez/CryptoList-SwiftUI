//
//  SecureStorage.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 1.02.22.
//

import Foundation

protocol StorageProviderProtocol {
	func resetStorage()
	var authorizationToken: String { get set }
}

final class LocalStorageProvider: StorageProviderProtocol {
	private enum Keys: String, CaseIterable {
		case authorizationToken = "AUTHORIZATION_TOKEN"
	}

	private let userDefaults = UserDefaults.standard

	var authorizationToken: String {
		get {
			userDefaults.string(forKey: Keys.authorizationToken.rawValue) ?? ""
		}
		set {
			userDefaults.set(newValue, forKey: Keys.authorizationToken.rawValue)
		}
	}

	func resetStorage() {
		Keys.allCases.forEach { key in
			userDefaults.removeObject(forKey: key.rawValue)
		}
	}
}
