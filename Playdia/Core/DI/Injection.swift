//
//  Injection.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable force_try
// swiftlint:disable force_cast

import Foundation
import RealmSwift
import UIKit

import PlaydiaCore
import Game
import Search
import Genre

final class Injection: NSObject {

	var realm: Realm! = try! Realm()

	func provideGame() -> GameInteractor {
		let repository = GetGamesRepository(locale: GetGamesLocaleDataSource(realm: realm),
																				remote: GetGamesRemoteDataSource())
		return GameInteractor(repository: repository)
	}

	func provideDetail(id: Int) -> GameInteractor {
		let repository = GetGamesRepository(locale: GetGamesLocaleDataSource(realm: realm),
																				remote: GetGamesRemoteDataSource())
		return GameInteractor(repository: repository)
	}

	func provideGenre() -> GenreInteractor {
		let repository = GetGenresRepository(locale: GetGenresLocaleDataSource(realm: realm),
																				 remote: GetGenresRemoteDataSource())
		return GenreInteractor(repository: repository, id: 0)
	}

	func provideSearch<U: UseCase>() -> U where U.Request == Any, U.Response == [SearchDomainModel] {
			let remote = GetSearchRemoteDataSource(endpoint: Endpoints.Gets.games.url)
			let mapper = SearchTransformer()
			let repository = GetSearchRepository(
					remoteDataSource: remote,
					mapper: mapper)
			return Interactor(repository: repository) as! U
	}

}
