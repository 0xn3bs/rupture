solution "Rupture"
	location "build"
	
	configurations { "Debug", "Release" }
	platforms { "Native", "x32", "x64" }
	
	targetdir "bin"

local EditorName = "RuptureEditor"
local DLLName = "RuptureDLL" 

local DXSDK = os.getenv("DXSDK_DIR")
local DXSDK_INCLUDE = DXSDK .. "/Include"
local DXSDK_LIB = DXSDK .. "/Lib"

project (EditorName)
	uuid "c8dab8ca-60c3-47ae-84a4-83eef4a6728f"
	kind "WindowedApp"
	flags { "WinMain" }
	language "C++"
	location "build"
	
	local PROJ_NAME = project.name()
	
	files { PROJ_NAME .. "/include/**.h", PROJ_NAME .. "/include/**.hpp", PROJ_NAME .. "/src/**.cpp" }
	
	includedirs( DLLName .. "/include" )
	includedirs( DXSDK_INCLUDE )
	
	libdirs { DLLName .. "/lib" }
	
	vpaths	
	{ 
		["Headers/*"] =	
		{ 
			PROJ_NAME .. "/include/**.h", 
			PROJ_NAME .. "/include/**.hpp" 
		},
		["Source/*"] =	
		{ 
			PROJ_NAME .. "/src/**.c", 
			PROJ_NAME .. "/src/**.cpp" 
		} 
	}
	
	configuration { "Debug" }
		debugdir "bin"
		targetname ( PROJ_NAME .. "_d" )
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
		targetname ( PROJ_NAME )
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
	
	local PROJ_NAME = project.name()
	
	files { PROJ_NAME .. "/include/**.h", PROJ_NAME .. "/include/**.hpp", PROJ_NAME .. "/src/**.cpp" }
	
	includedirs( PROJ_NAME .. "/include" )
	includedirs( DXSDK_INCLUDE )
	
	implibdir ( PROJ_NAME .. "/lib" )
	libdirs { DXSDK_LIB }
	
	vpaths	
	{ 
		["Headers/*"] =	
		{ 
			PROJ_NAME .. "/include/**.h", 
			PROJ_NAME .. "/include/**.hpp" 
		},
		["Source/*"] =	
		{ 
			PROJ_NAME .. "/src/**.c", 
			PROJ_NAME .. "/src/**.cpp" 
		} 
	}
	
	configuration { "Debug" }
		debugdir "bin"
		targetname ( PROJ_NAME .. "_d" )
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
		targetname ( PROJ_NAME )
		flags { "Optimize" }
		defines { "_RELEASE" }
		links { "d3d11", "d3dx11", "d3dx10" }
		
		configuration { "Native" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x32" }
			libdirs { DXSDK_LIB .. "/x86" }
			
		configuration { "x64" }
			libdirs { DXSDK_LIB .. "/x64" }