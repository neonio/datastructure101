class Trie:
    class Node:
        def __init__(self):
            self.isFinish = False
            self.next = dict()

    def __init__(self):
        self.size = 0
        self.root = Trie.Node()

    def search(self, word) -> bool:
        selected_node = self.root
        for char in word:
            if selected_node.next.get(char) is None:
                return False
            else:
                selected_node = selected_node.next[char]
        return selected_node.isFinish

    def startsWith(self, prefix) -> bool:
        selected_node = self.root
        for char in prefix:
            if selected_node.next.get(char) is None:
                return False
            else:
                selected_node = selected_node.next[char]
        return True

    def insert(self, word):
        selected_node = self.root
        for i in word:
            if selected_node.next.get(i) is None:
                new_node = Trie.Node()
                selected_node.next[i] = new_node
                selected_node = new_node
            else:
                selected_node = selected_node.next[i]
        if not selected_node.isFinish:
            selected_node.isFinish = True
            self.size += 1


a = Trie()
a.insert("apple")
a.search("apple")
a.search("app")
a.startsWith("app")
a.insert("app")
a.search("app")

