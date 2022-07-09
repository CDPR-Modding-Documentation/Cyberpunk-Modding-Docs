# Modding RED4

## Introduction

REDengine supports modding natively. That's to say almost all mods can be added to the game directory _without_ the need to overwrite base game files. The following directory is used by Cyberpunk 2077 to load user-generated archive files.\
\
`...\Cyberpunk 2077\archive\pc\mod`\
\
Any file within an archive installed to this location will be loaded instead of the file within the original archives. New standalone files can be added with this method as well. Alphabetical order is the only way to have load priority between .archive files inside the \mod folder\


#### Example Mod

Let's imagine creating a mod to replace Judy's mesh with a new model. If the mesh `base/characters/judy/h_judy01.mesh` exists within the base game, we can create a custom archive with a new mesh by naming the replacement file identically and replicating the original path.\
\
Now let's say we want our replacement model to use a new texture that does not exist within the base game. We can achieve this by packing a texture (xbm file) within the same archive file. However this new texture must be linked within the replacement model. New files will have no effect of their own unless they are linked by an existing asset.
