//
//  Message.swift
//  FunChatik
//
//  Created by Igor on 7/18/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import Foundation

//strucrure which return request from postman
struct Message {
    public private(set) var message: String!
    public private(set) var userName: String!
    public private(set) var channelId: String!
    public private(set) var userAvatar: String!
    public private(set) var userAvatarColor: String!
    public private(set) var id: String!
    public private(set) var timeStamp: String!
}
