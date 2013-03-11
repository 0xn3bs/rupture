from REMF.Primitive import Primitive

import struct

class TriangleSet(object):
    def __init__(self, primitive):
        self.__triSet = primitive
        pass

    def write(self, file):
        file.write(struct.pack("I", Primitive.TriangleSet))
        file.write(struct.pack("I", self.size()))
        file.write(struct.pack("I", len(self.__triSet.vertex)))
        file.write(struct.pack("I", len(self.__triSet.vertex_index)))
        file.write(self.__triSet.vertex)
        file.write(self.__triSet.vertex_index)

    def size(self):
        return 4 + 4 + 4*3*len(self.__triSet.vertex) + 4*3*len(self.__triSet.vertex_index)

    def __sizeof__(self):
        return super(TriangleSet, self).__sizeof__()
