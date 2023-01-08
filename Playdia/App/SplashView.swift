//
//  SplashView.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import SwiftUI
import PlaydiaCore
import Search
import Game
import Genre

struct SplashView: View {
	@State var isActive = false

	var body: some View {
		VStack {
			if self.isActive {
				let gameUseCase: GameInteractor = Injection.init().provideGame()
				let gamePresenter = GamePresenter(useCase: gameUseCase)

				let genreUseCase: GenreInteractor = Injection.init().provideGenre()
				let genrePresenter = GenrePresenter(useCase: genreUseCase)

				let seachUseCase: Interactor<
					Any,
					[SearchDomainModel],
					GetSearchRepository<
						GetSearchRemoteDataSource,
						SearchTransformer>
				> = Injection.init().provideSearch()
				let searchPresenter = GetListPresenter(useCase: seachUseCase)

				ContentView()
					.environmentObject(gamePresenter)
					.environmentObject(searchPresenter)
					.environmentObject(genrePresenter)

			} else {
				ZStack {
					Color("SplashColor").ignoresSafeArea()
					Image("SplashImage")
				}
			}
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
				withAnimation {
					self.isActive = true
				}
			}
		}
	}
}
