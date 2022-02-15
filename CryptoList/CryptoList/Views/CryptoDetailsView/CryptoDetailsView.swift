//
//  CryptoDetailsView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 31.01.22.
//

import SwiftUI

struct CryptoDetailsView: View {
	let viewModel: CryptoDetailsViewModel

	var body: some View {
		VStack {
			HStack {
				if let url = viewModel.cryptoIconUrl {
					AsyncImage(url: url, content: { image in
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
					Text(viewModel.cryptoName)
						.bold()
						.font(.system(size: 44))
					Text(viewModel.cryptoSymbol)
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
					Text(viewModel.cryptoPrice)
					Text(viewModel.cryptoPriceAt)
				}
				.font(.system(size: 20))

				Spacer()
			}
			.padding(.horizontal)

			ScrollView {
				Text(viewModel.cryptoDescription)
					.lineLimit(nil)
					.font(.system(size: 16))
					.padding(.top, 16)
					.padding(.horizontal, 16)
			}
			.frame(width: UIScreen.main.bounds.width, alignment: .leading)

			Spacer()
		}
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle(Text(viewModel.cryptoName))
	}
}

struct CryptoDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		let crypto = CryptoCurrencyDetails(name: "Bitcoin",
										   symbol: "BTC",
										   description: "Desc",
										   iconUrl: nil,
										   marketCap: nil,
										   price: nil,
										   priceAt: nil)
		CryptoDetailsView(viewModel: CryptoDetailsViewModel(crypto: crypto))
	}
}

