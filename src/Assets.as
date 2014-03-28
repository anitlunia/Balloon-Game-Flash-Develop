package  
{
	import flash.display.Bitmap;
	import flash.display3D.textures.Texture;
	import flash.utils.Dictionary;
	import starling.text.BitmapFont;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	import starling.text.TextField;
	/**
	 * ...
	 * @author Yo
	 */
	public class Assets 
	{
		
		[Embed(source = "../assets/graphics/bgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source = "../assets/graphics/bgLayer1.jpg")]
		public static const BgLayer1:Class;
			
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source = "../assets/graphics/mySpritesheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../assets/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source = "../assets/fonts/myFont.png")]
		public static const FontTexture:Class;
		
		[Embed(source = "../assets/fonts/myFont.fnt", mimeType="application/octet-stream")]
		public static const FontXML:Class;
		
		public static var myFont:BitmapFont;
		
		public static function getFont():BitmapFont
		{
			var fontTexture:Texture =  Texture.fromBitmap(new FontTexture());
			var fontXML:XML = XML(new FontXML());
			
			var font:BitmapFont = new BitmapFont(fontTexture, fontXML);
			TextField.registerBitmapFont(font);
			
			return font;
		}
		
		[Embed(source = "../assets/fonts/embedded/BADABB__.TTF", fontFamily = "MyFontName", embedAsCFF = "false")]
		public static var MyFont:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		
		public static function getTexture(name:String):starling.textures.Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap); //esto la convierte en una textura y se guarda en el diccionario
			}
			return gameTextures[name];
		}
		
	}
}