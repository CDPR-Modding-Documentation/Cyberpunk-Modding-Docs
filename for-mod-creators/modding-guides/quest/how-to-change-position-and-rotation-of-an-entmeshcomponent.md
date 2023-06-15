---
description: >-
  Guide made by Forsentio with the help of Loomy, PixelRick and Sombra - Team
  members working on various projects at RED Modding Tools.
---

# How to Change Position and Rotation of an entMeshComponent

## Summary:

We will guide you through the step-by-step process that will allow you to rotate and position differently the **duvet** above V's bed, so that it flows with how the sleep animation plays out.

## Requirements:

* [CP77Tools](https://github.com/WolvenKit/CP77Tools/releases).
* [Cyberpunk Save Editor (CPSE) v0.5.5-dev](https://github.com/PixelRick/CyberpunkSaveEditor/releases/tag/v0.5.5-dev).
* Some basic knowledge about modding Cyberpunk 2077.

## The Steps:

\
**1**. Unbundle and uncook **basegame\_3\_nightcity.archive, basegame\_4\_gamedata.archive.**\
**2**. Find the entity you want to modify (in our case it's located here "**basegame\_3\_nightcity\base\quest\minor\_quests\mq000\entities"**)\
**3**. Once you have the entity open its buffer in the **Cyberpunk Save Editor** by dragging and dropping it inside.\
**4**. Open the **entMeshComponent** that has the **same name** as the **mesh** you want to modify (in our case is **3 entMeshComponent "**_**bed\_duvet\_poor**_**"**).\
**5**. Open the **localTrasnform array**, and inside of it **Position and Orientation**; you're going to see different values.\
**IMPORTANT NOTE**: **ijkr** are to be read as **xyzw**, \*\*\*\* where **z** is front/backword, **x** is left/rigth, **y** up/down.\
**6**. Edit those values accordingly to how you want the **entMeshComponent** to appear in game (_this is where experimenting is encouraged until you get the result you want_ )\
**IMPORTANT**: For a better understanding of how your changes may affect the ingame position and rotation use this [**website**](https://quaternions.online/) (kindly provided by **Loomy**)\
**7**. **Repack, Build** and put into the **Mod** folder

![](../../../.gitbook/assets/wkit\_wiki\_qEd\_res\_Duvet\_result.png)
