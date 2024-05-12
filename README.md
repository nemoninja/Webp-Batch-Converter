# Webp-Batch-Converter
Given a folder path, convert all eligible images to .webp format.
Old files are kept, while newly created .webp will be stored in a new folder.

1. Download [the WebP converter from Google](https://developers.google.com/speed/webp/docs/precompiled).
2. Add this batch script in the `/bin/` folder.
3. Open a terminal in the bin folder.
4. Run the following
   ```
   convert_all.bat <folder_name>
   ```
5. Obtain your new .webp files in the newly created folder named with the current timestamp.
   
Example:
```
convert_all.bat "D:\Installs\Webp Converter\test_folder"
```

## About .webp
Refer to Google's documentation [here](https://developers.google.com/speed/webp).

