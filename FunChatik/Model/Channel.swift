//
//  Channel.swift
//  FunChatik
//
//  Created by Igor on 7/15/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import Foundation

//Postman returns those channels json vars
struct Channel : Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
