//
//  ProfileView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI

struct Profile: Hashable {
	let name = "Muhamad Irvan Nurodin"
	let email = "muhamadirvan90@gmail.com"
	let image = "PP"
}

struct ProfileView: View {
	var data = Profile()
	var body: some View {
		List {
			Image(data.image)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.clipShape(Circle())
			Text(data.name)
			Text(data.email)
		}
		.navigationBarTitleDisplayMode(.inline)
	}
}
