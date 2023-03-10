//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import PlaydiaCore
import Combine

public struct GetSearchRepository<
		RemoteDataSource: DataSource,
		Transformer: Mapper>: Repository
where
		RemoteDataSource.Response == [SearchResult],
		Transformer.Response == [SearchResult],
		Transformer.Entity == [SearchModuleEntity],
Transformer.Domain == [SearchDomainModel] {
		public typealias Request = Any
		public typealias Response = [SearchDomainModel]

		private let _remoteDataSource: RemoteDataSource
		private let _mapper: Transformer

		public init(
				remoteDataSource: RemoteDataSource,
				mapper: Transformer) {

				_remoteDataSource = remoteDataSource
				_mapper = mapper
		}

	public func execute(request: Request?) -> AnyPublisher<[SearchDomainModel], Error> {
		fatalError()
	}

	public func execute(request: Any?, keyword: String) -> AnyPublisher<[SearchDomainModel], Error> {
		return _remoteDataSource.execute(request: nil, keyword: keyword)
			.map { _mapper.transformResponseToDomain(response: $0) }
			.eraseToAnyPublisher()
	}

	public func execute(request: Request?, id: Int, isFavorite: Bool) -> AnyPublisher<Bool, Error> {
		fatalError()
	}
}
