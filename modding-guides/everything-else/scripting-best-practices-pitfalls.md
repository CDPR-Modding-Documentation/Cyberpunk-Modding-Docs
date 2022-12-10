---
description: A collection of code-related knowledge
---

# Scripting: Best practices / pitfalls

## LUA

### Fixing/preventing nil access

LUA throws an exception if it encounters `nil` in unexpected places. The corresponding error will look like this:

<pre><code><strong>attempt to access local '&#x3C;variable name>' (a nil value)
</strong>stack traceback: 
  my_example.lua:1234 in function 'MyFunctionName
</code></pre>

Open the corresponding file, find the correct line, and check what is being accessed there. It will look like `variable.property`, or perhaps something will be concatenated to a string (`"something something text" .. variable`).&#x20;

You can assign a **default value** to the property in question:&#x20;

```
myString = <original string assignment> or ""
myNumber = <original number assignment> or 0
myEverythingElse = <original object assignment> or {}
```

{% hint style="info" %}
While that won't solve any other problems, it will at least make the error go away.
{% endhint %}

