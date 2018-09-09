//
//  TasksList.swift
//  EmpProfile
//
//  Created by venkatarao on 31/07/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import Foundation
struct TasksList: Codable {
    let status: String
    let errorCode, errorMessage, exceptionType: JSONNull?
    let result: [Result]
}

struct Result: Codable {
    let farmName: String?
    let id : Int
    let createdDtm : String
    let personId : Int
    let status : String
    let tasks : [Result11]
}
struct Result11 : Codable{
    let scheduleDate : String
    let startTime : String
    let workedHours : String
    let assignedBy : String
    let task : String
    let endTime : String
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
