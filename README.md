# GB Studio 2 Beta (Analogue Pocket export)


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

### Porting your game

Patching the engine is no more required to get things working.
Except if you add manually access to rLCDC and rSTAT register, in this case you need to patch them.

If this case, to patch thing you can find what must be changed here.
https://github.com/treyturner/analogue-pocket-patches/blob/main/TUTORIAL.md

### Testing your game

*The embedded emulator now works with the pocket file*

But you can still use an emulator that support pocket file like Emulicious. \
https://emulicious.net/

## Beta builds

These builds reflects the latest changes from the `v2beta` branch and are updated automatically. It is recommended to make a backup of your project before using any of these versions.

#### macOS

[![MacOS](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=apple&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue-v2beta5.2-darwin_x86_64.zip)

#### Linux

[![DEB](https://img.shields.io/static/v1.svg?label=&message=deb&color=blue&logo=Ubuntu&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue_2.0.0-beta5.2_amd64.deb)
[![RPM](https://img.shields.io/static/v1.svg?label=&message=RPM&color=blue&logo=linux&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue-2.0.0.beta5.2.x86_64.rpm)
[![TAR.GZ](https://img.shields.io/static/v1.svg?label=&message=tar.gz&color=blue&logo=Ubuntu&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue-2.0.0.beta5.2.x86_64.tar.gz)
#### Windows

[![Windows_x86_64](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue-v2beta5.2-windows_x86_64.zip)
[![Windows_x86](https://img.shields.io/static/v1.svg?label=&message=32%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v2.0.0-beta5.2-analogue/gb-studio-analogue-v2beta5.2-windows_x86.zip)

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

