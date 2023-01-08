//
//  StoryItem.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Kingfisher
import Genre

struct StoryItem: View {
	var genre: GenreDomainModel
	var body: some View {
		VStack(spacing: 8) {
			ZStack {
				Circle()
					.fill(Color.init(red: 193/255, green: 53/255, blue: 132/255))
					.clipShape(Circle())
					.frame(width: 64, height: 64)
				Circle()
					.fill(Color.white)
					.clipShape(Circle())
					.frame(width: 60, height: 60)
				KFImage.url(URL(string: (genre.imageBackground) ?? ""))
					.resizable()
					.scaledToFill()
					.clipShape(Circle())
					.frame(width: 56, height: 56)

			}
			Text(genre.name!).font(
				Font.custom(
					"InstagramSans-Regular", size: 10
				)
			)
		}.frame(maxWidth: 80)
	}
}
