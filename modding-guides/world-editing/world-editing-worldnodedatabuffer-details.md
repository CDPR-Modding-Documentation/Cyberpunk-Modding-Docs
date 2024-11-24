# World Editing: worldNodeDataBuffer details

## Summary

**Published:** Nov 10 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")\
Last documented update: Nov 24 by [Sergey](https://app.gitbook.com/u/N691cVEMA0Nmecc6QHIAM73aI0z1 "mention")

This page will explain the actual names and details of `worldNodeDataBuffer` in `.streamingsector` files

### Wait, this is not what I want!

* If you want to learn about [.](./ "mention"), please check the corresponding section.
* [NodeRefs](noderefs.md) explained.

You can find some info in **`<Cyberpunk 2077>\tools\redmod\metadata.json`**&#x20;

The actual class name of `worldNodeData` is `worldCompiledNodeInstanceSetupInfo`&#x20;

The actual fields names are:&#x20;

* `QuestPrefabRefHash`is `globalNodeId` (it can be created in nodeRefs block or reused already existing)&#x20;
* `MaxStreamingDistance` is `secondaryRefPointDistance`
* `UkFloat1` is `streamingDistance`&#x20;
* `Pivot` is `secondaryRefPointPosition`&#x20;
* `Bounds.Min` is `streamingRefPoint`&#x20;
* `Bounds.Max` is not listed, looks like there's no Box/Bounds, but two different vectors



(c) psiberx
