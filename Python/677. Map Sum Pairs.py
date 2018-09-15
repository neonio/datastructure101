class MapSum:
    class Node:
        def __init__(self, value: int = 0):
            self.value = value
            self.next = dict()

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.root = MapSum.Node()

    def insert(self, key, val):
        """
        :type key: str
        :type val: int
        :rtype: void
        """
        selected_node = self.root
        for character in key:
            if selected_node.next.get(character) is None:
                new_node = MapSum.Node()
                selected_node.next[character] = new_node
                selected_node = new_node
            else:
                selected_node = selected_node.next[character]
        if selected_node.value == 0:
            selected_node.value = val



    def sum(self, prefix):
        """
        :type prefix: str
        :rtype: int
        """
        selected_node = self.root
        for character in prefix:
            if selected_node.next.get(character) is None:
                return 0
            else:
                selected_node = selected_node.next[character]
        return self.sum_iter(selected_node)


    def sum_iter(self, root:Node) -> int:
        res = root.value
        if root.next is None:
            return root.value
        for key in root.next.keys():
            res += self.sum_iter(root.next[key])
        return res


a = MapSum()
print(a.insert('apple',3))
print(a.sum('ap'))