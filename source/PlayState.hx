package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.ShakeTween;

class PlayState extends FlxState
{
	var spriteTest:FlxSprite;
	var tweenTest:ShakeTween;

	override public function create()
	{
		super.create();
		var spriteNoShake = new FlxSprite();
		add(spriteNoShake);

		spriteTest = new FlxSprite();
		add(spriteTest);

		FlxG.camera.zoom = 4;

		spriteNoShake.screenCenter();
		spriteNoShake.x -= 15;

		spriteTest.screenCenter();
		spriteTest.x += 15;

		// FlxTween.shake(spriteTest, {type: LOOPING});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		FlxG.watch.addQuick("Position", spriteTest.getPosition());
		FlxG.watch.addQuick("Offset", spriteTest.offset);

		if (FlxG.keys.justPressed.S)
			tweenTest = FlxTween.shake(spriteTest);

		if (FlxG.keys.justPressed.C && tweenTest != null)
			tweenTest.cancel();

		if (FlxG.keys.pressed.UP)
			spriteTest.y--;

		if (FlxG.keys.pressed.DOWN)
			spriteTest.y++;
	}
}
