//
//  ContentView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 28.01.22.
//

import SwiftUI

struct ContentView: View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
