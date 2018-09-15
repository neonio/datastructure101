class WordDictionary:
    class Node:
        def __init__(self):
            self.isFinish = False
            self.next = dict()

    def __init__(self):
        self.size = 0
        self.root = WordDictionary.Node()

    def addWord(self, word):
        """
        Adds a word into the data structure.
        :type word: str
        :rtype: void
        """
        selected_node = self.root
        for i in word:
            if selected_node.next.get(i) is None:
                new_node = WordDictionary.Node()
                selected_node.next[i] = new_node
                selected_node = new_node
            else:
                selected_node = selected_node.next[i]
        if not selected_node.isFinish:
            selected_node.isFinish = True
            self.size += 1

    def search(self, word) -> bool:
        """
        Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
        :type word: str
        :rtype: bool
        """
        return self.match(self.root, 0, word)

    def match(self, root: Node, i: int, word: str) -> bool:
        if i == len(word):
            return root.isFinish
        character = word[i]
        if character != '.':
            if root.next.get(character) is None:
                return False
            return self.match(root.next[character], i + 1, word)
        else:
            for key in root.next.keys():
                if self.match(root.next[key], i + 1, word):
                    return True
            return False


worrd = "ddd"
obj = WordDictionary()
obj.addWord(worrd)

print(obj.search(worrd))  # T
# print(obj.search("d"))  # F
# print(obj.search("d.."))  # T
# print(obj.search("d.f"))  # F
