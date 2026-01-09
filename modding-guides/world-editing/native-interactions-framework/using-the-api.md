---
description: This page explains how to use the NIF API to toggle projects
---

# Using the API

## Overview

* NIF comes with a CET and Redscript API, allowing other mods to either:
  * Enable / disable a specific project (Project name is used as identifier)
  * Enable / disable all projects
* This can be used for e.g. compatibility

## CET API

```lua
-- Disabled state is lost upon game restart, but kept when loading a different save

-- Toggle all interactions
GetMod("nativeInteractions").api.toggleAll(true)
GetMod("nativeInteractions").api.toggleAll(false)

-- Toggle interactions of a specific project
GetMod("nativeInteractions").api.toggleProject("projectName", true)
GetMod("nativeInteractions").api.toggleProject("projectName", false)

```

## Redscript API

```swift
Game.GetScriptableServiceContainer():GetService("NativeInteractions"):ToggleAll(false)
Game.GetScriptableServiceContainer():GetService("NativeInteractions"):ToggleAll(true)

Game.GetScriptableServiceContainer():GetService("NativeInteractions"):ToggleProject("projectName", false)
Game.GetScriptableServiceContainer():GetService("NativeInteractions"):ToggleProject("projectName", true)
```
