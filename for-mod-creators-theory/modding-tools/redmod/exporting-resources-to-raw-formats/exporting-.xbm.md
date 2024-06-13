# Exporting .xbm

REDmod can export REDengine .xbm files to several raw formats for editing.

dds: DirectDraw Surface                                                                                                        bmp: Windows Bitmap                                                                                                             jpg: Joint Photographics Experts Group                                                                                  tga: Truevision Targa                                                                                                                 png: Portable Network Graphics

XBM PARAMETERS

```
    -bitmap-mipmap=<uint>           - mipmap selection

    -bitmap-source=<bool>           - export uncooked file (default = false)

    -bitmap-flip=<bool>             - flip texture (default = false)

    -bitmap-gamma=<bool>            - forced gamma setting (default = false)
```

{% code overflow="wrap" %}
```
redmod resource-export -depot="M:\" -input="base\test\example.xbm" -output="M:\base\test\example.png" -bitmap-flip=true
```
{% endcode %}

{% hint style="warning" %}
you can also export textures using the wolvenkit gui (recommended)
{% endhint %}
