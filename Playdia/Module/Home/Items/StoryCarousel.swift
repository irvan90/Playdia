//
//  StoryCarousel.swift
//  Playdia
//
//  Created by Muhamad Irvan on 08/01/23.
//
// swiftlint:disable line_length identifier_name

import SwiftUI
import StoryUI

import PlaydiaCore
import Game
import Genre

struct StoryCarousel: View {
	@State var presenter: GenrePresenter
	@State private var isPresented = false
	@State var stories: [StoryUIModel] = [
		StoryUIModel(
			user: StoryUIUser(
				name: "Action",
				image: "https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg"
			),
			stories: [
				Story(mediaURL: "https://cdnb.artstation.com/p/assets/images/images/036/947/917/large/ismael-fofana-valorant-jett-character-poster-design.jpg", date: "30 min ago", type: .image),
				Story(mediaURL: "https://cdna.artstation.com/p/assets/images/images/036/947/774/large/ismael-fofana-the-legend-of-zeldaa-breath-of-the-wild-game-poster-design.jpg", date: "30 min ago", type: .image)
			]),
		StoryUIModel(
			user: StoryUIUser(
				name: "Adventure",
				image: "https://media.rawg.io/media/games/13a/13a528ac9cf48bbb6be5d35fe029336d.jpg"
			),
			stories: [
				Story(mediaURL: "https://cdna.artstation.com/p/assets/images/images/036/947/726/large/ismael-fofana-super-mario-mario-character-poster-design.jpg", date: "30 min ago", type: .image),
				Story(mediaURL: "https://cdnb.artstation.com/p/assets/images/images/036/947/541/large/ismael-fofana-minecraft-game-poster-design.jpg?1619050711", date: "1 hour ago", type: .image)
			]),
		StoryUIModel(
			user: StoryUIUser(
				name: "Arcade",
				image: "https://media.rawg.io/media/games/9dd/9ddabb34840ea9227556670606cf8ea3.jpg"
			),
			stories: [
				Story(mediaURL: "https://cdna.artstation.com/p/assets/images/images/036/947/624/large/ismael-fofana-prototype-2-game-poster-design.jpg", date: "30 min ago", type: .image),
				Story(mediaURL: "https://cdna.artstation.com/p/assets/images/images/036/947/658/large/ismael-fofana-rainbow-six-siege-game-poster-design.jpg", date: "1 hour ago", type: .image)

			])
	]
	var router: HomeRouter

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			LazyHStack(alignment: .top, spacing: 0) {
				ForEach(presenter.genres, id: \.id) { genre in
					Button(action: {
						isPresented.toggle()
					}, label: {
						StoryItem(genre: genre).padding(.horizontal, 5)
					}).fullScreenCover(isPresented: $isPresented) {
						StoryView(stories: stories, isPresented: $isPresented)
							.swipe(
								down: {
									isPresented.toggle()
								}
							)
					}
				}.buttonStyle(PlainButtonStyle())
			}
		}
	}
}

extension StoryView {
	func swipe(
		up: @escaping (() -> Void) = {},
		down: @escaping (() -> Void) = {},
		left: @escaping (() -> Void) = {},
		right: @escaping (() -> Void) = {}
	) -> some View {
		return self.simultaneousGesture(DragGesture(minimumDistance: 3, coordinateSpace: .local)
			.onEnded({ value in
				if value.translation.width < 0 { left() }
				if value.translation.width > 0 { right() }
				if value.translation.height < 0 { up() }
				if value.translation.height > 0 { down() }
			}))
	}
}
