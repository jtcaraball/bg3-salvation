# Baldur's Gate 3: Honour Mode Save Scum

This two batch files allow you to have a functional save system while playing
Baldur's Gate 3 in honour mode. They function by keeping a separate folder
where your saves are stored and later loaded into the game's save directory.

This is a toy project and although it accompanied me through my entire
playthrough (Windows 11) I can not garanty that it will not fail on you and
potentially contribute to you loosing many hours of gameplay. Any feedback is
welcome!

## Configuration

To make use of the files first you must complete de `settings.config` file.
Here you must specify the following variables:

- `save_name`: The named assigned to your save file by the game. This will be
  created after you start a playthrough and by default will be stored in
  `C:\Users\{user}\AppData\Local\Larian Studios\Baldur's Gate 3\PlayerProfiles\Public\Savegames\Story`.
- `larian_saves`: The name of the directory where the game saves your games.
  It should the same as the path above.
- `max_saves`: The maximum amount of saves stored before starting to overwrite
  your previous saves. This one is OPTIONAL.

Please make sure that variables are inserted as `var_name="value"` for
`save_name` and `larina_saves` and as `var_name=number` for `max_saves` without
any spaces around the equal sign.

## Usage

After completing the configuration you can save and load as follows:

- To save: Save inside the game and then double click `save.bat`.
- To load: Exit to the main menu, double click `load.bat` and then load your
  game with the "Load Game" option. This will load the latest save file
  created.
