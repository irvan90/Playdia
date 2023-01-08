//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 08/01/23.
//

import PlaydiaCore
import Combine
import RealmSwift
import Foundation

public struct GetGamesLocaleDataSource {
	private let _realm: Realm

	public init(realm: Realm) {
		_realm = realm
	}

	func checkIsFav(from id: Int) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
			do {
				let isExist =  _realm.object(ofType: GameEntity.self, forPrimaryKey: id)
				completion(.success((isExist != nil)))
			}
		}.eraseToAnyPublisher()
	}

	func deleteGame(from id: Int) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
			do {
				try _realm.write {
					_realm.delete(_realm.object(ofType: GameEntity.self, forPrimaryKey: id)!)
					completion(.success(true))
				}
			} catch {
				completion(.failure(DatabaseError.requestFailed))
			}
		}.eraseToAnyPublisher()
	}

	func addGame(from game: GameEntity) -> AnyPublisher<Bool, Error> {
		return Future<Bool, Error> { completion in
			do {
				try _realm.write {
					_realm.add(game, update: .all)
					completion(.success(true))
				}
			} catch {
				completion(.failure(DatabaseError.requestFailed))
			}

		}.eraseToAnyPublisher()
	}

	func getList() -> AnyPublisher<[GameEntity], Error> {
		return Future<[GameEntity], Error> { completion in
			let games: Results<GameEntity> = {
				_realm.objects(GameEntity.self)
					.sorted(byKeyPath: "id", ascending: true)
			}()
			completion(.success(games.toArray(ofType: GameEntity.self)))
		}.eraseToAnyPublisher()
	}
}
