#if FEATURE_FILESYSTEM
import sys.FileSystem;
import sys.io.File;
#end
import openfl.display.BitmapData;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxG;
import openfl.utils.Assets as OpenFlAssets;

using StringTools;

class Skin
{
	public static var noteskinArray = [];

	var ignoreList = ["Arrows", "Circles"];

	public static function updateNoteskins()
	{
		noteskinArray = [];
		for (i in CoolUtil.readAssetsDirectoryFromLibrary('assets/shared/images/noteskins', 'IMAGE'))
		{
			if (i.contains("-pixel"))
				continue;

			if (!i.endsWith(".png"))
				continue;

			noteskinArray.push(i.replace(".png", ""));
		}
		return noteskinArray;
	}

	public static function getNoteskins()
	{
		return noteskinArray;
	}

	public static function getNoteskinByID(id:Int)
	{
		return noteskinArray[id];
	}

	static public function generateNoteskinSprite(id:Int)
	{
		return 'noteskins/${getNoteskinByID(id)}';
	}

	static public function generatePixelSprite(id:Int, ends:Bool = false)
	{
		if (!OpenFlAssets.exists('assets/shared/images/noteskins/${getNoteskinByID(id)}' + '-pixel' + (ends ? '-ends' : '') + ".png", IMAGE))
		{
			// .png moment
			return Paths.image("noteskins/Arrows-pixel" + (ends ? "-ends" : ""), 'shared');
		}
		else
			return Paths.image('noteskins/${getNoteskinByID(id)}' + "-pixel" + (ends ? "-ends" : ""), 'shared');
	}
}

class Splash
{
	public static var notesplashArray = ['Default', 'Psych']; // Defaults, should be in this order normally.

	public static function updateNotesplashes()
	{
		notesplashArray = [];
		for (i in CoolUtil.readAssetsDirectoryFromLibrary('assets/shared/images/splashes', 'IMAGE'))
		{
			if (!i.endsWith(".png"))
				continue;

			notesplashArray.push(i.replace(".png", ""));
		}
		return notesplashArray;
	}

	public static function getNotesplash()
	{
		return notesplashArray;
	}

	public static function getNotesplashByID(id:Int)
	{
		return notesplashArray[id];
	}

	static public function generateNotesplashSprite(id:Int, ?type:String = '')
	{
		if (type != '' && OpenFlAssets.exists('assets/shared/images/notetypes/splashes/${getNotesplashByID(id) + type}.png'))
			return 'notetypes/splashes/${getNotesplashByID(id) + type}';
		else
			return 'splashes/${getNotesplashByID(id)}';
	}
}
