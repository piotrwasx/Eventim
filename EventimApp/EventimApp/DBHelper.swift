//
//  DBHelper.swift
//  EventimApp
//
//  Created by Piotr Waś on 21/03/2022.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared = DBHelper()
    static var conn: Connection?
    
    private init() { }
    
    static func open(dbPath: URL) throws {
        var dbConnections: [Connection] = []
        
        do {
            let dbConnection = try Connection("\(dbPath)/db.sqlite3")
            dbConnections.append(dbConnection)
            print("found connection, \(dbConnections)")
        } catch {
            throw SQLiteDBError.couldNotOpenConnection
        }
        
        self.conn = dbConnections[0]
        print("successfully opened connection")
    }
}
