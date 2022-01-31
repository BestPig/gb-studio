# GB Studio


[![CircleCI](https://circleci.com/gh/chrismaltby/gb-studio/tree/develop.svg?style=shield)](https://circleci.com/gh/chrismaltby/gb-studio/tree/develop)

Copyright (c) 2020 Chris Maltby, released under the [MIT license](https://opensource.org/licenses/MIT).

Twitter: [@maltby](https://www.twitter.com/maltby) 

Reddit: [/r/gbstudio](https://www.reddit.com/r/gbstudio)  
Discord: [Join Chat](https://discord.gg/bxerKnc)

GB Studio is a free and easy to use retro adventure game creator for Game Boy available for Mac, Linux and Windows.
For more information see the [GB Studio](https://www.gbstudio.dev) site

----

## 🚨 🚨 🚨 Version 2 Beta Available 🚨 🚨 🚨

If you're looking for the GB Studio 2 Beta check out the branch [v2beta](https://github.com/chrismaltby/gb-studio/tree/v2beta) for the latest builds.

----

![GB Studio](gbstudio.gif)

GB Studio consists of an [Electron](https://electronjs.org/) game builder application and a C based game engine using [GBDK](http://gbdk.sourceforge.net/), music is provided by [GBT Player](https://github.com/AntonioND/gbt-player)

## Installation

Download a release for your operating system from the [GB Studio Downloads](https://www.gbstudio.dev/download) page.

Or to run from source, clone this repo then:

```bash
$ yarn
$ npm start
```

## Documentation

[GB Studio Documentation](https://www.gbstudio.dev/docs)

## Analogue Pocket export

GB Studio 1.2.2 lack of Analogue Pocket export, and some game creator can't port easily their project to the new GB Studio 3.0.

So I created this GB Studio version to provide an easy way to game creator to port their game to an Analogue Pocket made with GB Studio 1.2.2.

⚠️ This version is a pure hack, and is only able to export .pocket game, it breaks the ability to export ROM as a .gb game.

This version rely on a modified gbdk version. \
https://github.com/BestPig/gbdk

Also to make things clear, I'm not affiliated with `Analogue Inc` or `GB Studio`

### Porting your game

Just open your GB Studio 1.2.2 project and then "Export ROM", it should be a .pocket file.

### Testing your game

*The embedded emulator works with the pocket file*

But if you want a more accurate emulator, you can use Emulicious that is able to run pocket file. \
https://emulicious.net/

## Development builds

These builds reflects the latest changes from the `develop` branch and are updated automatically. It is recommended to make a backup of your project before using any of these versions.

#### macOS

[![MacOS](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=apple&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-darwin_x86_64.zip)

#### Linux

[![DEB](https://img.shields.io/static/v1.svg?label=&message=deb&color=blue&logo=Ubuntu&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-linux_x86_64.deb)
[![RPM](https://img.shields.io/static/v1.svg?label=&message=RPM&color=blue&logo=linux&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-linux_x86_64.rpm)
[![TAR.GZ](https://img.shields.io/static/v1.svg?label=&message=RPM&color=blue&logo=linux&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-linux_x86_64.tar.gz)

#### Windows

[![Windows_x86_64](https://img.shields.io/static/v1.svg?label=&message=64%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-windows_x86_64.zip)
[![Windows_x86](https://img.shields.io/static/v1.svg?label=&message=32%20bit&color=blue&logo=windows&style=for-the-badge&logoColor=white)](https://github.com/BestPig/gb-studio/releases/download/v1.2.2-1-analogue/gb-studio-develop-windows_x86.zip)

