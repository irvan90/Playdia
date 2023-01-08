//
//  Spinner.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI

struct Spinner: UIViewRepresentable {
	let isAnimating: Bool
	let style: UIActivityIndicatorView.Style

	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let spinner = UIActivityIndicatorView(style: style)
		spinner.hidesWhenStopped = true
		spinner.color = UIColor(Color("Default"))
		return spinner
	}

	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
		if isAnimating {
			uiView.startAnimating()
		} else {
			uiView.stopAnimating()
		}
	}
}
