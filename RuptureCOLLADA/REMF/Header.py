import struct

class Header(object):
    def __init__(self):
        self.magicNum = "REMF"
        self.numGeometries = 0
        self.offGeometries = 0

    def size(self):
        return len(self.magicNum) + 4 + 4

    def write(self, file):
        file.write(self.magicNum)
        file.write(struct.pack("I", self.numGeometries))
        file.write(struct.pack("I", self.offGeometries))
