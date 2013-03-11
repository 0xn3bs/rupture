#ifndef REN_VECTOR3_H__
#define REN_VECTOR3_H__

#include <math.h>
#include <ostream>
#include <cassert>

#include "Export.hpp"

template <class T>
class REN_DLL_EXPORT Vec3
{
public:
	T x, y, z;

	Vec3()
	{
		x = y = z = 0;
	}

	Vec3(const T x, const T y, const T z)
	{
		this->x = x;
		this->y = y;
		this->z = z;
	}

	~Vec3()
	{
	}

	T Magnitude()
	{
		return sqrt(x*x + y*y + z*z);
	}

	T DotProduct(const Vec3 &vec3)
	{
		return (vec3.x * x) + (vec3.y * y) + (vec3.z * z);
	}

	Vec3<T> Normalize()
	{
		return Vec3(*this)/=Magnitude();
	}

	Vec3<T> CrossProduct(const Vec3 &vec3)
	{
		return 
			Vec3<T>((this->y * vec3.z - this->z * vec3.y), 
			(this->z * vec3.x - this->x * vec3.z),
			(this->x * vec3.y - this->y * vec3.x));
	}

	Vec3<T> &operator=(const Vec3<T> &rhs)
	{
		x = rhs.x;
		y = rhs.y;
		z = rhs.z;
		return *this;
	}

	Vec3<T> &operator+=(const T rhs) 
	{
		x += rhs;
		y += rhs;
		z += rhs;
		return *this;
	}

	Vec3<T> operator+(const T rhs) const
	{
		return Vec3(*this)+=rhs;
	}

	Vec3<T> &operator+=(const Vec3<T> &rhs) 
	{
		x += rhs.x;
		y += rhs.y;
		z += rhs.z;
		return *this;
	}

	Vec3<T> operator+(const Vec3<T> &rhs) const
	{
		return Vec3(*this)+=rhs;
	}

	Vec3<T> &operator-=(const Vec3<T> &rhs) 
	{
		x -= rhs.x;
		y -= rhs.y;
		z -= rhs.z;
		return *this;
	}

	Vec3<T> operator-(const Vec3<T> &rhs) const
	{
		return Vec3(*this)-=rhs;
	}

	Vec3<T> &operator*=(const T rhs)
	{
		x *= rhs;
		y *= rhs;
		z *= rhs;
		return *this;
	}

	Vec3<T> operator*(const T rhs) const
	{
		return Vec3(*this)*=rhs;
	}

	Vec3<T> &operator*=(const Vec3<T> &rhs)
	{
		*this = DotProduct(rhs);
		return *this;
	}

	Vec3<T> operator*(const Vec3<T> &rhs) const
	{
		return Vec3(*this)*=rhs;
	}

	Vec3<T> &operator/=(const T rhs)
	{
		x /= rhs;
		y /= rhs;
		z /= rhs;
		return *this;
	}

	Vec3<T> operator/(const T &rhs) const
	{
		return Vec3(*this)/=rhs;
	}

	//	Cross product
	Vec3<T> &operator%=(const Vec3<T> &rhs) 
	{
		*this = CrossProduct(rhs);
		return *this;
	}

	Vec3<T> operator%(const Vec3<T> &rhs) const
	{
		return Vec3(*this)%=rhs;
	}

	T& operator[] (unsigned int i)
	{
		if(i > 2)
		{
			std::cerr << "Vec3 subscript out of range";
			throw SUBCRIPT_OUT_OF_RANGE;
		}

		return i == 0 ? x : i == 1 ? y : z;
	}

	Vec3<int> ToInts()
	{
		return Vec2<int>(this->x, this->y, this->z);
	}

	Vec3<float> ToFloats()
	{
		return Vec2<float>(this->x, this->y, this->z);
	}

	Vec3<double> ToDoubles()
	{
		return Vec2<double>(this->x, this->y, this->z);
	}

	friend std::ostream &operator<<(std::ostream &stream, Vec3<T> rhs)
	{
		stream << "<" << rhs.x << ", " << rhs.y << ", " << rhs.z << ">";
		return stream;
	}
};

#endif
