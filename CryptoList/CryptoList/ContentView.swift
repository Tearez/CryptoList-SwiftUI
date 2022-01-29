//
//  ContentView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 28.01.22.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
	let service = CryptoWebService()
	var cancelables = Set<AnyCancellable>()

	func getAll() {
		service
			.getAllCoins()
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { _ in
				print("")
			},
				  receiveValue: {
				response in
				print(response)
			})
			.store(in: &cancelables)
	}
}

struct ContentView: View {
	let vm = ViewModel()

    var body: some View {
		VStack {
			Text("Hello, world!")
				.padding()
				.foregroundColor(Colors.primary.uiColor.color)
			Image(uiImage: Assets.cryptolistLogo.image)
				.resizable()
				.scaledToFill()
				.frame(width: 100, height: 100)
		}
		.onAppear {
			vm.getAll()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
