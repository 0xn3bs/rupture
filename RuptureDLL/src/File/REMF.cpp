#include "File/REMF.hpp"

#include <iostream>
#include <fstream>
#include <limits>

typedef std::numeric_limits<float> flt;

namespace REN
{
	void REMF::LoadREMF(const char *path)
	{
		FILE *pFile;
		pFile = fopen(path, "rb");

		if(pFile!=NULL)
		{
			char header[4];
			fread((char*)header, sizeof(char), 4, pFile);

			int numGeometries;
			int offGeometries;
			fread((int*)&numGeometries, sizeof(int), 1, pFile);
			fread((int*)&offGeometries, sizeof(int), 1, pFile);

			std::cout << "Number of Geometries: " << numGeometries << std::endl;
			std::cout << "Offset to Geometries: " << offGeometries << std::endl;

			fseek(pFile, offGeometries, SEEK_SET);
			for(int i = 0; i < numGeometries; ++i)
			{
				int pos = ftell(pFile);

				int idLength;
				fread((int*)&idLength, sizeof(int), 1, pFile);

				int nameLength;
				fread((int*)&nameLength, sizeof(int), 1, pFile);

				char* id = new char[idLength + 1];
				fread(id, sizeof(char), idLength, pFile);
				id[idLength] = 0;

				std::cout << "Geometry" << std::endl;

				std::cout << "\tId: " << id << std::endl;

				char* name = new char[nameLength + 1];
				if(nameLength > 0)
				{
					fread(name, sizeof(char), nameLength, pFile);
					name[nameLength] = 0;
					std::cout << "\tName: " << name << std::endl;
				}

				bool doubleSided;
				fread((bool*)&doubleSided, sizeof(bool), 1, pFile);
				std::cout << "\tDouble Sided: " << doubleSided << std::endl;

				int numPrimitives;
				fread((int*)&numPrimitives, sizeof(int), 1, pFile);
				std::cout << "\tNumber of Primitives: " << numPrimitives << std::endl;

				for(int j = 0; j < numPrimitives; ++j)
				{
					std::cout << "\tPrimitive" << std::endl;

					pos = ftell(pFile);
					int primitive_type;
					fread((int*)&primitive_type, sizeof(int), 1, pFile);

					switch(primitive_type)
					{
					case 1:
						std::cout << "\t\tType: Triangle Set" << std::endl;
						break;
					case 2:
						std::cout << "\t\tType: Line Set" << std::endl;
						break;
					case 3:
						std::cout << "\t\tType: Poly List" << std::endl;
						break;
					default:
						std::cout << "\t\tType: Unknown" << std::endl;
						break;
					};

					int primitive_bytes;
					fread((int*)&primitive_bytes, sizeof(int), 1, pFile);

					int numVertices;
					fread((int*)&numVertices, sizeof(int), 1, pFile);
					std::cout << "\t\tNumber of Vertices: " << numVertices << std::endl;

					int numIndices;
					fread((int*)&numIndices, sizeof(int), 1, pFile);
					std::cout << "\t\tNumber of Indices: " << numIndices << std::endl;

					fseek(pFile, ftell(pFile) + primitive_bytes - sizeof(numVertices) - sizeof(numIndices), SEEK_SET);
				}

				delete[] id;
				delete[] name;
			}
		}

		fclose(pFile);
	}
};
