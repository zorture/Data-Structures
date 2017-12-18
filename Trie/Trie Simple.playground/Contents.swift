//  Created by Kanwar Zorawar Singh Rana on 12/18/17.
//  Copyright © 2017 Kanwar Zorawar Singh Rana. All rights reserved.

class Node{
    
    var value: Character?
    //weak var parent: Node?
    var children: [Character : Node]?
    var end = false

}


class Trie {
    let root: Node
    
    init() {
        root = Node()
        root.value = " "
    }
    
    func createNod(withCharacter char: Character) -> Node{
        let node = Node()
        node.value = char
        //root.children = [char: node]
        print("Node Created:: \(char)")
        return node
    }
    
    func insertWord(word: String?){
        guard let word = word, !word.isEmpty else { return }
        var previousNode: Node!
        let charArray = Array(word.lowercased())
        var currentIndex = 0

        while currentIndex < charArray.count {
            let character = charArray[currentIndex]
            let newNode = createNod(withCharacter: character)
            if(currentIndex == 0){
                root.children = [character : newNode]
            }else{
                previousNode.children = [character : newNode]
            }
            
            previousNode = newNode
            currentIndex += 1
            if currentIndex == charArray.count {
                newNode.end = true
            }
        }
    }
    
    func searchWord(word: String?)-> Bool {
        
        guard let word = word, !word.isEmpty else { return false }
        var currentNode = root
        let charArray = Array(word.lowercased())
        var currentIndex = 0

        while currentIndex < charArray.count{
            
            let character = charArray[currentIndex]
            
            if let child = currentNode.children![character]{
                currentNode = child
            }
            currentIndex += 1
        }
        
        if (currentIndex == charArray.count && currentNode.end){
            return true
        }else{
            return false
        }

    }
}

let trie = Trie()
trie.insertWord(word: "jute")
trie.insertWord(word: "cutepy")
trie.searchWord(word: "cute")



