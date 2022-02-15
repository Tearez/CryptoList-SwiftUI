//
//  ContentView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 28.01.22.
//

import SwiftUI
import Combine

struct CryptoListView: View {
	@StateObject var viewModel: CryptoListViewModel
	@EnvironmentObject var viewModelFactory: ViewModelFactory

	var body: some View {
		NavigationView {
			ZStack {
				if viewModel.isNavigationLinkActive, let cryptoDetailsModel = viewModel.selectedCrypto {
					NavigationLink(destination: CryptoDetailsView(viewModel: viewModelFactory.buildCryptoDetailsViewModel(crypto: cryptoDetailsModel)),
								   isActive: $viewModel.isNavigationLinkActive) {
						EmptyView()
					}.transition(.identity)
				}
				ScrollView(showsIndicators: false) {
					LazyVStack(spacing: 8) {
						ForEach(viewModel.cryptoCurrencies) { crypto in
							CryptoListRowView(crypto: crypto) {
								viewModel.didTapCrypto(with: crypto.id)
							}
						}
					}
					.padding(.horizontal, 12)
					.padding(.vertical, 8)
				}
				.onAppear {
					viewModel.resetView()
					viewModel.getAll()
				}
				.padding(.vertical, 1)
				.navigationBarHidden(true)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		CryptoListView(viewModel: ViewModelFactory().buildCryptoListViewModel())
			.environmentObject(ViewModelFactory())
			.environment(\.colorScheme, .dark)
	}
}
