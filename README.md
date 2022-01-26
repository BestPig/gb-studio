# GB Studio 2 Beta (Analogue Pocket export)


[![CircleCI](https://circleci.com/gh/chrismaltby/gb-studio/tree/develop.svg?style=shield)](https://circleci.com/gh/chrismaltby/gb-studio/tree/develop)

Copyright (c) 2020 Chris Maltby, released under the [MIT license](https://opensource.org/licenses/MIT).

Twitter: [@maltby](https://www.twitter.com/maltby) 

Reddit: [/r/gbstudio](https://www.reddit.com/r/gbstudio)  
Discord: [Join Chat](https://discord.gg/bxerKnc)


GB Studio is a quick and easy to use retro adventure game creator for Game Boy available for Mac, Linux and Windows.
For more information see the [GB Studio](https://www.gbstudio.dev) site

![GB Studio](gbstudio.gif)

GB Studio consists of an [Electron](https://electronjs.org/) game builder application and a C based game engine using [GBDK](http://gbdk.sourceforge.net/), music is provided by [GBT Player](https://github.com/AntonioND/gbt-player)


## Analogue Pocket export

GB Studio 2.0 lack of Analogue Pocket export, and some game creator can't port easily their project to the new GB Studio 3.0.

So I created this GB Studio version to provide an easy way to game creator to port their game to an Analogue Pocket made with GB Studio 2.0beta5.

⚠️ This version is a pure hack, and is only able to export .pocket game, it breaks the ability to export ROM as a .gb game.

This version rely on a modified gbdk-2020 version. \
https://github.com/BestPig/gbdk-2020

Also to make things clear, I'm not affiliated with `Analogue Inc` or `GB Studio`

### Know bugs
- Run not working (The embedded emulator can't run pocket file for the moment)
- Export as web (Not working for the same reason as the previous one)

### Porting your game

If you have ejected your engine, you have to modify some lines. \
Apply the following patch to make the engine runnable on Pocket.

⚠️ Note that this change will only works when building as a pocket file (With this modified GB Studio), so you have to revert this change if you want to build it again with the original GB Studio.

```diff
diff --git a/src/core/Core_Main.c b/src/core/Core_Main.c
index d5b561d4..ba055d40 100644
--- a/src/core/Core_Main.c
+++ b/src/core/Core_Main.c
@@ -98,7 +98,7 @@ int core_start() {
   display_off();
 
   // Init LCD
-  LCDC_REG = 0x67;
+  LCDC_REG = 0xe6;
 
   // Set interupt handlers
   add_VBL(vbl_update);
@@ -117,7 +117,7 @@ int core_start() {
   set_interrupts(VBL_IFLAG | TIM_IFLAG | LCD_IFLAG);
   enable_interrupts();
 
-  STAT_REG = 0x45;
+  STAT_REG = 0xA2;
 
   // Set palettes
   BGP_REG = OBP0_REG = 0xE4U;
diff --git a/src/core/Scroll_a.s b/src/core/Scroll_a.s
index 2064d674..99daa01e 100644
--- a/src/core/Scroll_a.s
+++ b/src/core/Scroll_a.s
@@ -1,4 +1,4 @@
-.LCDC = 0xFF40
+.LCDC = 0xFF4E
 .STAT = 0xFF41
 
 _SetTile::
@@ -12,7 +12,7 @@ _SetTile::
         ; while 0xff41 & 02 != 0 (cannot write)
     1$:
         ldh     a,(.STAT)
-        and     a, #0x02
+        and     a, #0x40
         jr      NZ,1$
 
         ; Write tile
@@ -23,18 +23,18 @@ _SetTile::
 _WaitForMode0Or1::
     1$:
         ldh     a,(.STAT)
-        and     a, #0x02
+        and     a, #0x40
         jr      NZ,1$
         ret
 
 _GetWinAddr::
         ldh     a,(.LCDC)
-        bit     6,a
+        bit     1,a
         jr      Z,.is98
         jr      .is9c
 _GetBkgAddr::
         ldh     a,(.LCDC)
-        bit     3,a
+        bit     4,a
         jr      NZ,.is9c
 .is98:
         ld      DE,#0x9800     ; DE = origin
```

### Testing your game

You can use an emulator that support pocket file like Emulicious. \
https://emulicious.net/

## Beta builds

These builds reflects the latest changes from the `v2beta` branch and are updated automatically. It is recommended to make a backup of your project before using any of these versions.

#### macOS

[![MacOS](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=apple&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue-v2beta5-darwin_x86_64.zip)

#### Linux

[![DEB](https://img.shields.io/static/v1.svg?label=&message=deb&color=blue&logo=Ubuntu&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue_2.0.0-beta5_amd64.deb)
[![RPM](https://img.shields.io/static/v1.svg?label=&message=RPM&color=blue&logo=linux&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue-2.0.0.beta5.x86_64.rpm)
[![TAR.GZ](https://img.shields.io/static/v1.svg?label=&message=tar.gz&color=blue&logo=Ubuntu&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue-2.0.0.beta5.x86_64.tar.gz)
#### Windows

[![Windows_x86_64](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue-v2beta5-windows_x86_64.zip)
[![Windows_x86](https://img.shields.io/static/v1.svg?label=&message=32%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5-analogue/gb-studio-analogue-v2beta5-windows_x86.zip)

## Installation

Download a release for your operating system from the [GB Studio Downloads](https://github.com/BestPig/gb-studio/releases) page.

Or to run from source, clone this repo then:

```bash
$ yarn
$ npm start
```

## Documentation

Documentation is not yet available for the v2 beta, for previous builds refer to the following:

[GB Studio Documentation](https://www.gbstudio.dev/docs)

