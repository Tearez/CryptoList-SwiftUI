//
//  CryptoListRowView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 30.01.22.
//

import SwiftUI

struct CryptoListRowView: View {
	@State private var crypto: CryptoCurrency

	init(crypto: CryptoCurrency) {
		self.crypto = crypto
	}

	var body: some View {

		HStack(alignment: .center, spacing: 8) {
			Image(uiImage: Assets.cryptolistLogo.image)
				.resizable()
				.scaledToFit()
				.frame(width: 48, height: 48, alignment: .center)
				.cornerRadius(24)
			VStack(alignment: .leading, spacing: 4) {
				Text(crypto.name)
					.font(.system(.headline))
				Text(crypto.symbol)
					.font(.system(.subheadline))
			}
			Spacer()
			Text(crypto.type.rawValue)
		}
		.padding(6)
		.background(Colors.background.uiColor.color)
		.cornerRadius(8)
		.shadow(color: .gray, radius: 4, x: 0, y: 0)
	}
}

struct CryptoListRowView_Previews: PreviewProvider {
	static var previews: some View {
		CryptoListRowView(crypto: CryptoCurrency(id: "",
												name: "Bitcoin",
												symbol: "BTC",
												 type: .coin))
	}
}
