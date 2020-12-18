# sm64.gml

WIP GameMaker Language port of Super Mario 64
___

### 🎬 Release Trailer

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/w983Es08IRM/0.jpg)](https://www.youtube.com/watch?v=w983Es08IRM)

## The project
sm64.gml is an early(-ish) **work in progress** port of Super Mario 64 to 100% vanilla GameMaker Language (GML) 2.3.1. GML is a part of YoYoGames' GameMaker Studio 2 development engine. This project is not affiliated with them in any way.

The C code that's being ported to GML comes from the [C decompilation repo](https://github.com/n64decomp/sm64). Certain portions of the GML also derive from [sm64js](https://github.com/sm64js/sm64js), a native JavaScript port of the game.

This project exists because of curiosity, a love for GameMaker, and the challenge of working under restrictions.

## ⭐ Community
[Join the Discord](https://discord.gg/6XfpZXt)

## ⚠️ Notice
This repo does not contain any Super Mario 64 textures or sounds. A self-provided ROM, as well as a copy of the [sm64 decomp](https://github.com/n64decomp/sm64), is necessary in order to extract assets and play. **Zero (0%)** of GML in this project stemmed from leaks or illegally-obtained Super Mario 64 or related systems code. 

## Compile Instructions (Windows, macOS)
1. Install the latest version of GameMaker Studio 2.3.1
2. Follow the **US ROM VERSION** of the steps found on the [sm64 decomp repo](https://github.com/n64decomp/sm64)
3. Clone the sm64.gml repo:
```
git clone https://github.com/zbanack/sm64gml.git && cd sm64gml
```
4. In `/src/`, open the `.yyp` project file and navigate to the `Create Event` of `Object1`. The first argument of the `sm64_init` function should be a string pointing to the output folder from Step 2.

**Example:**
```
sm64_init(
	"C:/Users/Zack/Desktop/sm64_decomp/", // <-- your dir
  ...
);
```

5. Compile the game for **Windows** or **macOS**. It is *possible* to get the game to run in native JavaScript using the HTML5 export option, though you'll need to figure out what is being extracted from the ROM at run-time and manually insert that data into the source code (not recommended!!).


## [Development] Python C->GML conversion tools
In order to speed up the process of converting C code to GML, this repo contains numerous python scripts in the /pygml/ folder. Regarding these scripts, please note the following:
- The code extremely sloppy and full of spaghetti
- The code works ~75% of the time, requiring manual changes

### Prerequisites (Windows)
- Python 3.5+ (3.8+ recommended)
- [js-beautify](https://github.com/beautify-web/js-beautify) installed via pip
```
$ pip install jsbeautifier
```

Copy decomp-derived C code to your clipboard, run the script, and the script will try its best to convert to GML using sm64.gml-friendly functions. The result, if successful, will be copied to your clipboard.

## Notable Issues
- The game is extremely laggy. You'll be lucky to get ~20fps on Windows or macOS at the moment. Oddly enough, the HTML5 export module can hit 100fps+. Further investigation is needed.
- Way WAY waaaay too many global variables. Let's make proper use of structs and scoping, eh?
- The movement engine is glitchy: wallkicks stutter, longjumps get eaten, body tilts are lacking
- Mario’s face is glitchy. That’s a result of other vertex-related issues that need to be fixed.
- The N64 rendering doesn't fully-work: z-fighting (especially with texture decals), blend modes, clamping, transparent polygons, and more need to be addressed
- Tree textures shouldn’t be repeating
- Only a handful of enemies have been coded
- Only a few levels (see `sm64_init` for all current courses) are playable
- Stars and progress recording/saving aren't implemented
- Skybox seams are visible; not projected 1:1
- No menus, Goddard face, pre-game UI, etc.
- Only a handful of camera modes are coded in. Lakitu won’t navigate around geometry as expected in most scenarios
- Going into first person camera results in Mario face culling, nightmare fuel
- No cannons, cannon reticles, bob-mob buddies
- Ambient lighting isn’t implemented. JRB looks entirely different in this version
- Object loading and reloading issues mean it’s possible to generate infinite coins, etc.
- Mario’s velocity and movement magnititude is glitched: long jumps or dives are eaten
- Walljumps are glitchy sometimes
- No swimming, no lava boosts, basic quicksand physics
- Only a handful of enemies and NPCs
- No moving texutures
- No water, lava, caps, text interaction
- No shadows
- No sounds or sound effects, but stubbed functions exist for eventual “plug-in” integration
- Pause menu kinda works
- Orthographic projection is being “faked”, so any billboarding, skyboxes, text, and the likes need to be extra carefully examined (or better yet, fixed from the source)
- FOV/culling isn’t 1:1 to the N64, but it’s close
- Camera is largely unfinished
- No way to move between levels, or areas in levels. For the time being you’ll need to change the sm64_init second argument to a level
- Object orientation is skewed. Thwomps, whomps, and bomps in Whomp’s Fortress make this most obvious
- Cutscenes, dialogues, and object interactions are limited or non-existent
- Resolution is locked to 320x240 at the moment
- Clamped textures aren’t clamped at correct area
- Fog disabled
- Texture blend modes aren’t all working
- “Rooms” and “areas” can’t be loaded or deloaded
- Misc crashes related to not being able to locate floors/OOBs
- Softocks for dying, collecting a star

## Controls
- WASD move, Z to crouch, space to jump, arrow keys to move camera, X to punch
- There is basic game pad support, and the gamepad *should* be auto-detected. You can re-map the controls in-code, no fancy menu or anything at the moment.
- Press P to toggle between using a hacky-implementation of delta timed movement
- Hold Q to reveal debug info
- Press shift to moon jump
- Press R to return Mario to spawn coords

## Notes
- The file structure and naming conventions (of folders and functions) resemble the C decomp repo more of the time than not. 
- Comments reading “pygml” means at least part of the associated code derived from the tool
- `Ptr.` is sm64.gml's equivalent of C pointers. Use this global object to hold or manipulate variables across functions and scopes
- Look for `@TODO` in the source for code that isn't finished or issues that have been pushed under the rug. Similarly `@z` are notes to self about things that may need to be changed (or reverted back) in the future
- We may decide to opt for using structs/json instead of arrays for vertices, display lists, behavior commands, level commands, etc.

## Shoutouts
[Super Mario 64 Decomp](https://github.com/n64decomp/sm64)

 - The smart people that painstakingly turned Super Mario 64's assembly to C
 
[sm64js](https://github.com/sm64js/sm64js)

 - The native JavaScript port of Super Mario 64. Their code was referenced on numerous occasions when brick walls were hit

[N64 Fast 3D Renderer](https://github.com/Emill/n64-fast3d-engine)

 - Portions of this OpenGL implemention of Nintendo 64's graphics renderer were ported to GML for use in this project
