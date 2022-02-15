//
//  CryptoImageView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import SwiftUI

struct CryptoImageView: View {

	private let url: URL?
	private let width: CGFloat
	private let height: CGFloat
	private let cornerRadius: CGFloat

	/// Inits CryptoImageView with set values 
	init(url: URL?,
		 width: CGFloat = 24,
		 height: CGFloat = 24,
		 cornerRadius: CGFloat = 12) {
		self.url = url
		self.width = width
		self.height = height
		self.cornerRadius = cornerRadius
	}

	/// Inits CryptoImageView with corner radius equal to the height divided by half
	init(url: URL?,
		 width: CGFloat = 24,
		 height: CGFloat = 24) {
		self.url = url
		self.width = width
		self.height = height
		self.cornerRadius = height / 2
	}


	var body: some View {
		if let url = self.url {
			AsyncImage(url: url, content: { image in
				image
					.resizable()
					.scaledToFit()
					.frame(width: width, height: height, alignment: .center)
			}, placeholder: {
				Image(uiImage: Assets.cryptolistLogo.image)
					.resizable()
					.scaledToFit()
					.frame(width: width, height: height, alignment: .center)
			})
		} else {
			Image(uiImage: Assets.cryptolistLogo.image)
				.resizable()
				.scaledToFit()
				.frame(width: width, height: height, alignment: .center)
		}
	}
}
