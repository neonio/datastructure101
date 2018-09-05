from typing import Optional


class LinkedList:
    class Node:

        def __init__(self, value, next_node):
            self.value = value
            self.next_node = next_node

        def __str__(self):
            return "[{}]->{}".format(self.value, ("None" if self.next_node is None else ""))

    def __init__(self):
        self.dummay_head = LinkedList.Node(None, None)
        self.size = 0

    def get_size(self) -> int:
        return self.size

    def is_empty(self) -> bool:
        return self.size == 0

    def add_first(self, value):
        self.add(0, value)

    def add_last(self, value):
        self.add(self.size, value)

    def add(self, index, value) -> bool:
        if not index >= 0 and index < self.size:
            return False
        pre_node = self.dummay_head
        for i in range(index):
            pre_node = pre_node.next_node
        pre_node.next_node = LinkedList.Node(value, pre_node.next_node)
        self.size += 1
        return True

    def object_at(self, index) -> Optional[Node]:
        if not index >= 0 and index < self.size:
            return None
        selected_node: LinkedList.Node = self.dummay_head.next_node
        for i in range(index):
            selected_node = selected_node.next_node
        return selected_node

    def get_first(self) -> Optional[Node]:
        return self.object_at(0)

    def get_last(self) -> Optional[Node]:
        return self.object_at(self.size - 1)

    def update_at(self, index, value) -> bool:
        if not index >= 0 and index < self.size:
            return False
        selected_node: LinkedList.Node = self.dummay_head.next_node
        for i in range(index):
            selected_node = selected_node.next_node
        selected_node.value = value
        return True

    def contains(self, value) -> bool:
        selected_node = self.dummay_head.next_node
        while selected_node != None:
            if selected_node.value == value:
                return True
            selected_node = selected_node.next_node
        return False

    def __str__(self):
        selected_node = self.dummay_head.next_node
        display_string = "HEAD->"
        while selected_node:
            display_string += selected_node.__str__()
            selected_node = selected_node.next_node
        return display_string

    def remove(self, index) -> Optional[Node]:
        if not index >= 0 and index < self.size:
            return None
        pre_node = self.dummay_head
        for item in range(index):
            pre_node = pre_node.next_node
        node = pre_node.next_node
        pre_node.next_node = node.next_node
        node.next_node = None
        self.size -= 1
        return node

    def remove_first(self) -> Optional[Node]:
        return self.remove(0)

    def remove_last(self) -> Optional[Node]:
        return self.remove(self.size - 1)

    def to_list(self) -> list:
        result = []
        selected_node = self.dummay_head.next_node
        while selected_node:
            result += selected_node.value
            selected_node = selected_node.next_node
        return result

