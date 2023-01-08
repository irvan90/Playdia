//
//  HomeView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable line_length

import SwiftUI
import PlaydiaCore
import Game
import Search
import Genre

class NavigationManager: ObservableObject {
	@Published var activeTab = 0
}
struct ContentView: View {
	@EnvironmentObject var gamePresenter: GamePresenter
	@EnvironmentObject var genrePresenter: GenrePresenter
	@EnvironmentObject var searchPresenter: GetListPresenter<Any, SearchDomainModel, Interactor<Any, [SearchDomainModel], GetSearchRepository<GetSearchRemoteDataSource, SearchTransformer>>>

	@StateObject private var navigationManager = NavigationManager()

	var body: some View {
		TabView {
			HomeView(
				gamePresenter: gamePresenter,
				genrePresenter: genrePresenter
			)
			.tabItem {
				Image(systemName: "house.fill")
				Text("Home")
			}
			.tag(0)
			SearchView(
				presenter: searchPresenter,
				gamePresenter: gamePresenter,
				genrePresenter: genrePresenter
			)
			.tabItem {
				Image(systemName: "magnifyingglass")
				Text("Search")
			}
			.tag(1)
			FavoriteView(
				presenter: gamePresenter,
				genrePresenter: genrePresenter
			)
			.tabItem {
				Image(systemName: "heart.fill")
				Text("Favorites")
			}
			.tag(1)
		}
		.environmentObject(navigationManager)
		.accentColor(Color("Default"))
	}
}
