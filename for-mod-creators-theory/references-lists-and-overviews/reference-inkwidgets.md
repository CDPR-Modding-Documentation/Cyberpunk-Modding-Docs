---
description: Common inkWidgets you might want to know about
---

# Reference: inkWidgets

## Summary

**Created:** Mar 1 2025 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")\
**Last documented update:** Mar 1 2025 by [Zhincore](https://app.gitbook.com/u/OsI9JXgCSSbt40hb327iBDif7Xv1 "mention")

This page lists and describes inkWidget components you might use in your custom UI.

{% include "../../.gitbook/includes/this-page-is-a-stub-if-yo....md" %}

### Hey, that's not what I want!

For elementary info about InkWidgets see:

{% content-ref url="../files-and-what-they-do/file-formats/inkwidgets-a-custom-interface.md" %}
[inkwidgets-a-custom-interface.md](../files-and-what-they-do/file-formats/inkwidgets-a-custom-interface.md)
{% endcontent-ref %}

For making UIs programatically see:

{% content-ref url="https://app.gitbook.com/s/fwsaoju1TBAUvMpI6NIw/how-do-i/inkwidgets" %}
[InkWidgets](https://app.gitbook.com/s/fwsaoju1TBAUvMpI6NIw/how-do-i/inkwidgets)
{% endcontent-ref %}

## Layout

These components handle layout and don't render anything themselves. They inherit [`inkCompoundWidget`, see NativeDB for details](https://nativedb.red4ext.com/c/6908765955958788).

### `inkCanvas`

Simply groups it's children, those can position themselves within the canvas.

### `inkFlex`&#x20;

_Probably_ similiar to [CSS Flexbox](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox)**?**

### `inkVerticalPanel`&#x20;



### `inkHorizontalPanel`&#x20;



## Graphics

These components render stuff on the screen. They inherit [`inkLeafWidget`, see NativeDB for details](https://nativedb.red4ext.com/c/7203179131496625).

### &#x20;[`inkText`](https://nativedb.red4ext.com/c/2864209969622273)&#x20;

Renders a text (WOW), can be set font family, size and others. [See NativeDB](https://nativedb.red4ext.com/c/2864209969622273).

### &#x20;[`inkRectangle`](https://nativedb.red4ext.com/s/1658767415789575)&#x20;

Renders a rectangle (no way??) with a set color.
