//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import Foundation

public struct GenreFilterDropdownOptionModel: Hashable {
		let key: String
		let value: String

		public static func == (lhs: GenreFilterDropdownOptionModel, rhs: GenreFilterDropdownOptionModel) -> Bool {
				return lhs.key == rhs.key
		}
}
