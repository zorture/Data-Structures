//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.

class Node<T: Hashable> {
    var value: T?
    weak var parent: Node?
    var children: [T: Node] = [:]
    var end = false
    
    init(value: T? = nil, parent: Node? = nil) {
        self.value = value
        self.parent = parent
        print("node created\(String(describing: value))")
    }
    
    func addNode(child: T) {
        guard children[child] == nil else {
            print("node not created")
            return
        }
        children[child] = Node(value: child, parent: self)
    }
}


class Trie {
    let root: Node<Character>
    
    init() {
        root = Node()
    }
    
    func insertWord(word: String?){
        guard let word = word, !word.isEmpty else { return }
        var currentNode = root
        let charArray = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < charArray.count {
            let character = charArray[currentIndex]

            currentNode.addNode(child: character)
            currentNode = currentNode.children[character]!
            
            currentIndex += 1
            
            if currentIndex == charArray.count {
                currentNode.end = true
            }
        }
    }
    
    func searchWord(word: String?)-> Bool {
        
        guard let word = word, !word.isEmpty else { return false }
        var currentNode = root
        let charArray = Array(word.lowercased())
        var currentIndex = 0

        while currentIndex < charArray.count ,
            let child = currentNode.children[charArray[currentIndex]]{
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == charArray.count && currentNode.end == true{
            return true
        }
        else{
            return false
        }
        
    }
}

let trie = Trie()
trie.insertWord(word: "cute")
trie.insertWord(word: "cutepy")
trie.searchWord(word: "cute")



