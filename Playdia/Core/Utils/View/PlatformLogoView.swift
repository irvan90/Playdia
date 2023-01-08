//
//  PlatformLogoView.swift
//  PlaydiaApp
//
//  Created by Muhamad Irvan on 24/12/22.
//

import SwiftUI

struct PlatformLogoView: View {
	var slug: String
	var body: some View {
		if slug == "playstation" {
			Image("Playstation")
				.resizable()
				.frame(width: 25, height: 25)
		} else if slug == "xbox" {
			Image("Xbox")
				.resizable()
				.frame(width: 25, height: 25)
		} else if slug == "pc" {
			Image("PC")
				.resizable()
				.frame(width: 25, height: 25)
		} else if slug == "nintendo" {
			Image("Nintendo")
				.resizable()
				.frame(width: 25, height: 25)
		} else if slug == "linux" {
			Image("Linux")
				.resizable()
				.frame(width: 25, height: 25)
		} else if slug == "mac" {
			Image("Apple")
				.resizable()
				.frame(width: 25, height: 25)
		} else {
			Image(systemName: "gamecontroller")
				.resizable()
				.frame(width: 25, height: 25)
		}
	}
}

struct PlatformLogoView_Previews: PreviewProvider {
	static var previews: some View {
		PlatformLogoView(slug: "pc")
	}
}
