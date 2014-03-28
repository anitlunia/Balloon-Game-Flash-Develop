package  
{
	import events.NavigationEvent;
	import screens.InGame;
	import screens.Welcome;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Yo
	 */
	public class Game extends Sprite 
	{
		private var ScreenWelcome:Welcome;
		private var screenInGame:InGame;
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Juego inicializado");
			
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			ScreenWelcome = new Welcome();
			this.addChild(ScreenWelcome);
			ScreenWelcome.initialize();
		}
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "play":
					ScreenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
			}
		}
	}

}