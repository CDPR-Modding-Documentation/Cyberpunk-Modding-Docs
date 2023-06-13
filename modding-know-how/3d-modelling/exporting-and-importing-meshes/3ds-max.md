---
description: 3ds Max Workflow for Cyberpunk 2077
---

# with 3DS MAX (archived)

## **Requirements:**

\
\- 3ds Max 2014-2022\
\- [WolvenKit.CLI / CP77Tools](https://github.com/WolvenKit/WolvenKit/releases)\
\- [Noesis (64-bit)](https://richwhitehouse.com/index.php?content=inc\_projects.php)\
\- [AlphaZomega's Noesis Plugin and MaxScript](https://www.mediafire.com/file/uhc9d68mvj7oqj6/fmt\_CP77mesh\_1.6.zip/file)

## **Setup:**

\
\- Unbundle the game files with WolvenKit.CLI (aka CP77Tools)\
\- Install Noesis and rename Noesis64.exe to Noesis.exe (The original noesis.exe is 32-bit and the Noesis Plugin "fmt\_CP77mesh.py" needs 64-bit)\
\- Place "fmt\_CP77mesh.py" in "noesis\plugins\python" copy "oo2ext\_7\_win64.dll" from "Cyberpunk 2077\bin\x64" and place it in the same folder as "fmt\_CP77mesh.py"\
The plugin has some customization option if you open it in a text editor.\
Recommended Settings are:

![](<../../../.gitbook/assets/image (6) (1) (1).png>)

\
\- Next place "CP77\_NOESIS\_CMD.ms" in "C:\Program Files\Autodesk\3ds Max 20XX\scripts"\
\- Open "CP77\_NOESIS\_CMD.ms" in a text editor and set your Noesis.exe path.

![](<../../../.gitbook/assets/image (3) (1) (1).png>)

## **In 3ds Max:**

\
Run the MaxScript from Scripting > Run Script...

![](<../../../.gitbook/assets/image (5) (1) (1).png>)

Click on "Import to Scene" and select the .mesh file you want to edit. Your custom settings in "fmt\_CP77mesh.py" will effect the imported mesh.\
\
FBX Settings for **Import**:

![](<../../../.gitbook/assets/image (2) (1) (1).png>)

\
MaxScript Settings for **Export:**

![](<../../../.gitbook/assets/image (1) (1) (1).png>)\\

FBX Settings for **Export:**

![](<../../../.gitbook/assets/image (4) (2) (1).png>)\
\*\*When exporting your mesh the plugin will ask you to select a mesh to export it over, in most cases you should select the original mesh.
