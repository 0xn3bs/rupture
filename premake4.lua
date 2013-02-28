solution "Rupture"
	location "build"
	
	configurations { "Debug", "Release" }
	platforms { "Native", "x32", "x64" }
	
	targetdir "bin"
	
	local EditorName = "RuptureEditor"
	local DLLName = "RuptureDLL" 	
	vpaths { ["Headers"] = "**.h" }
	vpaths { ["Headers"] = "**.hpp" }
	vpaths { ["Source"] = "**.cpp" }
	
project (EditorName)
	uuid "c8dab8ca-60c3-47ae-84a4-83eef4a6728f"
	kind "WindowedApp"
	flags { "WinMain" }
	language "C++"
	location "build"
	files { project().name .. "/include/**.h", project().name .. "/include/**.hpp", project().name .. "/src/**.cpp" }
	
	includedirs( DLLName .. "/include" )
	libdirs { DLLName .. "/lib" }
	
	configuration "Debug"
		debugdir "bin"
		targetname ( project().name .. "_d" )
		links { DLLName .. "_d" }
		flags { "Symbols" }
		
	configuration "Release"
		debugdir "bin"
		targetname ( project().name )
		links { DLLName }
		flags { "Optimize" }

project (DLLName)
	uuid "00d17ec0-d4ad-42a6-b4f8-7352830bbe6f"
	kind "SharedLib"
	language "C++"
	location "build"
	files { project().name .. "/include/**.h", project().name .. "/include/**.hpp", project().name .. "/src/**.cpp" }
	
	includedirs( project().name .. "/include" )
	
	implibdir ( project().name .. "/lib" )
	
	configuration "Debug"
		debugdir "bin"
		targetname ( project().name .. "_d" )
		flags { "Symbols" }
		
	configuration "Release"
		debugdir "bin"
		targetname ( project().name )
		flags { "Optimize" }