package worlds {
	import entities.Button;
	import entities.Crystal;
	import entities.enemies.*;
	import entities.Map;
	import net.flashpunk.graphics.Text;
	import utils.Resource;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import utils.Audio;
	import net.flashpunk.World;
	
	public class WorldGame extends World{
		public var map:Map;
		public var life:uint;
		public var or:uint;
		public var text:Text;
		public var lvl:uint = 1;
		public var timer:Number = 0;
		public var mobType:Array;
		public var mobCounter:uint = 0;
		public var mobSerie:Array = [0, 0];
		public var button:Button;
		public var canWave:Boolean = false;
		public var towerInformer:Text;
		public var waveIndex:uint = 0;
		public var mobComing:Text;
		
		
	private var mobTypes:Array = [
		[Man1, Man2, Bird1, DinoMan1, Boss1],
		[Man3, Man4, Bird1, Horse, Boss2],
		[Man5, Man6, Tank, Boss1, Boss2]
	];
	
	private var waves:Array = [
		[[3, 0, 0, 0, 0],
		[4, 1, 0, 0, 0],
		[10, 0, 0, 0, 0],
		[8, 2, 0, 0, 0],
		[10, 2, 2, 0, 0],
		[3, 5, 3, 0, 0],
		[0, 10, 5, 0, 0],
		[10, 0, 0, 5, 0],
		[20, 0, 0, 5, 0],
		[25, 0, 0, 0, 1],
		],
		
		[[5, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[10, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[5, 5, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 8, 3, 0, 0, 0],
		[10, 5, 0, 0, 0, 5, 0, 0, 0, 0],
		[15, 8, 0, 0, 0, 10, 5, 0, 0, 0],
		[10, 12, 3, 0, 0, 10, 12, 3, 0, 0],
		[15, 15, 15, 5, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 15, 15, 5, 0, 0],
		[20, 20, 2, 3, 0, 20, 20, 2, 3, 0],
		[0, 0, 0, 10, 0, 0, 0, 0, 10, 0],
		[0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 30, 0, 0, 0, 0],
		[10, 10, 5, 0, 0, 10, 10, 5, 0, 0],
		[1, 0, 0, 0, 2, 1, 0, 0, 0, 2]
		],
		
		[[5, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
	];
		public function WorldGame() {
			super();
			map = new Map(this);
			button = new Button(0, 0);
			button.x = (FP.screen.width / (FP.screen.scale)) -  button.width - 2;
			button.y = (FP.screen.height / (FP.screen.scale)) - 12;
			text = new Text("Life : " + life.toString() + "\n" + "PO : " + or.toString());
			text.size = 8;
			text.scrollX = text.scrollY = 0;
			text.x = (FP.screen.width / (FP.screen.scale)) -  button.width - 2;
			text.y = (FP.screen.height / (FP.screen.scale)) - 30;
			towerInformer = new Text("", 0, 0);
			towerInformer.scrollX = towerInformer.scrollY = 0;
			towerInformer.size = 8;
			mobComing = new Text("");
			mobComing.size = 8;
			mobComing.scrollX = mobComing.scrollY = 0;
			startLvl(1);
		}
		
		public function startLvl(lv:uint):void {
			lvl = lv;
			waveIndex = 0;
			mobCounter = 0;
			if (lv == 1) {
				life = 10;
				or = 50;
				updateHud();
				map.load(Resource.LVL1);
				Audio.playMusic(Resource.LVL1_ZIC);
				mobComing.text = "Your goal is to protect the crystal\nFor that, you will need to place towers\nUse arrow key to move the camera\nSelect a tower at the bottom and click on the map to place\nA tower cost few \"PO\" and take a few second to be ready\nPress \"Start Wave\" button when you are ready";
				mobComing.x = ((FP.screen.width / 2) - mobComing.width) / 2;
			} else if (lv == 2) {
				life = 10;
				or = 100;
				updateHud();
				checkMobComing();
				map.load(Resource.LVL2);
				Audio.playMusic(Resource.LVL2_ZIC);
			} else if (lv == 3) {
				
				life = 10;
				or = 200;
				updateHud();
				waveIndex = 1;
				checkMobComing();
				map.load(Resource.LVL3);
				Audio.playMusic(Resource.LVL3_ZIC);
			}
			button.setLabel("Start Wave");
			button.setCallBack(startWave);
		}
		
		public function evoluate():void {
			startLvl(lvl + 1);
			canWave = false;
		}
		
		public function generateWave(indexBase:uint = 0):void {
			var randomMax:uint = 6;
			if (mobCounter > 20) randomMax = 12;
			if (mobCounter > 10 && indexBase == 0 && Math.round(Math.random() * 1) == 0) {
				generateWave(5);return
			}
			waves[lvl - 1][waveIndex-1][0+indexBase] = Math.round(Math.random() * randomMax)+1;
			if (mobCounter > 10) waves[lvl - 1][waveIndex - 1][1+indexBase] = Math.round(Math.random() * (randomMax-5));
			waves[lvl - 1][waveIndex - 1][3+indexBase] = Math.round(Math.random() * (randomMax));
			if (mobCounter > 10) waves[lvl - 1][waveIndex - 1][4+indexBase] = Math.round(Math.random() * (randomMax - 5));
			if (mobCounter > 70) waves[lvl - 1][waveIndex - 1][2 + indexBase] = Math.round(Math.random() * 3);
			if (mobCounter > 30 && indexBase == 0 && Math.round(Math.random() * 1) == 0) {
				generateWave(5);return
			}
		}
		
		public function canEvoluate():void {
			button.setLabel("Evolution");
			button.setCallBack(evoluate);
		}
		
		public function startWave():void {
			if (lvl == 1 && mobComing.text != "") mobComing.text = "";
			if (canWave) return;
			canWave = true;
			if (lvl != 3) waveIndex += 1;
			button.setLabel("Wave " + waveIndex.toString());
		}
		
		public function checkMobComing():void {
			if (lvl <= 1) return;
			var left:Boolean = false;
			var right:Boolean = false;
			mobComing.text = "In the next wave, mob are coming from the ";
			var i:uint = 0
			var nbr:uint;
			if (lvl == 3) {
				for each(nbr in waves[lvl - 1][waveIndex - 1]) {
					if (nbr > 0) (i > 4) ?  right = true : left = true;
					i++;
				}
			} else {
				for each(nbr in waves[lvl - 1][waveIndex]) {
					if (nbr > 0) (i > 4) ?  right = true : left = true;
					i++;
				}
			}
			if (left) mobComing.text += "left";
			if (right && !left) mobComing.text += "right";
			if (right && left) mobComing.text += " and right";
			mobComing.x = ((FP.screen.width / 2) - mobComing.width) / 2;
		}
		
		override public function update():void {
			if (Input.released(Key.M)) Audio.stop();
			if (canWave) {
				timer -= FP.elapsed;
				if (timer <= 0) {
					var i:uint = 0;
					var newWave:Boolean = true;
					var mob:EnemyBase;
					for each(var nbr:uint in waves[lvl - 1][waveIndex - 1]) {
						if (newWave && nbr > 0) {
							newWave = false;
							if (i > 4) {
								mob = new mobTypes[lvl - 1][i - 5](1573, 124, true);
							} else {
								mob = new mobTypes[lvl - 1][i](10, 80);
							}
							if (lvl == 3 && mobCounter > 200) (mob.life += mobCounter - 200);
							add(mob);
							waves[lvl - 1][waveIndex - 1][i]--;
							timer = 0.5;
							break;
						}
						i++;
					}
					if (newWave) {
						if (lvl == 3) generateWave();
						canWave = false;
						button.setLabel("Start Wave");
						if (lvl > 1) checkMobComing(); 
					}
				}
				
			}
			super.update();
		}
		
		public function updateHud():void {
			text.text = "Life : " + life.toString() + "\n" + "PO : " + or.toString();
		}
		
		public function loseLife(_life:uint):void {
			life -= _life;
			if (life <= 0) life = 0;
			updateHud();
			if (life <= 0) gameOver();
		}
		
		public function gameOver():void {
			var a:Array = new Array();
			getType("crystal", a);
			var crystal:Crystal = a[0] as Crystal;
			map.cursor.moveCameraX(Math.abs( FP.camera.x - crystal.x ) - FP.screen.width/4 );
			crystal.destroy();
		}
	}

}