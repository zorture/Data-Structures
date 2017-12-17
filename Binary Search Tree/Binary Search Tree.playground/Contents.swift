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
        //print("new Node \(data)")
        return getNode(withData: data)
    }
    if (data <= node.data) {
        //print("Left Child \(node.data)")
        node.leftChild = insert(rootNode: node.leftChild, withData: data)
    }
    else {
        //print("Right Child \(node.data)")
        node.rightChild = insert(rootNode: node.rightChild, withData: data)
    }
    
    return node
}

var root: Node! = nil
root = insert(rootNode: root, withData: 15)
root = insert(rootNode: root, withData: 10)
root = insert(rootNode: root, withData: 20)
root = insert(rootNode: root, withData: 5)
root = insert(rootNode: root, withData: 12)
root = insert(rootNode: root, withData: 17)
root = insert(rootNode: root, withData: 25)
root = insert(rootNode: root, withData: 3)
root = insert(rootNode: root, withData: 7)
root = insert(rootNode: root, withData: 11)
root = insert(rootNode: root, withData: 14)
root = insert(rootNode: root, withData: 16)
root = insert(rootNode: root, withData: 19)
root = insert(rootNode: root, withData: 22)
root = insert(rootNode: root, withData: 30)


func search(rootNode node:Node?, forData data: Int)-> Node?{
    
    guard let node = node else {
        return nil
    }
    
    if (data == node.data){
        return node
    }
    else if (data <= node.data){
        return search(rootNode: node.leftChild, forData: data)
    }
    else {
        return search(rootNode: node.rightChild, forData: data)
    }
}

print ("\nSearch Item\n")

if let node =  search(rootNode: root, forData: 0){
    print("Item Present")
}
else{
    print("Item Not Present")
}


func findMin(rootNode node:Node?)-> Node?{
    
    guard let node = node else {
        return nil
    }
    
    guard let leftChild = node.leftChild else {
        return node
    }
    
    return findMin(rootNode: leftChild)
}

let minValue = findMin(rootNode: root)
print("\nMin Item: \(minValue?.data)")


func findMax(rootNode node:Node?)-> Node?{
    
    guard let node = node else {
        return nil
    }
    
    guard let rightChild = node.rightChild else {
        return node
    }
    
    return findMax(rootNode: rightChild)
}

let maxValue = findMax(rootNode: root)
print("\nMax Item: \(maxValue?.data)")

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
        //print("Empty Tree")
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

print ("\n Is Tree a Binary Search Tree\n")


func isBinarySearchTree(rootNode node: Node?, lowerLimit: Int, uppperLimit: Int)-> Bool{
    
    guard let node = node else {
        return true
    }
    if  node.data > lowerLimit &&
        node.data < uppperLimit &&
        isBinarySearchTree(rootNode: node.leftChild, lowerLimit: lowerLimit, uppperLimit: node.data) &&
        isBinarySearchTree(rootNode: node.rightChild, lowerLimit: node.data, uppperLimit: uppperLimit){
        return true
    }
    else{
        return false
    }
}

let value = isBinarySearchTree(rootNode: root, lowerLimit:0, uppperLimit: 100)
print(value)

print ("\n Delete Node \n")

func deleteNode(rootNode node: Node?, withData data: Int)-> Node? {
    
    guard var node = node else {
        return nil
    }
    
    if data < node.data {
        node.leftChild = deleteNode(rootNode: node.leftChild, withData: data)
    }else if data > node.data {
        node.rightChild =  deleteNode(rootNode: node.rightChild, withData: data)
    }else {
        // Case 1 No Child
        if node.leftChild == nil && node.rightChild == nil  {
            return nil
        }else {
            //Case 2 one Chil
            if node.leftChild == nil {
                return node.rightChild
            }else if node.rightChild == nil {
                return node.leftChild
            }else {
                // Case 3 two Child
                print("Got it")
                guard let maxValue = findMax(rootNode: node.leftChild) else {
                    return node
                }
                node.data = maxValue.data
                node.leftChild = deleteNode(rootNode: node.leftChild, withData: maxValue.data)
            }
        }
    }
    return node
}

deleteNode(rootNode: root, withData: 17)
print ("\n In-Order Traversal \n")
levelOrderTraversal(rootNode: root)










