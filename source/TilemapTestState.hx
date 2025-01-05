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
        
        // Fundo preto para melhor visualização
        FlxG.cameras.bgColor = 0xFF000000;
        
        // Grupo para tiles do tabuleiro
        boardTiles = new FlxGroup();
        
        // Tiles do tabuleiro
        var boardTypes:Array<String> = [
            "board-main", "board-left-up", "board-right-up", 
            "board-left-down", "board-right-down"
        ];
        
        for (i in 0...boardTypes.length) {
            var tile = new FlxSprite(i * 20, 20);
            tile.loadGraphic("assets/images/board.png", true, 16, 16);
            tile.animation.add("idle", [i], 1);
            tile.animation.play("idle");
            boardTiles.add(tile);
        }
        
        // Grupo para tiles dos players
        playerTiles = new FlxGroup();
        
        // Tiles dos players
        var playerTypes:Array<String> = [
            "red", "orange", "yellow", "light-green", 
            "green", "blue", "indigo", "purple"
        ];
        
        for (i in 0...playerTypes.length) {
            var tile = new FlxSprite(i * 20, 100);
            tile.loadGraphic("assets/images/players.png", true, 16, 16);
            tile.animation.add("idle", [i], 1);
            tile.animation.play("idle");
            playerTiles.add(tile);
        }
        
        // Adiciona grupos ao estado
        add(boardTiles);
        add(playerTiles);
        
        // Texto explicativo
        var text = new flixel.text.FlxText(10, 10, FlxG.width, "Tilemap Test: Board and Player Tiles");
        text.setFormat(null, 16, 0xFFFFFFFF, "left");
        add(text);
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
        
        // Permite fechar com ESC
        if (FlxG.keys.justPressed.ESCAPE) {
            FlxG.switchState(new MenuState());
        }
    }
}
