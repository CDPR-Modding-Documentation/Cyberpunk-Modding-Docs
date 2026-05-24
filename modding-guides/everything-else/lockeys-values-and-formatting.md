---
description: How to use values (and colours) in translation entries
---

# LocKeys: Values and formatting

## Summary

Created: May 24 2026 by [Leefekyn](https://app.gitbook.com/u/ddXBu8fy8WPBMk81Oe1BZokadiI3 "mention")\
Last documented edit: May 24 2026 by [Leefekyn](https://app.gitbook.com/u/ddXBu8fy8WPBMk81Oe1BZokadiI3 "mention")

This page will show you how to use values (and colours) in translation entries

## LocKey interpolation at runtime

LocKey files support the use of certain variables (i.e. {float\_#} and {stat\_#}), and this can be seen in many descriptions in the games files. The LocKey file also has the ability to set colors, text style, and text size using Rich Values.

The Gorilla Arms Cyberware uses a couple of these to change text color and display stats:&#x20;

```html
<Rich color="TooltipText.cyberwareDescriptionHighlightColor" style="Semi-Bold">Gorilla Arms</> are lightweight, efficient and hard-hitting arm replacement cyberware.\n\n+{stat_0} to <Rich color="TooltipText.cyberwareDescriptionHighlightColor" style="Semi-Bold">Body</> 
```

Defining Floats and Stats:&#x20;

<pre class="language-yaml" data-overflow="wrap"><code class="lang-yaml">UIData:
<strong>  localizedDescription: #YOUR LOCKEY FILE 
</strong>  floatValues: #these are defined values, usually used to show effects 
    - 1 
    - 2 
    - 3 
<strong>  stats: #these are the variables used by the game, usually to show the result of effects 
</strong><strong>    - BaseStats.AttunementHelper #{stat_0} 
</strong><strong>    - BaseStats.AttunementHelper2 #{stat_1} 
</strong><strong>    - BaseStats.AttunementHelper3 #{stat_2}
</strong></code></pre>

You can also use hex format colors instead of the predefined table of colors in certain locations by using:&#x20;

{% code overflow="wrap" %}
```html
 <Rich color="HEX-CODE-HERE"> YOUR TEXT HERE </>
```
{% endcode %}

You can combine a couple of these effects, and in certain text locations, change the color of text dynamically based on a stat value. This is done by defining a stat variable (i.e, {stat\_0}), then using that stat variable in the hex code for the color. The end result should look something like this:&#x20;

{% code overflow="wrap" %}
```html
<Rich size="26" Rich color="{stat_0}9999" style="Semi-Bold"> YOUR TEXT HERE</> 
```
{% endcode %}

This allows a stat to replace the first few digits of the hex code, and display a different color than originally shown. From my testing these variables are a little more strict in how they are put in, and have only had success when defining any changes to the variable at the item level via stat modifiers (either constant or combined). There are also a few irregularities when defining and using this system.&#x20;

In this example the first 2 digits from the hex are absent and being replaced with the given stat:&#x20;

\#\_ \_9999&#x20;

-2 Digit variables here work as expected here.

-3 Digit variables here push out the final 9 from the hex code, and use the whole 3 digit variable at the start.&#x20;

-4 Digits and beyond only use the last 2 digits.&#x20;

-Decimals also work, and I believe they always use the last 2 digits in the variable but this needs more testing. Seems like they work up to 3 decimal places, and it selects the last 2 in this instance.
