package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxG;
import openfl.Assets;

class TilemapTestState extends FlxState {
    private var boardTiles:FlxGroup;
    private var playerTiles:FlxGroup;

    override public function create():Void {
        super.create();
        
        // Black background for better visualization
        FlxG.cameras.bgColor = 0xFF333333; // Dark gray
        
        // Group for board tiles
        boardTiles = new FlxGroup();
        
        // Group for player tiles
        playerTiles = new FlxGroup();
        
        // Explanatory text at the top
        var text = new flixel.text.FlxText(0, 20, FlxG.width, "Tilemap Test: Board and Player Tiles");
        text.setFormat(null, 16, 0xFFFFFFFF, "center");
        add(text);

        // Calculating centered positions
        var boardTypes:Array<String> = [
            "board-main", "board-left-up", "board-right-up", 
            "board-left-down", "board-right-down"
        ];
        var boardWidth = boardTypes.length * 48; // Total board width (48 pixels per tile)
        
        var playerTypes:Array<String> = [
            "red", "orange", "yellow", "light-green", 
            "green", "blue", "indigo", "purple"
        ];
        var playerWidth = playerTypes.length * 48; // Total player width
        
        var boardStartX = (FlxG.width - boardWidth) / 2;
        var playerStartX = (FlxG.width - playerWidth) / 2;
        
        // Board tiles
        for (i in 0...boardTypes.length) {
            var tile = new FlxSprite(boardStartX + (i * 48), FlxG.height * 0.3);
            tile.loadGraphic("assets/images/board.png", true, 16, 16);
            trace('Loading board tile ${boardTypes[i]} with index ${i + 1}');
            tile.animation.add("idle", [i + 1], 1);
            tile.animation.play("idle");
            tile.scale.set(3.0, 3.0);
            boardTiles.add(tile);
        }
        
        // Player tiles
        for (i in 0...playerTypes.length) {
            var tile = new FlxSprite(playerStartX + (i * 48), FlxG.height * 0.6);
            tile.loadGraphic("assets/images/players.png", true, 16, 16);
            trace('Loading player tile ${playerTypes[i]} with index ${i + 1}');
            tile.animation.add("idle", [i + 1], 1);
            tile.animation.play("idle");
            tile.scale.set(3.0, 3.0);
            playerTiles.add(tile);
        }
        
        // Add groups to state
        add(boardTiles);
        add(playerTiles);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        
        // Allow closing with ESC
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new MenuState());
        }
    }
}
