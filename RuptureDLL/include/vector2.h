#ifndef __VECTOR2_H__
#define __VECTOR2_H__

#include <math.h>
#include <ostream>
#include <cassert>

class _declspec(dllexport) Vec2
{
public:
	double x, y;

	inline Vec2()
	{
		x = y = 0;
	}

	inline Vec2(const double x, const double y)
	{
		this->x = x;
		this->y = y;
	}

	inline double Magnitude() const
	{
		return sqrt(x*x + y*y);
	}

	inline double DotProduct(const Vec2 &vec2) const
	{
		return (vec2.x * x) + (vec2.y * y);
	}

	inline Vec2 & operator=(const Vec2 &rhs)
	{
		x = rhs.x;
		y = rhs.y;
		return *this;
	}

	inline Vec2 &operator+=(const double rhs) 
	{
		x += rhs;
		y += rhs;
		return *this;
	}

	inline Vec2 operator+(const double rhs) const
	{
		return Vec2(*this)+=rhs;
	}

	inline Vec2 &operator+=(const Vec2 &rhs) 
	{
		x += rhs.x;
		y += rhs.y;
		return *this;
	}

	inline Vec2 operator+(const Vec2 &rhs) const
	{
		return Vec2(*this)+=rhs;
	}

	inline Vec2 &operator-=(const Vec2 &rhs) 
	{
		x -= rhs.x;
		y -= rhs.y;
		return *this;
	}

	inline Vec2 operator-(const Vec2 &rhs) const
	{
		return Vec2(*this)-=rhs;
	}

	inline Vec2 &operator*=(const double rhs)
	{
		x *= rhs;
		y *= rhs;
		return *this;
	}

	inline Vec2 operator*(const double rhs) const
	{
		return Vec2(*this)*=rhs;
	}

	inline Vec2 &operator*=(const Vec2 &rhs)
	{
		*this *= DotProduct(rhs);
		return *this;
	}

	inline Vec2 operator*(const Vec2 &rhs) const
	{
		return Vec2(*this)*=rhs;
	}

	inline Vec2 &operator/=(const double rhs)
	{
		x /= rhs;
		y /= rhs;
		return *this;
	}

	inline Vec2 operator/(const double rhs) const
	{
		return Vec2(*this)/=rhs;
	}

	inline double operator[] (const size_t i) const
	{
		assert( i < 2 );
		return *(&x+i);
	}

	inline double& operator[] (const size_t i)
	{
		assert( i < 2 );
		return *(&x+i);
	}

	inline _declspec(dllexport) friend std::ostream &operator<<(std::ostream &stream, Vec2 rhs)
	{
		stream << "Vector2(" << rhs.x << ", " << rhs.y << ")";
		return stream;
	}
};

#endif  /*VECTOR_H_*/
