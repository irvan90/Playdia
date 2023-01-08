//
//  File.swift
//  
//
//  Created by Muhamad Irvan on 06/01/23.
//

import RealmSwift
import Foundation

public class SearchModuleEntity: Object {
	@Persisted(primaryKey: true) public var id = 0
	@Persisted public var slug = ""
	@Persisted public var name = ""
	@Persisted public var playtime: Int = 0
	@Persisted public var released = ""
	@Persisted public var rating: Double = 0.0
	@Persisted public var score: String = ""
	@Persisted public var backgroundImage: String = ""
}
