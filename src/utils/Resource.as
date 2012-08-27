package utils 
{
	import entities.towers.*;
	/**
	 * ...
	 * @author Dreauw
	 */
	public class Resource {
		// Graphic
		[Embed(source = "/tileset.png")] public static const TILESET:Class;
		[Embed(source = "/particles.png")] public static const PARTICLES:Class;
		[Embed(source = "/cursor.png")] public static const CURSOR:Class;
		[Embed(source = "/crystal.png")] public static const CRYSTAL:Class;
		[Embed(source = "/button.png")] public static const BUTTON:Class;
		[Embed(source = "/title.png")] public static const TITLE:Class;
		
		// lvl1
		[Embed(source = "/archerytower1.png")] public static const ARCHERY_TOWER_1:Class;
		[Embed(source = "/slowtower1.png")] public static const SLOW_TOWER_1:Class;
		[Embed(source = "/towerselector1.png")] public static const TOWER_SELECTOR_1:Class;
		[Embed(source = "/strongtower1.png")] public static const STRONG_TOWER_1:Class;
		[Embed(source = "/man1.png")] public static const MAN_1:Class;
		[Embed(source = "/man2.png")] public static const MAN_2:Class;
		[Embed(source = "/bird1.png")] public static const BIRD_1:Class;
		[Embed(source = "/dinoman1.png")] public static const DINO_MAN_1:Class;
		[Embed(source = "/boss1.png")] public static const BOSS_1:Class;
		
		// lvl2
		[Embed(source = "/archerytower2.png")] public static const ARCHERY_TOWER_2:Class;
		[Embed(source = "/slowtower2.png")] public static const SLOW_TOWER_2:Class;
		[Embed(source = "/towerselector2.png")] public static const TOWER_SELECTOR_2:Class;
		[Embed(source = "/strongtower2.png")] public static const STRONG_TOWER_2:Class;
		[Embed(source = "/poisontower2.png")] public static const POISON_TOWER_2:Class;
		[Embed(source = "/trap2.png")] public static const TRAP_2:Class;
		[Embed(source = "/man3.png")] public static const MAN_3:Class;
		[Embed(source = "/man4.png")] public static const MAN_4:Class;
		[Embed(source = "/horse2.png")] public static const HORSE_2:Class;
		[Embed(source = "/boss2.png")] public static const BOSS_2:Class;
		
		// lvl3
		[Embed(source = "/archerytower3.png")] public static const ARCHERY_TOWER_3:Class;
		[Embed(source = "/slowtower3.png")] public static const SLOW_TOWER_3:Class;
		[Embed(source = "/towerselector3.png")] public static const TOWER_SELECTOR_3:Class;
		[Embed(source = "/strongtower3.png")] public static const STRONG_TOWER_3:Class;
		[Embed(source = "/poisontower3.png")] public static const POISON_TOWER_3:Class;
		[Embed(source = "/man5.png")] public static const MAN_5:Class;
		[Embed(source = "/man6.png")] public static const MAN_6:Class;
		[Embed(source = "/tank3.png")] public static const TANK:Class;
		
		
		// Audio
		[Embed(source = "/LVL1.mp3")] public static const LVL1_ZIC:Class;
		[Embed(source = "/LVL2.mp3")] public static const LVL2_ZIC:Class;
		[Embed(source = "/LVL3.mp3")] public static const LVL3_ZIC:Class;
		[Embed(source = "/TitleScreen.mp3")] public static const TITLE_ZIC:Class;
		
		// Level
		[Embed(source = "/lvl1.vdo", mimeType = "application/octet-stream")] public static const LVL1:Class;
		[Embed(source = "/lvl2.vdo", mimeType = "application/octet-stream")] public static const LVL2:Class;
		[Embed(source = "/lvl3.vdo", mimeType = "application/octet-stream")] public static const LVL3:Class;
		
		// Tower Accessible
		public static const TOWER_LVL:Array = [
		[
		[ArcheryTower1, ARCHERY_TOWER_1],
		[SlowTower1, SLOW_TOWER_1],
		[StrongTower1, STRONG_TOWER_1]
		],
		
		[
		[ArcheryTower2, ARCHERY_TOWER_2],
		[SlowTower2, SLOW_TOWER_2],
		[StrongTower2, STRONG_TOWER_2],
		[PoisonTower2, POISON_TOWER_2],
		[Trap, TRAP_2]
		],
		
		[
		[ArcheryTower3, ARCHERY_TOWER_3],
		[SlowTower3, SLOW_TOWER_3],
		[StrongTower3, STRONG_TOWER_3],
		[PoisonTower3, POISON_TOWER_3],
		[Trap, TRAP_2]
		]
		];
		
		// Waves
		
	}

}