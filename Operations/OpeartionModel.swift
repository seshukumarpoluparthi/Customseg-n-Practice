//
//  OpeartionModel.swift
//  EmpProfile
//
//  Created by apple on 8/16/18.
//  Copyright © 2018 Exaact. All rights reserved.
//

import Foundation
import UIKit
struct OperationDetails: Codable {
    let status: String
    let errorCode, errorMessage, exceptionType: JSONNull?
    let result: [Result33]
}
struct Result33: Codable {
    let farmName : String
    let fieldName : String?
    let date : String
    let createdDtm : String
    let fieldId : Int
    let id : Int
    let opTypeId : Int
    let userName : String
    let persons : String
    let status : String
    let title : String
    let duration : String
    let product : String
    let notes : String
    let userType : String
    let operationName : String
}


