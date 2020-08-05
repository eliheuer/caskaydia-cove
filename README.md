# Caskaydia Cove
A fork of Cascadia Code with a few adjustments to conform to the Google Fonts Spec. The name comes from the Nerds Fonts project, which uses "Caskaydia Code" for its own patched version of Casdadia Code.

The Cascadia Code upstream project is designed by Aaron Bell and developed by the Windows Terminal Team, thanks Aaron and Microsoft!

![Variable Font Example](documentation/drawbot/variable-font-example.gif)
![Screenshot](documentation/screenshots/screenshot.png)

Caskaydia Cove is licensed under the [SIL Open Font License Version 1.1](OFL.txt), please see the [OFL-FAQ.txt](OFL-FAQ.txt) file if you have any legal questions.

[Pull requests](https://github.com/eliheuer/caskaydia-cove/pulls) and new [issues](https://github.com/eliheuer/caskaydia-cove/issues) are welcome.

## Development

Build scripts and source files are in the [sources](sources) directory.

To build new fonts, open a Unix-like terminal (Linux, MacOS, WSL) in the [sources](sources) directory, and run the build script. If you have [Python3](https://www.python.org/) installed, this script should set up a temporary virtual environment and install all needed dependencies automatically.
```
sh build.sh
```
If you are making a pull request to Google Fonts, add the `-gf` flag and files will be moved to `~/Google/fonts/ofl/..` after building.
```
sh build.sh -gf
```
