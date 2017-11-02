//
//  MainTableModel.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class MainTableModel {
  
  var nombre: String?
  var apellidos: String?
  //var profilePicture = UserPictureModel()
  
  
  
  init?(data: Data) {
    do {
      if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["data"] as? [String: Any] {
        
        if let nombre =  body["nombre"] as? String {
          self.nombre = nombre
        }
        if let apellidos =  body["apellidos"] as? String {
          self.apellidos = apellidos
        }
        //self.apellidos = body["Apellidos"] as? String
        /*self.profilePicture = body["pictureUrl"] as? String
        self.about = body[“about”] as? String
        self.email = body[“email”] as? String
        if let friends = body[“friends”] as? [[String: Any]] {
          self.friends = friends.map { Friend(json: $0) }
        }
        if let profileAttributes = body[“profileAttributes”] as? [[String: Any]] {
          self.profileAttributes = profileAttributes.map { Attribute(json: $0) }
        }*/
      }
    } catch {
      print("Error deserializing JSON: \(error)")
      return nil
    }
  }

}
