//
//  Item.swift
//  Tutorial5
//
//  Created by 古堅ニノスカ on 2020/11/28.
//

import UIKit

// プロパティ
class Item {
    var name: String!
    var atack: String!
    
    // コンストラクタ
    init( name: String, atack: String) {

        self.name = name
        self.atack = atack
    }
    
    
    
    
    func getName() -> String {
        return name
    }
    
    func getAtack() -> String {
        return atack
    }
    
}
