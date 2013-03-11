import struct

class Geometry(object):
    def __init__(self):
        self.idLength = 0
        self.nameLength = 0
        self.id = ''
        self.name = ''
        self.double_sided = False
        self.numPrimitives = 0

    def size(self):
        return idLength + nameLength + len(self.id) + len(self.name) + 1 + 4

    def write(self, file):
        file.write(struct.pack("I", self.idLength))
        file.write(struct.pack("I", self.nameLength))
        file.write(self.id)
        file.write(self.name)
        file.write(struct.pack("?", self.double_sided))
        file.write(struct.pack("I", self.numPrimitives))
