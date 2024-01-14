# Liquid material properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page documents liquid shaders and their properties.&#x20;

* For an **explanation** of material properties and further links, see [.](./ "mention")

## Liquid

Cyberpunk has its own liquid shader(s) such as `base\materials\fillable_fluid_vertex.mt`. Projecting this material onto a submesh will turn the submesh into a transparent container filled with the liquid you specified. If you flip the container on its head, the fluid will drain to the bottom and fill it up again.

To control the offsets, you need to adjust the vectors FluidBoundingBoxMax and FluidBoundingBoxMin.

It shares various properties (such as IOR, FresnelBias, BlurRadius) with the [glass shader](liquid-material-properties.md#glass).

<table><thead><tr><th width="291"></th><th></th></tr></thead><tbody><tr><td>TintColor</td><td>liquid's color as RGB (copy from e.g. <code>mi_neokitsch_fridge_z_emissive.mi</code>). </td></tr><tr><td>FillAmount</td><td>float, e.g.<code>0.0</code>: Probably works in combination with the bounding box. You'll have to experiment.</td></tr><tr><td>FluidBoundingBoxMin<br>FluidBoundingBoxMax</td><td>Vectors (X, Y, Z, W) controlling the maximum distance from the container's walls. Each value is a float (decimal) speficying the axis in question - you'll simply have to play around with them (you can ignore W). <br><br>For a bottle material I've used <br>Max: 0.03, 0.03, 0.155<br>Min: -0.03, -0.03, 0.09</td></tr></tbody></table>

Find a ready-to use (black) liquid .mi file [here](https://mega.nz/file/yVkkjRKS#ii5dB7P1OcwLk-VIBKiU9Ou31dloSO7k1hjEryAj9Ok).
