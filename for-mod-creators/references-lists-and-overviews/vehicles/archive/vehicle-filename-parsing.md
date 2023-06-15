# Vehicle Filename Parsing

Referenced from `base\appearances_mappings.json`, `base\vehicles\vehicle_filename_parsing.json` contains a regex string is defined that outlines the allowable file names for .ent files ([play around with this regex here](https://regex101.com/r/LYUZLN/1/)):

```
(?:v_)?([a-zA-Z]+|av)\d?_([a-zA-Z]+)_(?:[a-zA-Z]+(?:_[a-zA-Z]+)*)__(?:int|ext)\d{2}_([a-zA-Z]+(?:_[a-zA-Z]+)*)_\d{2}.*\.ent
```

For a filename like `v_sport2_mizutani_shion__ext01_body_01.ent`, this would match the following groups:

* `Group 1: sport`
* `Group 2: mizutani`
* `Group 3: body`

| Group 1 (base) | Name     |
| -------------- | -------- |
| `av`           | `Aerial` |
| `sport`        | `Car`    |
| `standard`     | `Car`    |
| `utility`      | `Car`    |

| Group 2 (category) | Name           |
| ------------------ | -------------- |
| `Mahir`            | `Mahir Motors` |

Group 3 has no mapping, is of the type `partType`.

Curiously, this regex doesn't work for vehicles such as the Type 66, or the 911, since numbers aren't permitted in Group 2. It's unknown if this is even used, or if there is replacing done at some point.
