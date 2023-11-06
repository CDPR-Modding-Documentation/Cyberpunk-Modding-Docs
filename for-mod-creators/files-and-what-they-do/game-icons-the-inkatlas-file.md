# Game icons: The inkatlas file

{% hint style="success" %}
Apart has prepared a reference project with an import-ready inkatlas. You can download it [here](https://mega.nz/file/vUUDEQxS#w66XKJ7acIsnXuJcOBEwPPDcm4GFtSa06MzZccAaX8Y).
{% endhint %}

## Summary

The .inkatlas is a map file that slices [**textures**](../textures/) into slots, which are then used by the game for pretty much everything that is a picture - from your HUD to peoples' phone avatars to item preview icons in shops or custom atelier images. \
Other game engines use pixel coordinates for slicing images into sprites. But Inkatlas use percents of width and  height of the image, from 0 to 1 with starting point in TOP-LEFT corner. This allows to change the source image even on the fly for different specs and requirements.  Using bottom-left and right-top points for recreate the square of sprite. \
For example: two sprites in column will be written as:\
(y 0,5; x 0) X (x 1; y 0) for upper sprite and (y 1; x0) X (x 1; y 0,5) for lower

## Guides

For a guide how to create custom icon previews, see [here](../modding-guides/custom-icons-and-ui/adding-items-preview-images/).

For a guide how to create a custom Atelier icon, see [here](../modding-guides/everything-else/adding-items-atelier-integration.md#generating-an-icon).



## Tool

[https://github.com/deadlymustard/inkatlas-utils](https://github.com/deadlymustard/inkatlas-utils)\
useful tool for packing the sprites and\or make custom inkatlas.
