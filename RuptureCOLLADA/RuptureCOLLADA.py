from collada import *
mesh = Collada("blah/cube.dae")

f1=open('..\\bin\\assets\\models\\model.remf', 'wb')

f1.write('REMF')

geometry_list = mesh.geometries

print geometry_list[0].primitives[0][0]

for geometry in geometry_list:
    for primitive in geometry.primitives:
        for shape in primitive:
            if type(shape) is triangleset.Triangle:
                for vert in shape.vertices:
                    f1.write(vert)

f1.close()

raw_input("Press ENTER to exit...")
