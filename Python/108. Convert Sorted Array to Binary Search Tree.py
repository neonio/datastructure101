class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Solution:
    def sortedArrayToBST(self, nums):
        """
        :type nums: List[int]
        :rtype: TreeNode
        """
        return self.build(nums, 0, len(nums))

    def build(self, nums, left, right):
        if left >= right:
            return None
        mid = left + (right - left) // 2
        node = TreeNode(nums[mid])
        node.left = self.build(nums, left, mid)
        node.right = self.build(nums, mid + 1, right)
        return node


result = Solution().sortedArrayToBST([-10,-3,0,5,9])
print(result)