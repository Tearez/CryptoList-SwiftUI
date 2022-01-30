//
//  CryptoListApp.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 28.01.22.
//

import SwiftUI

@main
struct CryptoListApp: App {
	private let viewModelFactory = ViewModelFactory()

    var body: some Scene {
        WindowGroup {
			CryptoListView(viewModel: viewModelFactory.buildCryptoListViewModel())
				.environmentObject(viewModelFactory)
        }
    }
}
