class NestedInteger(object):
   def isInteger(self):
       """
       @return True if this NestedInteger holds a single integer, rather than a nested list.
       :rtype bool
       """

   def getInteger(self):
       """
       @return the single integer that this NestedInteger holds, if it holds a single integer
       Return None if this NestedInteger holds a nested list
       :rtype int
       """

   def getList(self):
       """
       @return the nested list that this NestedInteger holds, if it holds a nested list
       Return None if this NestedInteger holds a single integer
       :rtype List[NestedInteger]
       """

class NestedIterator(object):

    def __init__(self, nestedList):
        """
        Initialize your data structure here.
        :type nestedList: List[NestedInteger]
        """
        self.nextItem = None
        self.stack = []
        for i in reversed(nestedList):
            self.stack.append(i)


    def next(self):
        """
        :rtype: int
        """
        if self.nextItem is None:
            self.hasNext()
        theNextItem, self.nextItem = self.nextItem, None
        return theNextItem

    def hasNext(self):
        """
        :rtype: bool
        """
        if self.nextItem:
            return True
        while self.stack:
            top:NestedInteger = self.stack.pop()
            if top.isInteger():
                self.nextItem = top.getInteger()
                return True
            else:
                for i in reversed(top.getList()):
                    self.stack.append(i)
        return False

nestedList = [[1,1],2,[1,1]]
i, v = NestedIterator(nestedList), []
while i.hasNext(): v.append(i.next())