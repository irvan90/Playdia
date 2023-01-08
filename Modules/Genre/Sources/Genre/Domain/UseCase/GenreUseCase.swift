//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation
import Combine

public protocol GenreUseCase {
	func getListGenres() -> AnyPublisher<[GenreDomainModel], Error>
	func getDetailGenre(id: Int) -> AnyPublisher<GenreDomainModel, Error>
}

public class GenreInteractor: GenreUseCase {
	private let repository: GetGenresRepository

	public init(repository: GetGenresRepository, id: Int) {
		self.repository = repository
	}

	public func getListGenres() -> AnyPublisher<[GenreDomainModel], Error> {
		return repository.getListGenres()
	}

	public func getDetailGenre(id: Int) -> AnyPublisher<GenreDomainModel, Error> {
		return repository.getGenreDetail(id: id)
	}

}
