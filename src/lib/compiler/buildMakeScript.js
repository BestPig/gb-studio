import glob from "glob";
import { promisify } from "util";
import { pathExists } from "fs-extra";
import Path from "path";
import l10n from "../helpers/l10n";

const globAsync = promisify(glob);

export default async (
  buildRoot,
  { CART_TYPE, CART_SIZE, customColorsEnabled, profile, platform }
) => {
  const cmds = platform === "win32" ? [""] : ["#!/bin/bash", "set -e"];
  const objFiles = [];

  const CC = platform === "win32"
    ? `..\\_gbstools_analogue\\gbdk\\bin\\lcc`
    : `../_gbstools_analogue/gbdk/bin/lcc`;
  let CFLAGS = `-Wa-l -Iinclude`;
  let LFLAGS = `-Wl-yo${CART_SIZE} -Wa-l -Wl-m -Wl-j -Wl-yt${CART_TYPE} -Wl-ya4 -Wm-yN`;

  if (customColorsEnabled) {
    CFLAGS += " -DCGB";
    LFLAGS += " -Wm-yC";
  }

  if (profile) {
    CFLAGS += " -Wf--profile";
  }

  const srcRoot = `${buildRoot}/src/**/*.@(c|s)`;
  const buildFiles = await globAsync(srcRoot);

  const addCommand = (label, cmd) => {
    if (platform === "win32") {
      cmds.push(`@echo ${label}`);
      cmds.push(`@${cmd}`);
    } else {
      cmds.push(`echo "${label}"`);
      cmds.push(cmd);
    }
  }

  for (const file of buildFiles) {
    const objFile = `${file
      .replace(/src.*\//, "obj/")
      .replace(/\.[cs]$/, "")}.o`;

      if (!(await pathExists(objFile))) {
        addCommand(
          `${l10n("COMPILER_COMPILING")}: ${Path.relative(buildRoot, file)}`,
          `${CC} ${CFLAGS} -c -o ${objFile} ${file}`
        );
    }
    objFiles.push(objFile);
  }

  addCommand(
    `${l10n("COMPILER_LINKING")}: game.pocket`,
    `${CC} ${LFLAGS} -o build/rom/game.pocket ${objFiles.join(" ")}`,
  );

  const POCKET_FIX = platform === "win32"
  ? `..\\_gbstools_analogue\\gbdk\\bin\\pocket_fix`
  : `../_gbstools_analogue/gbdk/bin/pocket_fix`;
  addCommand(
    `Pocket Fix: build/rom/game.pocket`,
    `${POCKET_FIX} build/rom/game.pocket`
  );

  return cmds.join("\n")
};
