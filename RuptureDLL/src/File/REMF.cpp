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
			while (!feof(pFile)) 
			{
				float coordinate;
				fread((float*)&coordinate, sizeof(float), 1, pFile);
				std::cout.precision(flt::digits);
				std::cout << coordinate << std::endl;
			}
		}

		fclose(pFile);
	}
};
