//
//  ViewController.swift
//  Planner
//
//  Created by Gilang Persada on 12/11/2021.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASDKViewController<ASDisplayNode> {
    
    private let rootNode: ASDisplayNode = {
        let rootNode = ASDisplayNode()
        rootNode.backgroundColor = .systemYellow
        rootNode.automaticallyManagesSubnodes = true
        return rootNode
    }()
    
    private let todoTableNode:TodoTableNode
    
    override init() {
        self.todoTableNode = TodoTableNode(todos: TodoModel.getTodos())
        
        super.init(node: self.rootNode)
        
        rootNode.layoutSpecBlock = { [weak self] _,_ -> ASLayoutSpec in
            guard let _ = self else {return .init()}
            
//            let insetHeader = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 0), child: self.headerNode)
            return ASWrapperLayoutSpec(layoutElement: self!.todoTableNode)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let title = UILabel()
        title.attributedText = .init(string: "Planner", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20, weight: .bold), NSAttributedString.Key.foregroundColor:UIColor.black])
        
        let addButton = UIButton()
        addButton.setImage(UIImage.init(systemName: "plus.square.fill",withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)
        addButton.tintColor = .black
        addButton.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: title)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: addButton)
    }
    
    @objc func addTodo(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.frame = .init(x: 0, y: 20, width: 200, height: 200)
        let alert = UIAlertController(title: "Add Todo", message: nil, preferredStyle: .alert)
        let textField = UITextField()
        alert.addTextField { (textField) in
            print(textField.text!)
        }
        let action = UIAlertAction(title: "OKE", style: .default) { (action) in
            print("\(datePicker.date)")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

