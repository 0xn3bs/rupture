from REMF.Primitive import Primitive

import struct

class LineSet(object):
    def __init__(self, primitive):
        self.__linSet = primitive

    def write(self, file):
        file.write(struct.pack("I", Primitive.LineSet))
        file.write(struct.pack("I", self.size()))
        file.write(struct.pack("I", len(self.__linSet.vertex)))
        file.write(struct.pack("I", len(self.__linSet.vertex_index)))
        file.write(self.__linSet.vertex)
        file.write(self.__linSet.vertex_index)

    def size(self):
        return 4 + 4 + 4*3*len(self.__linSet.vertex) + 4*2*len(self.__linSet.vertex_index)
