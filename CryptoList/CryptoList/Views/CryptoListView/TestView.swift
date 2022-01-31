//
//  TestView.swift
//  CryptoList
//
//  Created by Martin Dimitrov on 31.01.22.
//

import SwiftUI

struct TestView: View {

	private let text: String

	init(text: String) {
		self.text = text
	}

    var body: some View {
        Text(text)
    }
}
