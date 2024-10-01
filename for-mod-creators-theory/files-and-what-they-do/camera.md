# Camera

## Summary

Published: Oct 01 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention"), based on research by Cindefalla

The game measures FOV horizontally on foot while it's measured vertically for vehicle first person.

I figured this out after setting the FOV for vehicles, as well as the enter and exit animation to 90, while setting on-foot to 120. And there was no FOV shift. 120 Horizontal = 89 vertical based on a 16:9 aspect ratio.

If you were to set all vehicle FOV values to the same as on-foot, e.g., 120. the FOV shifts to a wider horizontal FOV, which should be 144 in this example.

Aspect ratio doesn't affect vertical FOV in cyberpunk so I presume it uses Hor+ scaling like most games
