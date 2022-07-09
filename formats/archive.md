# Archive

Information about the .archive file format

### File Structure

| Name        | Type/Size                           | Info                                                                            |
| ----------- | ----------------------------------- | ------------------------------------------------------------------------------- |
| Header      | [Header](archive.md#undefined)      | See [specification of Header](archive.md#undefined) below.                      |
| Custom Data | [Custom Data](archive.md#undefined) | WolvenKit only. See [specification of custom data](archive.md#undefined) below. |
| Files       | data                                | Raw file data                                                                   |
| File List   | [File List](archive.md#undefined)   | See [specification of file list](archive.md#undefined) below.                   |

### Header

| Name             | Type/Size | Info                              |
| ---------------- | --------- | --------------------------------- |
| Magic            | char\[4]  | Constant: "RDAR"                  |
| Version          | uint32    | Currently 12                      |
| IndexPosition    | uint64    | Offset of beginning of file list  |
| IndexSize        | uint32    | Size of file list                 |
| DebugPosition    | uint64    | Always 0                          |
| DebugSize        | uint32    | Always 0                          |
| Filesize         | uint64    | Size of file (excluding Filesize) |
| CustomDataLength | uint32    | **WolvenKit only**                |

### Custom Data (WolvenKit)

The following data only applies for archives created with WolvenKit

| Name        | Type/Size           | Info                      |
| ----------- | ------------------- | ------------------------- |
| Magic       | char\[4]            | Constant: "LXRS"          |
| Version     | uint32              | Currently 1               |
| Size        | int32               | Size of uncompressed data |
| ZSize       | int32               | Size of compressed data   |
| PathCount   | int32               | Number of custom paths    |
| PathStrings | zstring\[PathCount] | Custom file paths         |

### File List

| Name                    | Type/Size                                               | Info                                                              |
| ----------------------- | ------------------------------------------------------- | ----------------------------------------------------------------- |
| FileTableOffset         | uint32                                                  | Always 8                                                          |
| FileTableSize           | uint32                                                  |                                                                   |
| CRC                     | uint64                                                  | Checksum of ???                                                   |
| FileEntryCount          | uint32                                                  | Number of files                                                   |
| FileSegmentCount        | uint32                                                  | Number of file segments                                           |
| ResourceDependencyCount | uint32                                                  | Number of resource dependencies                                   |
| FileRecords             | [File Record](archive.md#file-record)\[FileEntryCount]  | See [specification of file record](archive.md#file-record) below. |
| FileSegments            | [File Segment](archive.md#undefined)\[FileSegmentCount] | See [specification of file segment](archive.md#undefined) below.  |
| ResourceDependencies    | uint64\[ResourceDependencyCount]                        |                                                                   |

### File Record

| Name                      | Type/Size  | Info                                                    |
| ------------------------- | ---------- | ------------------------------------------------------- |
| NameHash64                | uint64     | FNV1A64 hash of the filename                            |
| Timestamp                 | int64      | Windows filetime of file creation                       |
| NumInlineBufferSegments   | uint32     | Number of inline buffers                                |
| SegmentsStart             | uint32     | Index of the first [file segment](archive.md#undefined) |
| SegmentsEnd               | uint32     | Index of the last [file segment](archive.md#undefined)  |
| ResourceDependenciesStart | uint32     | Index of the first resource dependency                  |
| ResourceDependenciesEnd   | uint32     | Index of the last resource dependency                   |
| SHA1Hash                  | uint8\[20] | SHA1 hash of the file                                   |

### File Segment

| Name   | Type/Size | Info                      |
| ------ | --------- | ------------------------- |
| Offset | uint64    | Offset of the data        |
| ZSize  | uint32    | Size of compressed data   |
| Size   | uint32    | Size of uncompressed data |
