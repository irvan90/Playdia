//
//  URLError.swift
//  Playdia
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation

enum URLError: LocalizedError {

	case invalidResponse
	case addressUnreachable(URL)

	var errorDescription: String? {
		switch self {
		case .invalidResponse: return "The server responded with garbage."
		case .addressUnreachable(let url): return "\(url.absoluteString) is unreachable."
		}
	}

}

enum DatabaseError: LocalizedError {

	case invalidInstance
	case requestFailed

	var errorDescription: String? {
		switch self {
		case .invalidInstance: return "Database can't instance."
		case .requestFailed: return "Your request failed."
		}
	}

}
