import array
import unittest


val = array.array('i', [])

print(val.__len__())
val.append(2)
val.append(2)
val.append(2)
val.append(2)
val.append(2)
print(val.__len__())
print(val.__sizeof__())
print(val)

class Array:
    data = array.array('i', [])

    def __init__(self, capacity: int):
        self._capacity = capacity
        self.data.insert()

    def __len__(self):
        return 0

    def get_size(self) -> int:
        return 0

    def append(self, elem: int):
        pass


class ArrayTest(unittest.TestCase):
    def test_get_item(self):
        self.assertTrue(True)
