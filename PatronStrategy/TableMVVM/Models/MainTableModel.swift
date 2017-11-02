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
  var profilePicture: String?
  //var profilePicture = UserPictureModel() //En el caso de que fuese una clase/struct
  
  
  
  init?(data: Data) {
    do {
      if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any], let body = json["data"] as? [String: Any] {
        
        if let nombre =  body["nombre"] as? String {
          self.nombre = nombre
        }
        if let apellidos =  body["apellidos"] as? String {
          self.apellidos = apellidos
        }
        if let imgURL =  body["imgURL"] as? String {
          self.profilePicture = imgURL
        }
        /* Si hubiese que pasar un JSON a un modelo para que se haga un map.
         Hacerlo de esta manera:
         
         if let friends = body[“friends”] as? [[String: Any]] {
          self.friends = friends.map { Friend(json: $0) }
        }
         ----
         Y en el modelo el siguiente init:
         
         init(json: [String: Any]) {
         self.name = json["name"] as? String
         self.pictureUrl = json["pictureUrl"] as? String
         }*/
      }
    } catch {
      print("Error deserializing JSON: \(error)")
      return nil
    }
  }

}
