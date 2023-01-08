//
//  GameItem.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Kingfisher

import PlaydiaCore
import Game

struct GameItem: View {
	@ObservedObject var gamePresenter: GamePresenter

	@State var game: Game.GameModel
	@State private var _isFavorite: Bool = false

	var body: some View {
			LazyVStack(alignment: .leading, spacing: 8) {
				Text(game.name)
					.font(
						Font.custom(
							"InstagramSans-Regular", size: 16
						)
					)
					.font(.headline)
					.frame(width: UIScreen.screenWidth, alignment: .leading)
					.padding(.horizontal)
				KFImage.url(URL(string: (game.backgroundImage) ?? ""))
					.resizable()
					.scaledToFill()
					.frame(width: UIScreen.screenWidth, height: 250)
					.clipped()
					.overlay(ImageOverlayView(
						txt: String(game.rating), icon: (Image(systemName: "star.fill"))),
									 alignment: .bottomLeading)
					.overlay(ImageOverlayView(txt: "\(game.released?.convertToDate() ?? "No data released")",
																		icon: (Image(systemName: "calendar.badge.plus"))), alignment: .bottomTrailing)
			}
			Divider()
				.listStyle(PlainListStyle())
				.listRowInsets(EdgeInsets())
				.listRowSeparator(.hidden)
				.edgesIgnoringSafeArea(.horizontal)
				.padding(10)
			Spacer()
	}
}
