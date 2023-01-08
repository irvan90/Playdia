//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import PlaydiaCore
import Combine

public class GetGamesRepository: NSObject {
	typealias Instance = (GetGamesLocaleDataSource, GetGamesRemoteDataSource) -> GetGamesRepository

	let remote: GetGamesRemoteDataSource
	let locale: GetGamesLocaleDataSource

	public init(locale: GetGamesLocaleDataSource, remote: GetGamesRemoteDataSource) {
		self.locale = locale
		self.remote = remote
	}

	func checkIsFav(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return self.locale
			.checkIsFav(from: game.id)
			.eraseToAnyPublisher()
	}

	func getListFav() -> AnyPublisher<[DetailModel], Error> {
		return self.locale.getList()
			.map { GameTransformer.mapGameEntitiesToDomains(input: $0) }
			.eraseToAnyPublisher()
	}

	func addFav(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return self.locale
			.addGame(from: GameTransformer.mapDetailDomainToEntitiy(input: game))
			.eraseToAnyPublisher()
	}

	func deleteFav(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return self.locale
			.deleteGame(from: game.id)
			.eraseToAnyPublisher()
	}

	func getDetail(gameId: Int) -> AnyPublisher<DetailModel, Error> {
		return  self.remote.getDetail(gameId: gameId)
			.map { GameTransformer.mapDetailResponsesToDomains(input: $0) }
			.eraseToAnyPublisher()
	}

	func getAllGames() -> AnyPublisher<[GameModel], Error> {
		return self.remote.getAllGames()
			.map { GameTransformer.mapGamesResponsesToDomains(input: $0) }
			.eraseToAnyPublisher()
	}

}
