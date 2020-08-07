# Caskaydia Cove
Caskaydia Cove is a fork of the [Cascadia Code](https://github.com/microsoft/cascadia-code) typeface with the [RFN (Reserved Font Name)](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL_web_fonts_and_RFNs) removed, plus small adjustments to conform to the [Google Fonts spec](https://github.com/googlefonts/gf-docs/tree/master/Spec). The name comes from the [Nerds Fonts](https://github.com/ryanoasis/nerd-fonts) project, which uses “Caskaydia Cove” for its patched version of Casdadia Code. The RFN prevents distributing modified versions of fonts under the names used by their upstream maintainers, so if you are looking for something like Cascadia Code that can be modified for inclusion in various font collections without a name change, this repository might be what you are looking for.

This fork is maintained by a Washingtonian working from the Pacific Northwest and is licensed under the [SIL Open Font License Version 1.1](OFL.txt). Please see the [OFL-FAQ.txt](OFL-FAQ.txt) file if you have any legal questions.

The Cascadia Code upstream project is designed by [Aaron Bell](https://www.sajatypeworks.com/) and developed by the [Windows Terminal](https://github.com/microsoft/terminal) team. If you want to know more about the Windows Terminal project, please see the [Windows Command Line developer blog](https://devblogs.microsoft.com/commandline/), or listen to [this podcast interview](https://changelog.com/podcast/406) about the subject. Thanks for the great work making command-line workflows more beautiful and accesible, Aaron and Microsoft!

Below is a demo of the variable font version of typeface, Python ([DrawBot](https://www.drawbot.com)) source code for this animation is here: [documentation/animations/variable-font-specimen.py](documentation/animations/variable-font-specimen.py)
![Variable Font Example](documentation/animations/variable-font-specimen.gif)

Python ([DrawBot](https://www.drawbot.com)) source code for this text specimen is here: [documentation/images/text-specimen.py](documentation/images/text-specimen.py)
![Text Example](documentation/images/text-specimen.png)

And a usage example with [iTerm2](https://github.com/gnachman/iTerm2) and [bat](https://github.com/sharkdp/bat).
![Screenshot](documentation/screenshots/screenshot.png)

## Variable Axes

The Caskaydia Cove variable font has a weight (wght) axis:

| Axis       | Tag    | Range        | Default |
| ---------- | ------ | ------------ | ------- |
| Weight     | `wght` | 200 to 700   | 400     |

## Static Fonts

Caskaydia Cove has the following static weights:

| Font                         | Weight       | Axis Location |
| ---------------------------- | ------------ | ------------- |
| CaskaydiaCove-ExtraLight.ttf | Extra Light  | 200           |
| CaskaydiaCove-Light.ttf      | Light        | 300           |
| CaskaydiaCove-Regular.ttf    | Regular      | 400           |
| CaskaydiaCove-Medium.ttf     | Medium       | 500           |
| CaskaydiaCove-SemiBold.ttf   | Semi Bold    | 600           |
| CaskaydiaCove-Bold.ttf       | Bold         | 700           |

## Development and Building New Fonts

[Pull requests](https://github.com/eliheuer/caskaydia-cove/pulls) and new [issues](https://github.com/eliheuer/caskaydia-cove/issues) are welcome.

Build scripts and UFO source files are in the [sources](sources) directory.

To build new fonts, open a Unix-like terminal (Linux, MacOS, WSL) in the root directory of this reporitory(where this readme is located). First make sure you have [Python3](https://www.python.org/) installed, then install the build scripts Python dependencies in a virtual enviroment.
```
which python3
python3 -m venv venv
source venv/bin/activate
which python3
pip install --upgrade pip
pip install --requirement requirements.txt
```
Then, run the buildscript from the root directory.
```
sh build.sh
```
If you are making a pull request to Google Fonts, add the `-gf` flag and files will be moved to `~/Google/fonts/ofl/..` after building.
```
sh build.sh -gf
```

## Fontbakery Report at Commit 2a09391
Fontbakery version: 0.7.29

<details>
<summary><b>[1] Family checks</b></summary>
<details>
<summary>⚠ <b>WARN:</b> Is the command `ftxvalidator` (Apple Font Tool Suite) available?</summary>

* [com.google.fonts/check/ftxvalidator_is_available](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/ftxvalidator_is_available)
<pre>--- Rationale ---

There&#x27;s no reasonable (and legal) way to run the command `ftxvalidator` of the
Apple Font Tool Suite on a non-macOS machine. I.e. on GNU+Linux or Windows etc.

If Font Bakery is not running on an OSX machine, the machine running Font
Bakery could access `ftxvalidator` on OSX, e.g. via ssh or a remote procedure
call (rpc).

There&#x27;s an ssh example implementation at:
https://github.com/googlefonts/fontbakery/blob/master/prebuilt/workarounds
/ftxvalidator/ssh-implementation/ftxvalidator


</pre>

* ⚠ **WARN** Could not find ftxvalidator.

</details>
<br>
</details>
<details>
<summary><b>[6] CaskaydiaCove[wght].ttf</b></summary>
<details>
<summary>⚠ <b>WARN:</b> Check copyright namerecords match license file.</summary>

* [com.google.fonts/check/name/license](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/license)
<pre>--- Rationale ---

A known licensing description must be provided in the NameID 14 (LICENSE
DESCRIPTION) entries of the name table.

The source of truth for this check (to determine which license is in use) is a
file placed side-by-side to your font project including the licensing terms.

Depending on the chosen license, one of the following string snippets is
expected to be found on the NameID 13 (LICENSE DESCRIPTION) entries of the name
table:
- &quot;This Font Software is licensed under the SIL Open Font License, Version 1.1.
This license is available with a FAQ at: https://scripts.sil.org/OFL&quot;
- &quot;Licensed under the Apache License, Version 2.0&quot;
- &quot;Licensed under the Ubuntu Font Licence 1.0.&quot;


Currently accepted licenses are Apache or Open Font License.
For a small set of legacy families the Ubuntu Font License may be acceptable as
well.

When in doubt, please choose OFL for new font projects.


</pre>

* ⚠ **WARN** Please consider using HTTPS URLs at name table entry [plat=3, enc=1, name=13] [code: http-in-description]
* ⚠ **WARN** For now we're still accepting http URLs, but you should consider using https instead.
 [code: http]

</details>
<details>
<summary>⚠ <b>WARN:</b> License URL matches License text on name table?</summary>

* [com.google.fonts/check/name/license_url](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/name/license_url)
<pre>--- Rationale ---

A known license URL must be provided in the NameID 14 (LICENSE INFO URL) entry
of the name table.

The source of truth for this check is the licensing text found on the NameID 13
entry (LICENSE DESCRIPTION).

The string snippets used for detecting licensing terms are:
- &quot;This Font Software is licensed under the SIL Open Font License, Version 1.1.
This license is available with a FAQ at: https://scripts.sil.org/OFL&quot;
- &quot;Licensed under the Apache License, Version 2.0&quot;
- &quot;Licensed under the Ubuntu Font Licence 1.0.&quot;


Currently accepted licenses are Apache or Open Font License.
For a small set of legacy families the Ubuntu Font License may be acceptable as
well.

When in doubt, please choose OFL for new font projects.


</pre>

* ⚠ **WARN** Please consider using HTTPS URLs at name table entry [plat=3, enc=1, name=13] [code: http-in-description]
* ⚠ **WARN** Please consider using HTTPS URLs at name table entry [plat=3, enc=1, name=13] [code: http-in-description]
* ⚠ **WARN** Please consider using HTTPS URLs at name table entry [plat=3, enc=1, name=13] [code: http-in-description]
* ⚠ **WARN** For now we're still accepting http URLs, but you should consider using https instead.
 [code: http]

</details>
<details>
<summary>⚠ <b>WARN:</b> METADATA.pb: Fontfamily is listed on Google Fonts API?</summary>

* [com.google.fonts/check/metadata/listed_on_gfonts](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/metadata/listed_on_gfonts)

* ⚠ **WARN** Family not found via Google Fonts API. [code: not-found]

</details>
<details>
<summary>⚠ <b>WARN:</b> Glyph names are all valid?</summary>

* [com.google.fonts/check/valid_glyphnames](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/universal.html#com.google.fonts/check/valid_glyphnames)
<pre>--- Rationale ---

Microsoft&#x27;s recommendations for OpenType Fonts states the following:

&#x27;NOTE: The PostScript glyph name must be no longer than 31 characters, include
only uppercase or lowercase English letters, European digits, the period or the
underscore, i.e. from the set [A-Za-z0-9_.] and should start with a letter,
except the special glyph name &quot;.notdef&quot; which starts with a period.&#x27;

https://docs.microsoft.com/en-us/typography/opentype/spec/recom#post-table


In practice, though, particularly in modern environments, glyph names can be as
long as 63 characters.
According to the &quot;Adobe Glyph List Specification&quot; available at:

https://github.com/adobe-type-tools/agl-specification


</pre>

* ⚠ **WARN** The following glyph names may be too long for some legacy systems which may expect a maximum 31-char length limit:
numbersign_underscore_parenleft.liga, asciitilde_asciitilde_greater.liga and less_dollar_greater.liga.BRACKET.600 [code: legacy-long-names]

</details>
<details>
<summary>⚠ <b>WARN:</b> Checking correctness of monospaced metadata.</summary>

* [com.google.fonts/check/monospace](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/name.html#com.google.fonts/check/monospace)
<pre>--- Rationale ---

There are various metadata in the OpenType spec to specify if a font is
monospaced or not. If the font is not truly monospaced, then no monospaced
metadata should be set (as sometimes they mistakenly are...)

Requirements for monospace fonts:

* post.isFixedPitch - &quot;Set to 0 if the font is proportionally spaced, non-zero
if the font is not proportionally spaced (monospaced)&quot;
  www.microsoft.com/typography/otspec/post.htm

* hhea.advanceWidthMax must be correct, meaning no glyph&#x27;s width value is
greater.
  www.microsoft.com/typography/otspec/hhea.htm

* OS/2.panose.bProportion must be set to 9 (monospace). Spec says: &quot;The PANOSE
definition contains ten digits each of which currently describes up to sixteen
variations. Windows uses bFamilyType, bSerifStyle and bProportion in the font
mapper to determine family type. It also uses bProportion to determine if the
font is monospaced.&quot;
  www.microsoft.com/typography/otspec/os2.htm#pan
  monotypecom-test.monotype.de/services/pan2

* OS/2.xAvgCharWidth must be set accurately.
  &quot;OS/2.xAvgCharWidth is used when rendering monospaced fonts, at least by
Windows GDI&quot;
  http://typedrawers.com/discussion/comment/15397/#Comment_15397

Also we should report an error for glyphs not of average width.

Please also note:
Thomas Phinney told us that a few years ago (as of December 2019), if you gave
a font a monospace flag in Panose, Microsoft Word would ignore the actual
advance widths and treat it as monospaced. Source:
https://typedrawers.com/discussion/comment/45140/#Comment_45140


</pre>

* ⚠ **WARN** Font is monospaced but 38 glyphs (2.3413431916204557%) have a different width. You should check the widths of: ['uni0308', 'uni0307', 'gravecomb', 'acutecomb', 'uni030B', 'uni0302', 'uni030C', 'uni0306', 'uni030A', 'tildecomb', 'uni0304', 'hookabovecomb', 'uni0312', 'uni031B', 'dotbelowcomb', 'uni0326', 'uni0327', 'uni0328', 'uni0340', 'uni0341', 'uni0308.case', 'uni0307.case', 'gravecomb.case', 'acutecomb.case', 'uni030B.case', 'uni0302.case', 'uni030C.case', 'uni0306.case', 'uni030A.case', 'tildecomb.case', 'uni0304.case', 'hookabovecomb.case', 'uni031B.case', 'acutecomb.loclPLK', 'acutecomb.case.loclPLK', 'uni0342', 'brevecombcy', 'brevecombcy.case'] [code: mono-outliers]

</details>
<details>
<summary>⚠ <b>WARN:</b> Does GPOS table have kerning information?</summary>

* [com.google.fonts/check/gpos_kerning_info](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/gpos.html#com.google.fonts/check/gpos_kerning_info)

* ⚠ **WARN** GPOS table lacks kerning information. [code: lacks-kern-info]

</details>
<br>
</details>

### Summary

| 💔 ERROR | 🔥 FAIL | ⚠ WARN | 💤 SKIP | ℹ INFO | 🍞 PASS | 🔎 DEBUG |
|:-----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0 | 0 | 7 | 38 | 9 | 123 | 0 |
| 0% | 0% | 4% | 21% | 5% | 69% | 0% |

## License

The Caskaydia Cove project is licensed under the [SIL Open Font License v1.1](OFL.txt).  This is a [libre](https://en.wikipedia.org/wiki/Free_software) software license that permits you to use the font software under a set of conditions. Please refer to the full text of the license for details about the permissions, conditions, and disclaimers.
