//
//  HomeView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import StoryUI

import PlaydiaCore
import Game
import Genre

struct HomeView: View {
	@EnvironmentObject private var navigationManager: NavigationManager

	@ObservedObject var gamePresenter: GamePresenter
	@ObservedObject var genrePresenter: GenrePresenter
	@State var game: Game.DetailModel?
	@State private var isActive = false
	@State var isLinkProfileActive = false
	@State var isLinkDetailActive = false
	@State var isStoryActive = false

	var body: some View {
		let router = HomeRouter(gamePresenter: gamePresenter, genrePresenter: genrePresenter)
		NavigationView {
			if gamePresenter.loadingState {
				HStack {
					Spacer()
					Spinner(isAnimating: true, style: .large).eraseToAnyView()
					Spacer()
				}.padding(.top, 100)
			} else {
				ScrollView(.vertical, showsIndicators: false) {
					VStack(alignment: .leading) {
						StoryCarousel(presenter: genrePresenter, router: router)
							.frame( maxWidth: .infinity)
							.padding(10)
						Spacer()
						ScrollView(.vertical, showsIndicators: false) {
							VStack(alignment: .center) {
								ForEach(gamePresenter.games, id: \.id) { game in
									NavigationLink(
										destination: router.makeDetailView(for: game.id )
									) {
										GameItem(
											gamePresenter: gamePresenter,
											game: game
										)
									}
								}
								.frame(maxWidth: .infinity)
								.edgesIgnoringSafeArea(.horizontal)
								.listStyle(PlainListStyle())
								.navigationBarTitle(Text("Playdia"), displayMode: .inline)
								.navigationBarItems(
									trailing:
										NavigationLink(destination: ProfileView(), isActive: $isLinkProfileActive) {
											Button(action: {
												self.isLinkProfileActive = true
											}, label: {
												Image("ProfileIcon")
													.resizable()
													.renderingMode(.original)
													.scaledToFit()
													.frame(width: 40, height: 40)
											})
										}
								)
							}
						}
					}
				}
				.frame(maxWidth: .infinity)
				.edgesIgnoringSafeArea(.horizontal)
				.listStyle(PlainListStyle())
			}
		}
		.onAppear {
			self.gamePresenter.getAllGames()
			self.genrePresenter.getGenres()
		}
		.onChange(of: navigationManager.activeTab) { _ in
			isActive = false
		}
	}
}
