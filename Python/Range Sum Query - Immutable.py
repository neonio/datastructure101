class NumArray:

    def __init__(self, nums):
        self.precalculate = []
        self.nums = nums
        for index, item in enumerate(nums):
            if index == 0:
                self.precalculate.append(item)
                continue
            self.precalculate.append(self.precalculate[index - 1] + item)

    def update(self, i, val):
        diff = val - self.nums[i]
        self.nums[i] = val
        for item in range(i, len(self.nums)):
            self.precalculate[item] = self.precalculate[item] + diff

    def sumRange(self, i, j):
        if i == 0:
            return self.precalculate[j]
        else:
            return self.precalculate[j] - self.precalculate[i - 1]

a = NumArray([1,3,5])
print(a.sumRange(0,2))
a.update(1,2)
print(a.sumRange(0,2))
