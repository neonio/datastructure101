//
//  208. Implement Trie.swift
//  Algorithm
//
//  Created by amoyio on 2018/9/13.
//  Copyright © 2018年 amoyio. All rights reserved.
//

import Foundation
//Please Check Trie.swift
fileprivate class LeetCodeTrie {
    class TrieNode<T: Hashable> {
        var isFinish: Bool = false
        var next: [T: TrieNode] = [:]
        init(next: [T: TrieNode], isFinish: Bool = false) {
            self.isFinish = isFinish
            self.next = next
        }
        
        init() {}
    }
    
    var root: TrieNode<Character> = TrieNode<Character>()
    private(set) var size: Int = 0
    func add(word: String) {
        var selectedNode: TrieNode<Character>? = root
        for character in word {
            if let nextNode = selectedNode?.next[character] {
                selectedNode = nextNode
            } else {
                let tNode = TrieNode<Character>()
                selectedNode?.next[character] = tNode
                selectedNode = tNode
            }
        }
        // 看是否原本就有这个单词
        if !(selectedNode?.isFinish ?? false) {
            selectedNode?.isFinish = true
            size += 1
        }
    }
    
    func contains(word:String) -> Bool {
        var selectedNode = root
        for character in word {
            if let nextNode = selectedNode.next[character] {
                selectedNode = nextNode
            }else{
                return false
            }
        }
        return selectedNode.isFinish
    }
    func hasPrefix(prefix:String) -> Bool {
        var selectedNode = root
        for character in prefix {
            if let nextNode = selectedNode.next[character] {
                selectedNode = nextNode
            }else{
                return false
            }
        }
        return true
    }
}
