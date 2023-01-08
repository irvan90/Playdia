//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//
// swiftlint:disable force_cast

import PlaydiaCore
import Combine
import Alamofire
import Foundation

public struct GetGenresRemoteDataSource {
	let apiUrl = Bundle.main.infoDictionary?["API_URL"] as! String
	let apiKey = Bundle.main.infoDictionary?["API_KEY"] as! String

	public init() {
	}

	func getListGenres() -> AnyPublisher<[GenreResult], Error> {
		return Future<[GenreResult], Error> { completion in
			if !apiKey.isEmpty {
				var url = URLComponents(string: apiUrl + "/genres")!
				url.queryItems = [
					URLQueryItem(name: "key", value: apiKey),
					URLQueryItem(name: "page_size", value: "10")
				]
				AF.request(url)
					.validate()
					.responseDecodable(of: GenreResponse.self) { response in
						switch response.result {
						case .success(let value):
							completion(.success(value.results!))
						case .failure:
							completion(.failure(URLError.invalidResponse))
						}
					}
			} else {
				print("Doesn't Have API KEY")
			}
		}.eraseToAnyPublisher()
	}

	func getGenreDetails(id: Int) -> AnyPublisher<DetailGenreResponse, Error> {
		return Future<DetailGenreResponse, Error> { completion in
			if !apiKey.isEmpty {
				var url = URLComponents(string: apiUrl + "/genres/\(id)")!
				url.queryItems = [
					URLQueryItem(name: "key", value: apiKey)
				]
				AF.request(url)
					.validate()
					.responseDecodable(of: DetailGenreResponse.self) { response in
						switch response.result {
						case .success(let value):
							completion(.success(value))
						case .failure:
							completion(.failure(URLError.invalidResponse))
						}
					}
			}
		}.eraseToAnyPublisher()
	}

}
