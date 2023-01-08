//
//  SearchView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable line_length

import SwiftUI
import Kingfisher

import PlaydiaCore
import Search
import Game
import Genre

struct SearchView: View {
	@EnvironmentObject private var navigationManager: NavigationManager
	@ObservedObject var presenter: GetListPresenter<Any, SearchDomainModel, Interactor<Any, [SearchDomainModel], GetSearchRepository<GetSearchRemoteDataSource, SearchTransformer>>>
	@ObservedObject var gamePresenter: GamePresenter
	@ObservedObject var genrePresenter: GenrePresenter
	@State var query: String = ""
	@State var isLoading = false
	@State private var isActive = false

	var body: some View {
		let router = HomeRouter(gamePresenter: gamePresenter, genrePresenter: genrePresenter)
		NavigationView {
			ScrollView {
				HStack {
					HStack {
						Image(systemName: "magnifyingglass")
						TextField("Search", text: $query, onCommit: {
							self.presenter.getSearchList(request: nil, keyword: query)
						})
						if !query.isEmpty {
							Button(action: {
								self.query = ""
							}, label: {
								Image(systemName: "xmark.circle.fill")
							})
						}
					}
					.padding()
					.overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("Default"), lineWidth: 1))
				}.padding(.horizontal).padding(.vertical)
				if presenter.isLoading {
					HStack {
						Spacer()
						Spinner(isAnimating: true, style: .large).eraseToAnyView()
						Spacer()
					}.padding(.top, 100)
				} else if presenter.isError {
					Text(presenter.errorMessage)
				} else {
					if !self.presenter.list.isEmpty {
						ScrollView(.vertical, showsIndicators: false) {
							LazyVStack {
								ForEach(presenter.list, id: \.self.id) { game in
									ZStack {
										NavigationLink(
											destination: router.makeDetailView(for: game.id ?? 0)
										) {
											SearchItem(presenter: presenter, game: game)
										}
									}.buttonStyle(PlainButtonStyle())
								}
							}
						}
					} else {
						Spacer()
						Text("No record found.")
							.bold()
						Text("Try another keyword!")
						Spacer()
					}
				}
			}
			.clipped()
			.navigationBarTitle(Text("Search"), displayMode: .inline)
		}
		.onAppear {
			self.presenter.objectWillChange.send()
		}
		.onChange(of: navigationManager.activeTab) { _ in
			isActive = false
		}

	}
}
