//
//  MainMenuView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import SwiftUI

struct MainMenuView: View {
	@EnvironmentObject var viewModelFactory: ViewModelFactory

    var body: some View {
		NavigationView {
			Group {
				NavigationLink(destination: CryptoListView(viewModel: viewModelFactory.buildCryptoListViewModel()),
							   label: {
					HStack {
						VStack {
							Text("Coin Paprika")
								.font(.system(size: 24))
								.foregroundColor(.black)
							Text("Not Authenticated")
								.bold()
								.font(.system(size: 12))
								.foregroundColor(.gray)
						}

						Spacer()

						Image(systemName: "chevron.forward")
					}
				})
			}.navigationBarHidden(true)
		}
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
