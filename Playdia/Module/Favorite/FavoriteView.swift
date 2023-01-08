//
//  FavoriteView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import Kingfisher

import PlaydiaCore
import Game
import Genre

struct FavoriteView: View {
	@EnvironmentObject private var navigationManager: NavigationManager
	@ObservedObject var presenter: GamePresenter
	@ObservedObject var genrePresenter: GenrePresenter
	@State private var isActive = false

	var body: some View {
		let router = HomeRouter(gamePresenter: presenter, genrePresenter: genrePresenter)
		NavigationView {
			if presenter.loadingState {
				HStack {
					Spacer()
					Spinner(isAnimating: true, style: .large).eraseToAnyView()
					Spacer()
				}.padding(.top, 100)
			} else {
				ScrollView {
					VStack {
						if !presenter.favorites.isEmpty {
							ForEach(presenter.favorites, id: \.self.id) { game in
								ZStack {
									NavigationLink(
										destination: router.makeDetailView(for: game.id)
									) {
										FavoriteItem(presenter: presenter, game: game)
									}
								}.buttonStyle(PlainButtonStyle())
							}
						} else {
							Spacer()
							Text("No favorite game.")
								.bold()
							Text("Add your favorite games!")
							Spacer()
						}
					}
				}
				.clipped()
				.navigationBarTitle(Text("Favorite"), displayMode: .inline)
			}
		}
		.onAppear {
			self.presenter.getGames()
			self.presenter.objectWillChange.send()
		}
		.onChange(of: navigationManager.activeTab) { _ in
			isActive = false
		}

	}
}
