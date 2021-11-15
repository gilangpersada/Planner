//
//  TodoModel.swift
//  Planner
//
//  Created by Gilang Persada on 12/11/2021.
//

import Foundation

public class TodoModel {
    public static func getTodos() -> [Todo]{
        [
            .init(title:"Buy Eggs",date:12, isDone:false),
            .init(title:"Buy Coffe",date:12, isDone:false),
            .init(title: "Buy Shoes", date: 12, isDone: false),
        ]
    }
}
