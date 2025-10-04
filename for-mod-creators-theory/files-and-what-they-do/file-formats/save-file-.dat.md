---
description: Description of and instructions for reading save file
---

# Save file: .dat

### Reading a Cyberpunk 2077 Save File

A Cyberpunk 2077 save file consists of an icon picture, a JSON file, and a sav.dat file. This sav.dat file is in a proprietary format, meaning you'll need to manually do some work to decode it.

**Crash-course terminology:**

* Node: A point on the node tree the game uses internally to represent and organize data
* Chunk: A block of [LZ4](https://en.wikipedia.org/wiki/LZ4_\(compression_algorithm\)) compressed information stored in the save file, usually containing node data
* [Magic number](https://en.wikipedia.org/wiki/Magic_number_\(programming\)): A 32-bit constant that's used to identify different sections of the save file. These appear reversed in the file because of [little endian byte ordering](https://en.wikipedia.org/wiki/Endianness), which you don't need to worry about.

The data in the save file isn't supposed to be human-comprehensible. Depending on the nature of your project, this may be fine, but don't get confused or concerned if the decompressed output still isn't human-readable.

#### In the beginning...

The file begins with a magic number, `CSAV` (`0x43534156`), followed by a file header. The header is as follows:

```
File Header
- Save version (4 bytes)
- Game version (4 bytes)
- Padding/unused/something else? (1 byte)
- Time (4 bytes, packed)
- Date (4 bytes, packed)
- Archive version (4 bytes)
```

Including the 4 byte `CSAV` magic number, the total size of the header should be **25 bytes** long. We'll talk about decoding the Date and Time later.

Then, there is a magic number, `CZLF` (`0x434C5A46`), denoting the beginning of the chunk directory. The next 4 bytes is a unsigned 32 bit integer denoting how many entries in the chunk directory there are.

Once you know how many chunks there are, you can read information about the chunks. The format is as follows.

```
Chunk Description:
- Location, stored as an offset from the beginning of the file (4 bytes)
- Compressed size (4 bytes)
- Decompressed size (4 bytes)
```

After the final block of chunk information, the file is padded with zeroes until the beginning of the first chunk.

#### Decompressing the chunks

Iterating through your list of chunk descriptions, once you've arrived at the offset for the chunk, you should find a magic number `CZLF` (`0x434C5A46`). The next 4 bytes is the decompressed size, again, so sanity check this with the value you read from the chunk's directory entry.

The chunk's compressed size includes this header and size information, so you'll want to copy the next _N - 8_ bytes from the file, where _N_ is the compressed size of the chunk, and make another buffer big enough to hold the decompressed information. Then pass your buffers and their sizes to an LZ4 decompression library and make sure no errors are returned.

Congratulations, you've decompressed the chunk. You'll likely want to output it to a file to search through, or you can manipulate the raw data as-is.

#### Reading the node information

The last 4 bytes of the file should be another magic number, `DONE` (`0x444F4E45`), and the 4 bytes before that is the location of the node descriptions.

After you've jumped to the beginning of the node description table, there's a magic number, `NODE` (`0x4E4F4445`). Following that, you'll need to read a packed integer denoting how many descriptions there are.

This number is stored in a proprietary CDPR format, though it's very closely based on [LEB128](https://en.wikipedia.org/wiki/LEB128), the only major difference being that CDPR's version builds its values out of the 0-5 bits of the byte, with the 6th bit determining if the value continues in the next byte, while LEB128 builds them out of the lower 0-6 bits and uses the 7th bit as the continuation bit. My C++ implementation that ignores the sign bit (maybe don't do that) is below:

```cpp
int read_packed_int(std::ifstream &reader) {
	int composite = 0;
	uint8_t read_byte = 0, shift = 0;
	
	do {
		reader.read((char *)&read_byte, 1);
		composite |= (read_byte & 0x3F) << shift; // take the 0-5 bits
		
		shift += 6; // move the shift over in anticipation of there being another byte, this is just useless if it's a 1 byte pack
	} while (read_byte & 0x40); // check the 6th bit for a continuation
	
	return composite;
}
```

Other save file parsers have other, more complex, but more technically correct implementations, but mine works well enough to read the one packed integer in the save file.

Once you know how many node descriptions there are, each entry follows the following pattern:

```
Node Description:
- Length of name (1 byte)
- Name (size is based on prior byte)
- Next node (4 bytes)
- Child node (4 bytes)
- Node offset (4 bytes)
- Node size (4 bytes)
```

Once you've read the size of the final node, you should be back at the position in the file where you read the location of the node descriptions from. Then, you may build the node tree and go digging through the chunks for the node data if you wish, but that's more than I wanted to get into.

#### Appendix: Decoding the date and time in the header

The time and date values in the header are packed, so here's some code that I used to decode them. There's nothing really clever here, it's just a matter of unpacking the individual parts.

```cpp
uint16_t year = (date >> 20);
uint8_t month = ((date >> 15) % 32) + 1;
uint8_t day = ((date >> 10) % 32) + 1;

uint8_t hour = (time >> 22);
uint8_t minute = ((time >> 16) & 63);
uint8_t second = ((time >> 10) & 63);
uint8_t ms = time & 1023;
```
