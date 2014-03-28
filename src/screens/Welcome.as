package  screens
{
	import events.NavigationEvent;
	import flash.display3D.textures.Texture;
	import mx.core.ButtonAsset;
	import starling.animation.Tween;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.core.Starling;
	import starling.events.EventDispatcher;
	import com.greensock.TweenLite;
	
	/**
	 * ...
	 * @author Yo
	 */
	public class Welcome extends Sprite 
	{
		private var bg:Image;
		private var title:Image;
		private var hero:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		public function Welcome() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Welcome screen!");
			
			bg = new Image(Assets.getTexture("BgWelcome"));
			bg.width = 600;
			bg.height = 800;
			this.addChild(bg);
			
			title = new Image(Assets.getAtlas().getTexture("welcome_title"));
			title.x = bg.width-200-title.width/2;
			title.y = 20;
			this.addChild(title);
			
			hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));
			this.addChild(hero);
			
			//animacion
			//var tween:Tween = new Tween (hero, 1); //lo pone en escena
			//tween.animate("x", 400); //modifico la coordenada x para que se desplace a la posicion 400
			//tween.animate("y", 300);
			//tween.animate("y", 400);
			//Starling.juggler.add(tween); //lo anima
			
			playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
			playBtn.x = 400-playBtn.width/2;
			playBtn.y = 280;			
			this.addChild(playBtn);
			
			aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
			aboutBtn.x = 500-aboutBtn.width/2;
			aboutBtn.y = 400;
			this.addChild(aboutBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
			
		}
		
		private function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((event.target as Button == playBtn))
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id: "play" }, true));
			}
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			//if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, heroAnimation);
		}
		
		public function initialize():void
		{
			this.visible = true;
			hero.x = -hero.width;
			hero.y = 100;
			
			TweenLite.to(hero, 2, { x:80 } );
			
			this.addEventListener(Event.ENTER_FRAME, heroAnimation);
		}
		
		private function heroAnimation(event:Event):void {
			
			var currentDate:Date = new Date();
			
			hero.y = bg.height-hero.height-20 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			playBtn.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			aboutBtn.y = 400-aboutBtn.width/2; + (Math.cos(currentDate.getTime() * 0.002) * 25);

		}
	}

}