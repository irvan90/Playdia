//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import Combine

public protocol GameUseCase {
	func getAllGames() -> AnyPublisher<[GameModel], Error>
	func getDetail(gameId: Int) -> AnyPublisher<DetailModel, Error>
	func getListFav() -> AnyPublisher<[DetailModel], Error>
	func addToFavorite(game: DetailModel) -> AnyPublisher<Bool, Error>
	func deleteFavorite(game: DetailModel) -> AnyPublisher<Bool, Error>
	func checkIsFav(game: DetailModel) -> AnyPublisher<Bool, Error>
}

public class GameInteractor: GameUseCase {
	private let repository: GetGamesRepository

	public init(repository: GetGamesRepository) {
		self.repository = repository
	}

	public func getAllGames() -> AnyPublisher<[GameModel], Error> {
		return repository.getAllGames()
	}

	public func getDetail(gameId: Int) -> AnyPublisher<DetailModel, Error> {
		return repository.getDetail(gameId: gameId)
	}

	public func getListFav() -> AnyPublisher<[DetailModel], Error> {
		return repository.getListFav()
	}

	public func deleteFavorite(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return repository.deleteFav(game: game)
	}

	public func checkIsFav(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return repository.checkIsFav(game: game)
	}

	public func addToFavorite(game: DetailModel) -> AnyPublisher<Bool, Error> {
		return repository.addFav(game: game)
	}
}
