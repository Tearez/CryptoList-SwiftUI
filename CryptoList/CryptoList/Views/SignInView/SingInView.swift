//
//  SingInView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import SwiftUI

struct SingInView: View {
	@StateObject var viewModel: SignInViewModel
	@EnvironmentObject var viewModelFactory: ViewModelFactory

    var body: some View {
		ZStack {
			NavigationLink(isActive: $viewModel.isNavigationLinkActive,
						   destination: { CryptoListView(viewModel: viewModelFactory.buildCoinrankingCryptoListViewModel()) },
						   label: { EmptyView() })
		}
		VStack {
			TextField("Authentication token...", text: $viewModel.inputText)
				.modifier(CardViewModifier())
				.padding()
			Button(action: {
				viewModel.saveInput()
				viewModel.toggleNavigationLink()
			}, label: {
				Text("Sign In")
			})
				.buttonStyle(ScaledButtonStyle())
				.modifier(CardViewModifier())
		}
		.onAppear {
			viewModel.fillInput()
		}
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
		SingInView(viewModel: ViewModelFactory().buildSignInViewModel())
    }
}
