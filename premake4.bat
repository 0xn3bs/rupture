premake4.exe vs2010
:: Premake4 doesn't support VS2012 yet
:: this is a REALLY bad hack to get VS2012 projects.
:: BatchSubstitute.bat "<PlatformToolset>v100</PlatformToolset>" "<PlatformToolset>v110</PlatformToolset>" "build/RuptureDLL.vcxproj"
:: BatchSubstitute.bat "<PlatformToolset>v100</PlatformToolset>" "<PlatformToolset>v110</PlatformToolset>" "build/RuptureEditor.vcxproj"
