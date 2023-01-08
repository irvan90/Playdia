//
//  ImageOverlayView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI

struct ImageOverlayView: View {
	var txt: String
	var icon: Image?
	var body: some View {
		if icon != nil {
			HStack {
				icon.foregroundColor(Color.orange).padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 0))
				ZStack {
					Text(txt)
						.padding(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 6))
						.foregroundColor(.white)
				}
			}
			.background(Color.black)
			.opacity(0.8)
			.cornerRadius(10.0)
			.padding(6)
		} else {
			ZStack {
				Text(txt)
					.padding(EdgeInsets(top: 6, leading: 6, bottom: 6, trailing: 6))
					.foregroundColor(.white)
			}
			.background(Color.black)
			.opacity(0.8)
			.cornerRadius(10.0)
			.padding(6)
		}
	}
}
