#ifndef REN_EXPORT_H__
#define REN_EXPORT_H__

#if defined(_WIN32) && !defined(__GNUC__) && !defined(_RUPTURE_LIB) && defined(_RUPTURE_DLL)
#define REN_DLL_EXPORT __declspec(dllexport)
#else
#define REN_DLL_EXPORT  
#endif

#endif
