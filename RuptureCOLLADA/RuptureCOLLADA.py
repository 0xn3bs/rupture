from REMF import *

from collada import *
collada = Collada("testing/sketchup_house.dae")

f1=open('..\\bin\\assets\\models\\model.remf', 'wb')

header = Header()
header.numGeometries = len(collada.geometries)
header.offGeometries = header.size()
header.write(f1)

for geometry in collada.geometries:
    geo = Geometry()
    geo.idLength = len(geometry.id)
    geo.id = geometry.id
    geo.nameLength = len(geometry.name)
    geo.name = geometry.name
    geo.double_sided = geometry.double_sided
    geo.numPrimitives = len(geometry.primitives)
    geo.write(f1)
    for primitive in geometry.primitives:
        if type(primitive) is triangleset.TriangleSet:
            triset = TriangleSet(primitive)
            triset.write(f1)
        elif type(primitive) is lineset.LineSet:
            linset = LineSet(primitive)
            linset.write(f1)

#geometry_list = mesh.geometries

#print geometry_list[0].primitives[0][0]

#for geometry in geometry_list:
#    for primitive in geometry.primitives:
#        for shape in primitive:
#            if type(shape) is triangleset.Triangle:
#                for vert in shape.vertices:
#                    f1.write(vert)

f1.close()

raw_input("Press ENTER to exit...")
