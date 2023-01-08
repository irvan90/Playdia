//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import Combine

public class GamePresenter: ObservableObject {
	private var cancellables: Set<AnyCancellable> = []
	private let useCase: GameUseCase

	@Published public var games: [GameModel] = []
	@Published public var detail: DetailModel?
	@Published public var favorites: [DetailModel] = []

	@Published public var errorMessage: String = ""
	@Published public var loadingState: Bool = false
	@Published public var detailLoadingState: Bool = false
	@Published public var isFav: Bool = false

	public init(useCase: GameUseCase) {
		self.useCase = useCase
	}

	public func getAllGames() {
		loadingState = true
		useCase.getAllGames()
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { completion in
				switch completion {
				case .failure:
					self.errorMessage = String(describing: completion)
					print("Get All Games from API ERROR: \(completion)")
				case .finished:
					self.loadingState = false
					print("Get All Games from API FINISHED")
				}
			}, receiveValue: { games in
				self.games = games
			})
			.store(in: &cancellables)
	}

	public func getDetailGame(gameId: Int) {
		detailLoadingState = true
		useCase.getDetail(gameId: gameId)
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { completion in
				switch completion {
				case .failure:
					self.errorMessage = String(describing: completion)
					print("Get Detail Game from API ERROR: \(completion)")
				case .finished:
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
						self.detailLoadingState = false
						print("Get Detail Game from API FINISHED")
					}
				}
			}, receiveValue: { detail in
				self.detail = detail
			})
			.store(in: &cancellables)
	}
	public func checkIsFavorite(game: DetailModel) {
		useCase.checkIsFav(game: game)
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { (error) in
				self.errorMessage = String(describing: error)
			}, receiveValue: { value in
				self.isFav = value
			}).store(in: &cancellables)
	}

	public func addToFavorite() {
		useCase.addToFavorite(game: self.detail!)
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { (error) in

				self.errorMessage = String(describing: error)

			}, receiveValue: { value in
				self.isFav = value
			}).store(in: &cancellables)

	}

	public func deleteFavorite() {
		useCase.deleteFavorite(game: self.detail!)
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { (error) in
				self.errorMessage = String(describing: error)
			}, receiveValue: { _ in
				self.isFav = false
			}).store(in: &cancellables)

	}

	public func getGames() {
		self.useCase.getListFav()
			.receive(on: RunLoop.main)
			.sink(receiveCompletion: { (error) in
				self.errorMessage = String(describing: error)
			}, receiveValue: { value in
				self.favorites = value
			})
			.store(in: &cancellables)
	}
}
