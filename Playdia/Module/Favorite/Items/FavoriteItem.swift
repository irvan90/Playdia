//
//  FavoriteItem.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Kingfisher

import PlaydiaCore
import Game
import Genre

struct FavoriteItem: View {
	@ObservedObject var presenter: GamePresenter
	@State var game: Game.DetailModel?
	var body: some View {
		HStack {
			KFImage.url(URL(string: (game?.backgroundImage) ?? ""))
				.placeholder {
					Image("AppIcon")
						.resizable()
						.scaledToFit()
				}
				.cacheOriginalImage()
				.fade(duration: 0.25)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 120, height: 80)
				.clipped()
				.cornerRadius(5)
			VStack(alignment: .leading) {
				Text(game!.name)
					.font(
						Font.custom(
							"InstagramSans-Regular", size: 18
						)
					)
					.fontWeight(.medium)
					.lineLimit(1)
					.foregroundColor(Color("Default"))
				if let releaseDate = game?.released {
					Text("Release on \(dateFormat(dateTxt: releaseDate))")
						.foregroundColor(Color("Default"))
						.font(.system(size: 12))
				} else {
					Text("Unknown release date")
						.foregroundColor(Color("Default"))
						.font(.system(size: 12))
				}
				HStack(alignment: .lastTextBaseline) {
					Image(systemName: "star.fill")
						.foregroundColor(.orange)
					Text("\(game?.rating ?? 0.0, specifier: "%.2f")")
						.font(.system(size: 16))
						.fontWeight(.regular)
				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 10)
			Spacer()
		}.padding(5)
	}
}
