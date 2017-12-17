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

func search(rootNode node:Node?, forData data: Int)-> Bool{
    
    guard let node = node else {
        print("No Data")
        return false
    }
    
    print("root Node: \(String(describing: node.data)) Searth: \(data)")
    
    if (data == node.data){
        print("Found Data")
        return true
    }
    else if (data <= node.data){
        print("Left Child \(node.data)")
        return search(rootNode: node.leftChild, forData: data)
    }
    else {
        print("Right Child \(node.data)")
        return search(rootNode: node.rightChild, forData: data)
    }
}

func findMin(rootNode node:Node?)-> Int?{
    
    guard let node = node else {
        return nil
    }
    
    guard let leftChild = node.leftChild else {
        return node.data
    }
    
    return findMin(rootNode: leftChild)
}

func findMax(rootNode node:Node?)-> Int?{
    
    guard let node = node else {
        return nil
    }
    
    guard let rightChild = node.rightChild else {
        return node.data
    }
    
    return findMax(rootNode: rightChild)
}

var root: Node! = nil
root = insert(rootNode: root, withData: 15)
root = insert(rootNode: root, withData: 10)
root = insert(rootNode: root, withData: 20)
root = insert(rootNode: root, withData: 5)
root = insert(rootNode: root, withData: 3)
root = insert(rootNode: root, withData: 12)
root = insert(rootNode: root, withData: 25)

print ("\nSearch Item\n")

var itemPresent: Bool  = false
itemPresent =  search(rootNode: root, forData: 0)
print("Item Present: \(itemPresent)")

let minValue = findMin(rootNode: root)
print("\nMin Item: \(String(describing: minValue))")

let maxValue = findMax(rootNode: root)
print("\nMax Item: \(String(describing: maxValue))")
