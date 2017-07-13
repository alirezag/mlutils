--[[
    Summary: Implements common stats functions in torch.

    Author: Alireza Goudarzi
   
    alireza.goudarzi@gmail.com
    July 3, 2017



]]

package = "mlutils"
version = "1.0-0"
source = {
   url = "./",
   tag = "v1.0",
}
description = {
   summary = "Common stats functions.",
   detailed = [[
     Common stats functions.
   ]],
   homepage = "https://github.com/alirezag",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "torch >= 7.0",
}


build = {
   type = "builtin",
   modules = {
      mlutilinit = "mlutilinit.lua",
      mlutils = "mlutils.lua",
      
   }
}