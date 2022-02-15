//
//  CryptoDetailsView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 31.01.22.
//

import SwiftUI

struct CryptoDetailsView: View {

	private let crypto: CryptoCurrencyDetails

	init(crypto: CryptoCurrencyDetails) {
		self.crypto = crypto
	}

	var body: some View {
		VStack {
			HStack {
				if let url = crypto.iconUrl {
					AsyncImage(url: URL(string: url), content: { image in
						image
							.resizable()
							.scaledToFit()
							.frame(width: 96, height: 96, alignment: .center)
					}, placeholder: {
						Image(uiImage: Assets.cryptolistLogo.image)
							.resizable()
							.scaledToFit()
							.frame(width: 96, height: 96, alignment: .center)
					})
				} else {
					Image(uiImage: Assets.cryptolistLogo.image)
						.resizable()
						.scaledToFit()
						.frame(width: 96, height: 96, alignment: .center)
				}

				VStack(alignment: .leading) {
					Text(crypto.name)
						.bold()
						.font(.system(size: 44))
					Text(crypto.symbol)
						.bold()
						.font(.system(size: 24))
						.foregroundColor(.gray)
				}
				Spacer()
			}
			.padding(.horizontal)
			.padding(.bottom, 16)

			HStack {
				VStack(alignment: .leading) {
					crypto.price.map { Text("Price:  \($0.description)") }
					crypto.priceAt.map { Text("Price at:  \($0.description)") }
				}
				.font(.system(size: 20))

				Spacer()
			}
			.padding(.horizontal)

			Text(crypto.description)
				.lineLimit(nil)
				.font(.system(size: 16))
				.padding(.top, 16)
				.padding(.horizontal, 16)
				.frame(width: UIScreen.main.bounds.width, alignment: .leading)

			Spacer()
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle(Text(crypto.name))
	}
}

struct CryptoDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		CryptoDetailsView(crypto: CryptoCurrencyDetails(name: "Bitcoin",
											   symbol: "BTC",
											   description: "Description",
											   iconUrl: nil,
											   marketCap: "999999999",
											   price: 12.5,
											   priceAt: 1640757180))
	}
}

