---
description: What are CNames? How do they work?
---

# Dependency resolution

#### Summary

**Published**: Jan 05 2023 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

## How are dependencies resolved?

### rRef

Strongly recommended [flags](dependency-resolution.md#flags): `Default`

Represents a mandatory dependency that will be loaded **together** with the [reference holder](#user-content-fn-1)[^1] and is stored together with it. If reference fails to load, the resource holding it also fails to load.

If you use `Soft` flag, you risk causing game crashes. The only acceptable use of `Soft` flag in combination with `rRef` is for dynamic paths used in ArchiveXL that start with `*` character.

<details>

<summary>Why rRef with Soft flag can crash the game (technical detail)</summary>

{% code overflow="wrap" %}
```
to understand the problem, you need to know that although resources can be requested by any thread, only the main thread can use the wait function, which blocks the current thread until the resource is ready

all other threads must use async callbacks to wait for resources and are not allowed to block 

the resource fetch function uses the wait function to make sure the resource is loaded before returning the data

this means that if the game tries to fetch a resource that is not ready in any thread other than the main thread, it's a crash 

usually when resource is requested, the engine runs a specific for the current scenario chain of async callbacks to pre-load all necessary dependencies (other resources) 

when the loading chain is completed, the requester can fetch the resource with its dependencies without blocking on any thread (the blocking wait function will be skipped, since all necessary resources are already loaded) 

if you add an invalid dependency or something that the engine doesn't expect, it will be loaded without async waiting and hence there's a chance it will be accessed before it's ready (which leads to a blocking wait call and a crash) 

but accidentally it might just load in time, which is why this crash is so random and cane be hard to troubleshoot
```
{% endcode %}

[psiberx on Discord](https://discord.com/channels/717692382849663036/955663052903178270/1141371886429814865)

</details>

### raRef

Compatible [flags](dependency-resolution.md#flags): `Soft`

Represents a dependency where the [reference holder](#user-content-fn-2)[^2] is only pointing at a resource.



<figure><img src="../../.gitbook/assets/image (210).png" alt=""><figcaption></figcaption></figure>

## Flags

#### Default

Used by: [#rref](dependency-resolution.md#rref "mention")

Indicates that the engine should load the requested resource **together** with the [reference holder](#user-content-fn-3)[^3].

{% hint style="info" %}
Default is a recommended flag when you're unsure which flag to use.
{% endhint %}

#### Embedded

Used by: [#rref](dependency-resolution.md#rref "mention")

When a resource is flagged as embedded, it is directly included in the holder resource. However, resources flagged as embedded might not work as expected if they live in inplace resources.

#### Soft

Used by: [#raref](dependency-resolution.md#raref "mention")

This flag is used for resources that are not immediately mandatory. It seems to be a more flexible reference that does not load the resource immediately but points to where it can be found when needed. It's used in root entities for referencing .app files, for example.

#### Obligatory

Unknown, but probably a legacy artifact from Witcher3

#### Template

Unknown, but probably a legacy artifact from Witcher3

#### Inplace

Unknown, but probably a legacy artifact from Witcher3



[^1]: the file you're currently editing

[^2]: the file you're currently editing

[^3]: the file you're currently editing
