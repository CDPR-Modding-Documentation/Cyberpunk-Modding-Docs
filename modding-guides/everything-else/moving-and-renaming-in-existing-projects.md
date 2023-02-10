---
description: How to avoid changing every single depotPath in your mod by hand
---

# Moving and renaming in existing projects

1. In Wolvenkit, save all your open tabs and close them. You don't want any files to be open in Wolvenkit for what comes next.
2. Move and rename your files and folders. (You might have to rename folders in the Windows Explorer)
3. In Wolvenkit, right-click on the top level folder under **archive** and select "Convert to JSON"
4. Open a file at the root level of the folder in [Notepad++](https://notepad-plus-plus.org/downloads/)
5. Use "Search: Find in Files..." (Ctrl+F)
6. Find the name/path of your old item so you can copy and paste it
   1. For "Directory", put the top level directory with all your json files
   2. For "Find what" put the name
7.  Copy the relative base path of the folder you changed, starting at **archive**

    It will look something like `archive\\yourname\\old_folder_name`
8. Use "Search: Find in Files..." again (Ctrl+F)
   1. For "Directory", put the top level directory with all your json files
   2. For "Find what", put the path you copied in the previous step
   3. For "Replace With", put the path of your new file or folder. \
      **Make sure that you do not have any typos! The doubled slashes are necessary!**
   4. Select "Replace in Files". Notepad++ will now change the folder name for you.
9. Right-click on the top level folder under **raw** and select "Import from JSON"
