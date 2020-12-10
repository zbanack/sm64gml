# sm64.gml
___
**⚠️ Nothing to see here yet... come back in ~mid-December**
___

## The project
sm64.gml is an early(-ish) **work in progress** port of Super Mario 64 to 100% vanilla GameMaker Language (GML) 2.3.1. GML is a part of YoYoGames' GameMaker Studio 2 development engine. This project is in not affiliated with them in any way.

The C code that's being ported to GML comes from the [C decompilation repo](https://github.com/n64decomp/sm64). Certain portions of the GML also derive from [https://github.com/sm64js/sm64jssm64js], a native JavaScript port of the game. **Zero (0%)** of GML in this project stemmed from leaks or illegally-obtained Super Mario 64 or related systems code. 

This project exists becauses of curisosity, a love for GameMaker, and the challenge of working under restrictions.

## Notice
This repo does not contain any Super Mario 64 textures or sounds. A self-provided ROM, as well as a copy of the [sm64 decomp](https://github.com/n64decomp/sm64), is necessary in order to extract assets and play.

### Community
[Join the Discord](https://discord.gg/6XfpZXt)

## Compile Instructions (Windows, macOS)
1. Install the latest version of GameMaker Studio 2.3.1
2. Follow the **US ROM VERSION** of the steps found on the [sm64 decomp repo](https://github.com/n64decomp/sm64)
3. Clone the sm64.gml repo:
```
git clone https://github.com/zbanack/sm64gml.git && cd sm64gml
```
4. Open the .yyz project file and navigate to the `Create Event` of `Object1`. The first argument of the `sm64_init` function should be a string pointing to the output folder from Step 2.

**Example:**
```
sm64_init(
	"C:/Users/Zack/Desktop/sm64_decomp/", // <-- your 
  ...
);
```

5. Compile the game for **Windows** or **macOS**. It is *possible* to get the game to run in native JavaScript using the HTML5 export option, though you'll need to figure out what is being extracted from the ROM at run-time and manually insert that data into the source code (not recommended!!).


## Python C->GML conversion tools
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

## Shoutouts
- [Super Mario 64 Decomp](https://github.com/n64decomp/sm64)
 - The smart people that painstakingly turned Super Mario 64's assembly to C
- [sm64js](https://github.com/sm64js/sm64js)
- [N64 Fast 3D Renderer](https://github.com/Emill/n64-fast3d-engine)
