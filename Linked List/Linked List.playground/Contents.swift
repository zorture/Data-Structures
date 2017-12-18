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
