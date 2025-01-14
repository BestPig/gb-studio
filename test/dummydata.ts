import {
  SceneData,
  Background,
  SpriteSheet,
  Music,
  Actor,
  Trigger,
  Palette,
  CustomEvent,
} from "../src/store/features/entities/entitiesTypes";
import { ProjectData } from "../src/store/features/project/projectActions";
import { RootState } from "../src/store/configureStore";
import { initialState as initialEditorState } from "../src/store/features/editor/editorState";
import { initialState as initialConsoleState } from "../src/store/features/console/consoleState";
import { initialState as initialMetadataState } from "../src/store/features/metadata/metadataState";
import { initialState as initialEntitiesState } from "../src/store/features/entities/entitiesState";
import { initialState as initialSettingsState } from "../src/store/features/settings/settingsState";
import { initialState as initialMusicState } from "../src/store/features/music/musicState";
import { initialState as initialNavigationState } from "../src/store/features/navigation/navigationState";
import { initialState as initialDocumentState } from "../src/store/features/document/documentState";
import { initialState as initialErrorState } from "../src/store/features/error/errorState";
import { initialState as initialWarningsState } from "../src/store/features/warnings/warningsState";
import { initialState as initialEngineState } from "../src/store/features/engine/engineState";

export const dummyScene: SceneData = {
  id: "",
  name: "Scene",
  backgroundId: "",
  x: 0,
  y: 0,
  width: 20,
  height: 18,
  type: "0",
  paletteIds: [],
  collisions: [0],
  tileColors: [0],
  actors: [],
  triggers: [],
  script: [],
  playerHit1Script: [],
  playerHit2Script: [],
  playerHit3Script: [],
};

export const dummyActor: Actor = {
  id: "",
  name: "",
  spriteSheetId: "",
  spriteType: "static",
  x: 0,
  y: 0,
  frame: 0,
  direction: "down",
  animate: false,
  paletteId: "",
  animSpeed: 3,
  moveSpeed: 1,
  isPinned: false,
  collisionGroup: "",
  script: [],
  startScript: [],
  updateScript: [],
  hit1Script: [],
  hit2Script: [],
  hit3Script: [],
};

export const dummyTrigger: Trigger = {
  id: "",
  name: "",
  x: 0,
  y: 0,
  width: 0,
  height: 0,
  script: [],
};

export const dummyPalette: Palette = {
  id: "",
  name: "",
  colors: ["", "", "", ""],
};

export const dummyBackground: Background = {
  id: "",
  name: "",
  filename: "",
  width: 1,
  height: 1,
  imageWidth: 1,
  imageHeight: 1,
  inode: "0",
  _v: 0,
};

export const dummySpriteSheet: SpriteSheet = {
  id: "",
  name: "",
  filename: "",
  numFrames: 1,
  type: "static",
  inode: "1",
  _v: 0,
};

export const dummyMusic: Music = {
  id: "",
  name: "",
  filename: "",
  inode: "2",
  _v: 0,
  settings: {},
};

export const dummyCustomEvent: CustomEvent = {
  id: "",
  name: "",
  description: "",
  variables: {},
  actors: {},
  script: [],
};

export const dummyProjectData: ProjectData = {
  name: "",
  _version: "2.0.0",
  _release: "1",
  author: "",
  notes: "",
  scenes: [],
  backgrounds: [],
  spriteSheets: [],
  palettes: [],
  customEvents: [],
  variables: [],
  music: [],
  settings: {
    startSceneId: "",
    startX: 0,
    startY: 0,
    playerSpriteSheetId: "",
    startMoveSpeed: 1,
    startAnimSpeed: 3,
    startDirection: "down",
    playerPaletteId: "",
    showCollisions: true,
    showConnections: true,
    worldScrollX: 0,
    worldScrollY: 0,
    zoom: 100,
    customColorsEnabled: false,
    defaultBackgroundPaletteIds: ["", "", "", "", "", ""],
    defaultSpritePaletteId: "",
    defaultUIPaletteId: "",
    customHead: "",
    navigatorSplitSizes: [300, 100, 100],
    showNavigator: true,
  },
};

export const dummyRootState: RootState = {
  editor: {
    ...initialEditorState,
  },
  console: {
    ...initialConsoleState,
  },
  music: {
    ...initialMusicState,
  },
  navigation: {
    ...initialNavigationState,
  },
  document: {
    ...initialDocumentState,
  },
  error: {
    ...initialErrorState,
  },
  warnings: {
    ...initialWarningsState,
  },
  engine: {
    ...initialEngineState,
  },
  project: {
    past: [],
    future: [],
    present: {
      entities: {
        ...initialEntitiesState,
      },
      settings: {
        ...initialSettingsState,
      },
      metadata: {
        ...initialMetadataState,
      },
    },
  },
};
