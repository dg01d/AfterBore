// Quick & Simple Fist Skill Location Display Script
// Shabob (#1621870), Not Dead Yet Clan
// http://notdeadyet.bongley.net

notify ShaBob;

int fistScrolls = get_property("fistSkillsKnown").to_int();


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

void teach()
	{
	print_html("<b>You should seek Wisdom in the following locations:</b>");

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
		if (get_property ( locale )==false) // Simple if/else validation for the coloured sane outputs
//			{
//			print(""+ locale.to_place() + ": True", "green" );
//			}
//		else
			{
			print(""+ locale.to_place(), "red" );
			}
	}

void print()
{
	print("");
	print ("You have learned " + fistScrolls +" Skills", "olive"); //Outputs total skills known

	if(fistScrolls > 10) 
	{
		print_html("A student came to see Zonshu. Kneeling at the masters feet he produced a Shakuhachi and blew a single note. Zonshu rose, took the student by the arm and placing him upon the seat cried to his students - I am one of you!");
	}
	else
	{
		if(fistScrolls > 0) 
		{
		skill [int] scroll;
		foreach f in $skills[
				Flying Fire Fist,
				Salamander Kata,
				Drunken Baby Style,
				Stinkpalm,
				Worldpunch,
				Knuckle Sandwich,
				Seven-Finger Strike,
				Miyagi Massage,
				Chilled Monkey Brain Technique,
				Zendo Kobushi Kancho]
		scroll[count(scroll) + 1] = f;
		for b from 1 to fistScrolls
			print( scroll[b] );
		}
		else print_html("A student asked Zoshu  - How many skills have I learned? <br />Zoshu replied - How shall I make water?<br />Chastened, the student left to begin his studies, as should you");
	}
	print("");

}


void main()
{
	teach();
	print();
}

