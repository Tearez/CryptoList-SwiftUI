//
//  SingInView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 15.02.22.
//

import SwiftUI

struct SingInView: View {
	@State var text: String = "" {
		didSet {
			print(text)
		}
	}

    var body: some View {
		VStack {
			TextField("Authentication token...", text: $text)
				.modifier(CardViewModifier())
				.padding()
			Button(action: {

			}, label: {
				Text("Sign In")
			})
				.buttonStyle(ScaledButtonStyle())
				.modifier(CardViewModifier())
		}
		.navigationBarTitleDisplayMode(.inline)
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
