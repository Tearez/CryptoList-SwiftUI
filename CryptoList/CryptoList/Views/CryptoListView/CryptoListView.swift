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

    var body: some View {
		ScrollView(showsIndicators: false) {
			LazyVStack(spacing: 8) {
				ForEach(viewModel.cryptoCurrencies, id: \.self) { crypto in
					CryptoListRowView(crypto: crypto)
				}
			}
			.padding(.horizontal, 12)
		}
		.onAppear {
			viewModel.getAll()
		}
		.background(Colors.background.uiColor.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		CryptoListView(viewModel: ViewModelFactory().buildCryptoListViewModel())
    }
}
