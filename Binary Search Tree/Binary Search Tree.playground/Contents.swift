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

print ("\nSearch Item\n")

var itemPresent: Bool  = false
itemPresent =  search(rootNode: root, forData: 0)
print("Item Present: \(itemPresent)")

func findMin(rootNode node:Node?)-> Int?{
    
    guard let node = node else {
        return nil
    }
    
    guard let leftChild = node.leftChild else {
        return node.data
    }
    
    return findMin(rootNode: leftChild)
}

let minValue = findMin(rootNode: root)
print("\nMin Item: \(String(describing: minValue))")


func findMax(rootNode node:Node?)-> Int?{
    
    guard let node = node else {
        return nil
    }
    
    guard let rightChild = node.rightChild else {
        return node.data
    }
    
    return findMax(rootNode: rightChild)
}

let maxValue = findMax(rootNode: root)
print("\nMax Item: \(String(describing: maxValue))")

func findMaxHeight(rootNode node: Node?)-> Int {
    
    guard let node = node else {
        return 0
    }
    return max(findMaxHeight(rootNode: node.leftChild), findMaxHeight(rootNode: node.rightChild)) + 1
}

let height = findMaxHeight(rootNode: root)
print("\nHeight: \(height)")

class Queue {
    var collection = [Node]()
    
    func enQueue(withData data: Node){
        collection.append(data)
    }
    
    func deQueue() -> Node? {
        return collection.removeFirst()
    }
    
    func qSize() {
        print(collection.count)
    }
    
    func isEmpty() -> Bool {
        return collection.count == 0 ? true : false
    }
}


print ("\n Level Order Traversal\n")

func levelOrderTraversal(rootNode node: Node?) {
    
    guard let node = node else {
        print("Empty Tree")
        return
    }

    let queue = Queue()
    queue.enQueue(withData: node)
    
    while !queue.isEmpty() {
        guard let  node = queue.deQueue()else{
            return
        }
        print(node.data)
        if let leftNode = node.leftChild {
            queue.enQueue(withData: leftNode)
        }
        
        if let rightNode = node.rightChild {
            queue.enQueue(withData: rightNode)
        }
    }
}

levelOrderTraversal(rootNode: root)

print ("\n Pre Order Traversal\n")

func preOrderTraversal(rootNode node: Node?) {
    
    guard let node = node else {
        return
    }
    print(node.data)
    preOrderTraversal(rootNode: node.leftChild)
    preOrderTraversal(rootNode: node.rightChild)
    
}

preOrderTraversal(rootNode: root)

print ("\n In Order Traversal\n")

func inOrderTraversal(rootNode node: Node?) {
    
    guard let node = node else {
        return
    }
    inOrderTraversal(rootNode: node.leftChild)
    print(node.data)
    inOrderTraversal(rootNode: node.rightChild)
}

inOrderTraversal(rootNode: root)

print ("\n Post Order Traversal\n")

func postOrderTraversal(rootNode node: Node?) {
    
    guard let node = node else {
        return
    }
    postOrderTraversal(rootNode: node.leftChild)
    postOrderTraversal(rootNode: node.rightChild)
    print(node.data)
}

postOrderTraversal(rootNode: root)
