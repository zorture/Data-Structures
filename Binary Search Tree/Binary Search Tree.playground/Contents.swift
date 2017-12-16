//  Created by Kanwar Zorawar Singh Rana on 12/16/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.

class Node {
    var data: Int!
    var leftChild: Node?
    var rightChild: Node?
}

func getNode(withData data: Int)->Node {
    let node = Node()
    node.data = data
    return node
}

func insert(rootNode node:Node?, withData data: Int)-> Node{
    
    guard let node = node else{
        print("new Node \(data)")
        return getNode(withData: data)
    }
    if (data <= node.data) {
        print("Left Child \(node.data)")
        node.leftChild = insert(rootNode: node.leftChild, withData: data)
    }
    else {
        print("Right Child \(node.data)")
        node.rightChild = insert(rootNode: node.rightChild, withData: data)
    }
    
    return node
}

var root: Node! = nil
root = insert(rootNode: root, withData: 15)
root = insert(rootNode: root, withData: 10)
root = insert(rootNode: root, withData: 20)
root = insert(rootNode: root, withData: 5)
root = insert(rootNode: root, withData: 3)
root = insert(rootNode: root, withData: 12)
root = insert(rootNode: root, withData: 25)

