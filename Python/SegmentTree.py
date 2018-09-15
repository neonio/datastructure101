from typing import Callable, Sequence, TypeVar, Optional


class SegmentTree:
    T = TypeVar('T')

    @property
    def is_empty(self) -> bool:
        return self.size == 0

    @property
    def size(self) -> int:
        return len(self.data)

    @staticmethod
    def __right_child_index(index: int) -> int:
        return index * 2 + 2

    @staticmethod
    def __left_child_index(index: int) -> int:
        return index * 2 + 1

    def __init__(self, values: Sequence[T], merger: Callable[[T, T], T]):
        if len(values) == 0:
            return
        self.data = values
        self.tree = [values[0]] * len(self.data) * 4
        self.merger = merger
        self.build_tree(0, 0, len(self.data) - 1)

    def build_tree(self, tree_index: int, left: int, right: int):
        if left == right:
            self.tree[tree_index] = self.data[left]
            return
        mid = left + (right - left) // 2
        left_tree_index = self.__left_child_index(tree_index)
        right_tree_index = self.__right_child_index(tree_index)
        self.build_tree(left_tree_index, left, mid)
        self.build_tree(right_tree_index, mid + 1, right)
        self.tree[tree_index] = self.merger(self.tree[left_tree_index], self.tree[right_tree_index])

    def query(self, query_left: int, query_right: int) -> T:
        if query_left < 0 or query_left >= self.size or query_right < 0 or query_right >= self.size or \
                query_left > query_right:
            return
        return self.query_iter(0, 0, self.size - 1, query_left, query_right)

    def query_iter(self, root: int, base_left_bound: int, base_right_bound: int, query_left: int,
                   query_right: int) -> T:
        if query_left == base_left_bound and query_right == base_right_bound:
            return self.tree[root]
        mid = base_left_bound + (base_right_bound - base_left_bound) // 2
        left_child_index = self.__left_child_index(root)
        right_child_index = self.__right_child_index(root)
        if query_left >= mid + 1:
            return self.query_iter(root=right_child_index, base_left_bound=mid + 1, base_right_bound=base_right_bound,
                                   query_left=query_left, query_right=query_right)
        elif query_right <= mid:
            return self.query_iter(root=left_child_index, base_left_bound=base_left_bound, base_right_bound=mid,
                                   query_left=query_left, query_right=query_right)
        left_part = self.query_iter(root=left_child_index, base_left_bound=base_left_bound, base_right_bound=mid,
                                    query_left=query_left, query_right=mid)
        right_part = self.query_iter(root=right_child_index, base_left_bound=mid + 1, base_right_bound=base_right_bound,
                                     query_left=mid + 1, query_right=query_right)
        return self.merger(left_part, right_part)

    def get_index(self, index: int) -> Optional[T]:
        if not index >= 0 and index < self.size:
            return None
        return self.data[index]

    def update(self, index: int, value: T):
        if not index >= 0 and index < self.size:
            return
        self.data[index] = value
        self.update_iter(0, index, value, 0, self.size - 1)

    def update_iter(self, root: int, index: int, value: T, l_range: int, r_range: int):
        if l_range == r_range:
            self.tree[root] = value
            return

        left_child_index = self.__left_child_index(root)
        right_child_index = self.__right_child_index(root)
        mid = l_range + (r_range - l_range) // 2
        if index <= mid:
            self.update_iter(root=left_child_index, index=index, value=value, l_range=l_range, r_range=mid)
        else:
            self.update_iter(root=right_child_index, index=index, value=value, l_range=mid + 1, r_range=r_range)
        self.tree[root] = self.merger(self.tree[left_child_index], self.tree[right_child_index])


def merge_operation(x: int, y: int) -> int:
    return x + y


class NumArray:

    def __init__(self, nums):
        """
        :type nums: List[int]
        """
        self.tree = SegmentTree(nums, merge_operation)

    def update(self, i, val):
        """
        :type i: int
        :type val: int
        :rtype: void
        """
        return self.tree.update(i, val)

    def sumRange(self, i, j):
        """
        :type i: int
        :type j: int
        :rtype: int
        """
        return self.tree.query(i, j)

a = NumArray([-28, -82, 53, -72, 11, -56, -65, -39, -43, 27])
a.sumRange(1,4)

# a = NumArray([-28,-39,53,65,11,-56,-65,-39,-43,97])
# a.sumRange(5,6)
# a.update(9, 27)
# a.sumRange(2,3)
# a.sumRange(6,7)
# a.update(1, -82)
# a.update(3, -72)
# a.sumRange(3,7)
# a.sumRange(1,8)
# a.update(5, 13)
# a.update(4, -67)