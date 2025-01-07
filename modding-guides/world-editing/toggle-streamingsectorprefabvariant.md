---
description: Mana, make it pretty pls
---

# Toggle streamingSectorPrefabVariant

Gathering pieces of info about how to define and use this stuff



`streamingsector`files have an array of `variants`which you can define

in wkit (right now) its calling `variantIndicies`

<figure><img src="../../.gitbook/assets/image (549).png" alt=""><figcaption></figcaption></figure>

to define a new `variant`you need to edit your `.streamingblock`file

<figure><img src="../../.gitbook/assets/image (550).png" alt=""><figcaption></figcaption></figure>

where:

`name`is the name of the variant

`nodeRef`its nodRef

`rangeIndex`is an index in `variantIndices`

`variantIndices` divides node list into ranges

<figure><img src="../../.gitbook/assets/image (552).png" alt=""><figcaption><p>all.streamingblock</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (551).png" alt=""><figcaption><p>example of vanila streamingsector</p></figcaption></figure>

in this case `1` is the last range starting with node index `873` and to the end

if there was another entry in `varianIndices`, then range will be to the next node index there

e.g. range `0` here is nodes `0` to `872` \


then to use it you can either use .questphases or redscript/cet (codeware)

[https://github.com/psiberx/cp2077-codeware/wiki#controlling-prefabs-and-variants](https://github.com/psiberx/cp2077-codeware/wiki#controlling-prefabs-and-variants)
