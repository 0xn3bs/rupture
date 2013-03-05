solution "Rupture"
	location "build"
	
	configurations { "Debug", "Release" }
	platforms { "Native", "x32", "x64" }
	
	targetdir "bin"
	
local EXTLIBS = "extlibs"

local BuilderName = "RuptureBuilder"
local EditorName = "RuptureEditor"
local DLLName = "RuptureDLL" 

local DXSDK = os.getenv("DXSDK_DIR")
local DXSDK_INCLUDE = DXSDK .. "/Include"
local DXSDK_LIB = DXSDK .. "/Lib"

project (BuilderName)
	uuid "ba88416e-0b2b-438e-8983-5b4524e131ac"
	kind "WindowedApp"
	language "C++"
	location "build"
	
	files 
	{
		project().name .. "/include/**.h", 
		project().name .. "/include/**.hpp", 
		project().name .. "/src/**.cpp",
	}
	
	includedirs( DLLName .. "/include" )
	includedirs( DXSDK_INCLUDE )
	
	libdirs { DLLName .. "/lib" }
	
	vpaths	
	{ 
		["Headers/*"] =	
		{ 
			project().name .. "/include/**.h", 
			project().name .. "/include/**.hpp" 
		},
		["Source/*"] =	
		{ 
			project().name .. "/src/**.c", 
			project().name .. "/src/**.cpp" 
		} 
	}
	
	configuration { "Debug" }
		debugdir "bin"
		targetname ( project().name .. "_d" )
		links { DLLName .. "_d" }
		flags { "Symbols" }
		defines { "_DEBUG" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }
			
	configuration { "Release" }
		debugdir "bin"
		targetname ( project().name )
		links { DLLName }
		flags { "Optimize" }
		defines { "_RELEASE" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }
	
project (EditorName)
	uuid "c8dab8ca-60c3-47ae-84a4-83eef4a6728f"
	kind "WindowedApp"
	flags { "WinMain" }
	language "C++"
	location "build"
	
	files { project().name .. "/include/**.h", project().name .. "/include/**.hpp", project().name .. "/src/**.cpp" }
	
	includedirs( DLLName .. "/include" )
	includedirs( DXSDK_INCLUDE )
	
	libdirs { DLLName .. "/lib" }
	
	vpaths	
	{ 
		["Headers/*"] =	
		{ 
			project().name .. "/include/**.h", 
			project().name .. "/include/**.hpp" 
		},
		["Source/*"] =	
		{ 
			project().name .. "/src/**.c", 
			project().name .. "/src/**.cpp" 
		} 
	}
	
	configuration { "Debug" }
		debugdir "bin"
		targetname ( project().name .. "_d" )
		links { DLLName .. "_d" }
		flags { "Symbols" }
		defines { "_DEBUG" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }
			
	configuration { "Release" }
		debugdir "bin"
		targetname ( project().name )
		links { DLLName }
		flags { "Optimize" }
		defines { "_RELEASE" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }

project (DLLName)
	uuid "00d17ec0-d4ad-42a6-b4f8-7352830bbe6f"
	kind "SharedLib"
	language "C++"
	location "build"
	defines { "_RUPTURE_DLL" }

	files { project().name .. "/include/**.h", project().name .. "/include/**.hpp", project().name .. "/src/**.cpp" }
	
	includedirs( project().name .. "/include" )
	includedirs( DXSDK_INCLUDE )
	
	implibdir ( project().name .. "/lib" )
	libdirs { DXSDK_LIB }
	
	vpaths	
	{ 
		["Headers/*"] =	
		{ 
			project().name .. "/include/**.h", 
			project().name .. "/include/**.hpp" 
		},
		["Source/*"] =	
		{ 
			project().name .. "/src/**.c", 
			project().name .. "/src/**.cpp" 
		} 
	}
	
	configuration { "Debug" }
		debugdir "bin"
		targetname ( project().name .. "_d" )
		flags { "Symbols" }
		defines { "_DEBUG" }
		links { "d3d11", "d3dx11", "d3dx10" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }
			
	configuration { "Release" }
		debugdir "bin"
		targetname ( project().name )
		flags { "Optimize" }
		defines { "_RELEASE" }
		links { "d3d11", "d3dx11", "d3dx10" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }
