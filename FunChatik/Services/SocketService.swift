//
//  SocketService.swift
//  FunChatik
//
//  Created by Igor on 7/16/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    //singletone
    static let instance = SocketService()
    
    override init() {
        super.init()
        
        socket = manager.socket(forNamespace: "/")
    }
    
    let manager = SocketManager(socketURL: URL(string: "https://funchatik.herokuapp.com/v1/")!, config: [.log(true)])

    var socket : SocketIOClient?
    
    //connect to the server
    func establishConnection() {
        socket?.connect()
    }
    
    func closeConnection() {
        socket?.disconnect()
    }
    
    //add channel to server
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        //Listen to a new chat massege
        socket?.emit("newChannel", channelName, channelDescription)//event with identifire newChannel
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        //Listen to event channelCreated and dataArray comes back with three objects
        socket?.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            //create new object with three vars above and append it to array of channels
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        socket?.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    //listen an event if message createtd and get it from api 
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        socket?.on("messageCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvatarColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
            
            completion(newMessage)
        }
    }
    
    //listen who is typing message
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        
        socket?.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            completionHandler(typingUsers)
        }        
    }
}
