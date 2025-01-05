package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState {
    private var testTilemapButton:FlxButton;

    override public function create():Void {
        super.create();
        
        // Fundo preto
        FlxG.cameras.bgColor = 0xFF000000;
        
        // Título
        var title = new FlxText(0, 50, FlxG.width, "Connector4 Menu");
        title.setFormat(null, 24, 0xFFFFFFFF, "center");
        add(title);
        
        // Botão para teste de tilemap
        testTilemapButton = new FlxButton(
            FlxG.width / 2 - 60, 
            FlxG.height / 2, 
            "Tilemap Test", 
            goToTilemapTest
        );
        add(testTilemapButton);
    }

    private function goToTilemapTest():Void {
        FlxG.switchState(new TilemapTestState());
    }

    override public function update(elapsed:Float):Void {
        super.update(elapsed);
    }
}
