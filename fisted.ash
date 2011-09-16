// Quick & Simple Fist Skill Location Display Script
// Shabob (#1621870), Not Dead Yet Clan
// http://notdeadyet.bongley.net

notify ShaBob;

string to_place(string locale) // Used to make sane outputs
{
	switch( locale )
	{
	case	"fistTeachingsBarroomBrawl": 	return $string[Barroom Brawl];
	case	"fistTeachingsHaikuDungeon": 	return $string[Haiku Dungeon];
	case	"fistTeachingsPokerRoom": 	return $string[Poker Room];
	case	"fistTeachingsConservatory": 	return $string[Conservatory];
	case	"fistTeachingsBatHole": 	return $string[Bat Hole Entryway];
	case	"fistTeachingsFunHouse": 	return $string[Fun House];
	case	"fistTeachingsMenagerie": 	return $string[Menagerie Level 2];
	case	"fistTeachingsSlums": 		return $string[Pandamonium Slums];
	case	"fistTeachingsFratHouse": 	return $string[Frat House];
	case	"fistTeachingsRoad": 		return $string[Road to White Citadel];
	case	"fistTeachingsNinjaSnowmen": 	return $string[Lair of Ninja Snowmen];  
	}
	return $string[ Master Kan ];
}


void print()
{
	print ("Total Skills Known: " + get_property( "fistSkillsKnown" ), "olive"); //Outputs total skills known

	foreach locale in $strings [ 	fistTeachingsBarroomBrawl,
					fistTeachingsHaikuDungeon,
					fistTeachingsPokerRoom,
					fistTeachingsConservatory,     
					fistTeachingsBatHole,  
					fistTeachingsFunHouse, 
					fistTeachingsMenagerie,
					fistTeachingsSlums,    
					fistTeachingsFratHouse,
					fistTeachingsRoad,     
					fistTeachingsNinjaSnowmen     
					]
		if (get_property ( locale )==true) // Simple if/else validation for the coloured sane outputs
			{
			print(""+ locale.to_place() + ": True", "green" );
			}
		else
			{
			print(""+ locale.to_place() + ": False", "red" );
			}

}


void main()
{
	print();
}

