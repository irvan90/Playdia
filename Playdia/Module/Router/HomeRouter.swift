//
//  HomeRouter.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import SwiftUI

import PlaydiaCore
import Game
import Genre

public class HomeRouter {
	@ObservedObject var gamePresenter: GamePresenter
	@ObservedObject var genrePresenter: GenrePresenter

	init(gamePresenter: GamePresenter, genrePresenter: GenrePresenter) {
		self.gamePresenter = gamePresenter
		self.genrePresenter = genrePresenter
	}

	func makeDetailView(for id: Int) -> some View {
		return DetailView(presenter: gamePresenter, gameId: id)
	}

}
