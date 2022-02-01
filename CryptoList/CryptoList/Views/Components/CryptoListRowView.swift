//
//  CryptoListRowView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 30.01.22.
//

import SwiftUI

private struct CryptoTypeView: View {
	private let type: CryptoType
	init(type: CryptoType) {
		self.type = type
	}

	var body: some View {
		Image(uiImage: image)
			.resizable()
			.scaledToFill()
			.frame(width: 36, height: 36, alignment: .center)
			.cornerRadius(18)
	}

	private var image: UIImage {
		switch type {
			case .coin:
				return Assets.cryptoTypeCoin.image
			case .token:
				return Assets.cryptoTypeToken.image
		}
	}
}

struct CryptoListRowView: View {
	@State private var crypto: CryptoCurrency
	private let action: () -> Void

	init(crypto: CryptoCurrency, action: @escaping () -> Void) {
		self.crypto = crypto
		self.action = action
	}

	var body: some View {
		Button(action: {
			action()
		}, label: {
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
				CryptoTypeView(type: crypto.type)
			}
			.padding(6)
			.background(Colors.background.uiColor.color)
			.cornerRadius(8)
			.shadow(color: .gray, radius: 4, x: 0, y: 0)
		}).buttonStyle(ScaledButtonStyle())
	}
}

struct CryptoListRowView_Previews: PreviewProvider {
	static var previews: some View {
		CryptoListRowView(crypto: CryptoCurrency(id: "",
												name: "Bitcoin",
												symbol: "BTC",
												 type: .coin),
						  action: {})
	}
}
