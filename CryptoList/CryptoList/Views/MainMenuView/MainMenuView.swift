//
//  MainMenuView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import SwiftUI

struct MainMenuOptionView: View {
	private let title: String
	private let subtitle: String

	init(title: String, subtitle: String) {
		self.title = title
		self.subtitle = subtitle
	}

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(title)
					.font(.system(size: 24))
					.foregroundColor(.black)
				Text(subtitle)
					.bold()
					.font(.system(size: 12))
					.foregroundColor(.gray)
			}

			Spacer()

			Image(systemName: "chevron.forward")
				.foregroundColor(.black)
		}
		.modifier(CardViewModifier())
	}
}

struct MainMenuView: View {
	@EnvironmentObject var viewModelFactory: ViewModelFactory

    var body: some View {
		NavigationView {
			VStack(spacing: 8) {
				NavigationLink(destination: CryptoListView(viewModel: viewModelFactory.buildCoinpaprikaCryptoListViewModel()),
							   label: {
					MainMenuOptionView(title: "Coin Paprika", subtitle: "Not Authenticated")
				})
				NavigationLink(destination: SingInView(viewModel: viewModelFactory.buildSignInViewModel()),
							   label: {
					MainMenuOptionView(title: "Coin Ranking", subtitle: "Authenticated")
				})
			}.padding(.horizontal, 8)
			.navigationBarHidden(true)
		}
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
