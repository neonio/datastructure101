class CircularQueue:

    def __init__(self, k):
        """
        Initialize your data structure here. Set the size of the queue to be k.
        :type k: int
        default value will be zero
        """
        if not k > 0:
            return
        self.queue = [0] * (k + 1)
        self.front = 0
        self.tail = 0
        self.capability = k

    def isEmpty(self):
        """
        Checks whether the circular queue is empty or not.
        :rtype: bool
        """
        return self.front == self.tail

    def isFull(self):
        """
        Checks whether the circular queue is full or not.
        :rtype: bool
        """
        return (self.tail + 1) % len(self.queue) == self.front

    def enQueue(self, value):
        """
        Insert an element into the circular queue. Return true if the operation is successful.
        :type value: int
        :rtype: bool
        """
        if not self.isFull():
            self.queue[self.tail] = value
            self.tail = (self.tail + 1) % len(self.queue)
            return True
        else:
            return False



    def deQueue(self):
        """
        Delete an element from the circular queue. Return true if the operation is successful.
        :rtype: bool
        """
        if not self.isEmpty():
            self.queue[self.front] = 0
            self.front = (self.front + 1) % len(self.queue)
            return True
        else:
            return False

    def Front(self):
        """
        Get the front item from the queue.
        :rtype: int
        """
        return self.queue[self.front]

    def Rear(self):
        """
        Get the last item from the queue.
        :rtype: int
        """
        return self.queue[self.tail - 1]

    def __str__(self):
        return self.queue.__str__() + "|" + str(self.front) + "|" + str(self.tail)

# Your MyCircularQueue object will be instantiated and called as such:
obj = CircularQueue(3)


obj.enQueue(6)


param_2 = obj.deQueue()
obj.enQueue(5)


param_2 = obj.deQueue()
# obj.enQueue(3)
# param_3 = obj.Front()
# param_4 = obj.Rear()

print(obj, obj.Front(), obj.Rear())