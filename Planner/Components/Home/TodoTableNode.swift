//
//  TodoTableNode.swift
//  Planner
//
//  Created by Gilang Persada on 12/11/2021.
//

import Foundation
import AsyncDisplayKit

final class TodoTableNode:ASTableNode{
    
    private let todos:[Todo]
    
    init(todos:[Todo]){
        self.todos = todos
        super.init(style: .plain)
        self.dataSource = self
        self.delegate = self
        self.style.width = .init(unit: .fraction, value: 1)
        self.style.flexGrow = 1
    }
    
    override func didLoad() {
        super.didLoad()
        self.view.backgroundColor = .systemYellow
        self.view.separatorStyle = .none
    }
}

extension TodoTableNode: ASTableDelegate, ASTableDataSource{
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let todo = todos[indexPath.row]
        return {
            TodoNode(todo: todo)
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
    }
}
