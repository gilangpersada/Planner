//
//  TodoNode.swift
//  Planner
//
//  Created by Gilang Persada on 12/11/2021.
//

import Foundation
import AsyncDisplayKit

final class TodoNode:ASCellNode{
    
    private let titleTodoNode = ASTextNode2()
    private let dateNode = ASTextNode2()
    
    private let deleteButtonNode:ASButtonNode = {
       let button = ASButtonNode()
        button.setImage(UIImage(systemName: "trash.fill")?.withTintColor(.black), for: .normal)
        return button
    }()
    
    private let dividerNode:ASDisplayNode = {
       let dividerNode = ASDisplayNode()
        dividerNode.backgroundColor = .black
        dividerNode.style.width = .init(unit: .fraction, value: 1)
        dividerNode.style.height = ASDimensionMake(0.1)
        return dividerNode
    }()
    
    
    private let todo:Todo
    
    init(todo:Todo) {
        self.todo = todo
        super.init()
        setup()
        self.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        super.didLoad()
        self.view.backgroundColor = .systemYellow
        
    }
    
    func setup(){
        self.titleTodoNode.attributedText = .init(string: self.todo.title, attributes: [.font:UIFont.systemFont(ofSize: 14, weight: .semibold)])
        self.dateNode.attributedText = .init(string: "\(self.todo.date)", attributes: [.font:UIFont.systemFont(ofSize: 12, weight: .regular)])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let todoStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .start, children: [self.titleTodoNode,self.dateNode])
        
        let contentStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .center, children: [todoStack,self.deleteButtonNode])
        
        let contentInset = ASInsetLayoutSpec(insets: .init(top: 24, left: 16, bottom: 8, right: 24), child: contentStack)
        
        let finalStack = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .start, alignItems: .stretch, children: [contentInset,self.dividerNode])
        
        return finalStack
    }
}
