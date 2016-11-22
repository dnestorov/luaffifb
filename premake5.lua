newoption {
	trigger = "luainc",
	description = "Path to lua.h",
	value = "PATH",
	default = "../lua5.3.3/src",
}

workspace "luaffifb"
   configurations { "Debug", "Release" }
 
project "libluaffifb"
   kind "StaticLib"
   language "C"
   targetdir "build/lib/%{cfg.buildcfg}"
   location "build" 
   
   includedirs { _OPTIONS["luainc"] or "../lua5.3.3" }

   files { "*.h", "*.c" }
   removefiles { "test.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On" 

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"