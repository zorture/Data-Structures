//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.

class LinkedList {
    var data: Int!
    var nextNode: LinkedList?
}

func createLinkedList()->LinkedList {
    
    var root: LinkedList! = nil
    var tempPrt: LinkedList? = nil
    for i in 1...10 {
        let list = LinkedList()
        list.data = i
        if let previousNode = tempPrt {
            previousNode.nextNode = list
        }
        if i == 1{
            root = list
        }

        tempPrt = list
    }
    return root
}


let root = createLinkedList()

print("<<= Iteration Traversal =>>")
func traverseLinkedList(withRoot root: LinkedList){
    
    var tempRoot = root
    
    while (tempRoot.nextNode != nil) {
        if let data = tempRoot.data{
            print(data)
        }
        guard let nextNode = tempRoot.nextNode else {
            return
        }
        tempRoot = nextNode
    }
}

traverseLinkedList(withRoot: root)

print("<<= Recursion Traversal =>>")
func traverseLinkedListRecursion(withRoot root: LinkedList?){
    
    guard let root = root, let value = root.data else {
        return
    }

    traverseLinkedListRecursion(withRoot: root.nextNode)
    print("=>> \(value)")
}

traverseLinkedListRecursion(withRoot: root)

print("<<= Recursion List Reversal =>>")

var head:LinkedList? = nil
func listReversalRecursion(withRoot root: LinkedList?){
    
    var node:LinkedList!
    if root != nil {
        node = root
    }else{
        return
    }
    
    if node.nextNode == nil {
        head = node
        return
    }
    
    listReversalRecursion(withRoot: node.nextNode)
    if let currentNode = node.nextNode{
        currentNode.nextNode = node
        node.nextNode = nil
    }
}

listReversalRecursion(withRoot: root)
traverseLinkedList(withRoot: head!)






