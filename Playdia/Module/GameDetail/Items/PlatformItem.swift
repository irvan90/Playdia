//
//  PlatformItem.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Game

struct PlatformItem: View {
	var slug: String
	@State private var platformImage: String = "gamecontroller"

	var body: some View {
		HStack {
			VStack(alignment: .center) {
				Image(platformImage)
					.resizable()
					.frame(width: 35, height: 35)
			}.frame(minWidth: 70, maxWidth: 70)
		}
		.onAppear {
			if slug == "playstation" {
				platformImage = "Playstation"
			} else if slug == "xbox" {
				platformImage = "Xbox"
			} else if slug == "pc" {
				platformImage = "PC"
			} else if slug == "nintendo" {
				platformImage = "Nintendo"
			} else if slug == "linux" {
				platformImage = "Linux"
			} else if slug == "mac" {
				platformImage = "Apple"
			} else {
				platformImage = "gamecontroller"
			}
		}
	}
}
