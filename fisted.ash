// Quick & Simple Fist Skill Location Display Script
// Shabob (#1621870), Not Dead Yet Clan
// http://notdeadyet.bongley.net

notify ShaBob;

if(my_path() != "Way of the Surprising Fist") {
	print("You are not a follower of the Way of the Surprising Fist. These skills are beyond you.");
	exit;
}


int fistScrolls = get_property("fistSkillsKnown").to_int();
int fistCharity = get_property("charitableDonations").to_int();
int fistBardo = get_property("totalCharitableDonations").to_int();

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


// Print list of skills currently known, not just scrolls studied
skill [int] fist;
foreach s in $skills[
					Flying Fire Fist,
					Salamander Kata,
					Drunken Baby Style,
					Stinkpalm,
					Worldpunch,
					Knuckle Sandwich,
					Seven-Finger Strike,
					Miyagi Massage,
					Chilled Monkey Brain Technique,
					Zendo Kobushi Kancho
					]
	if(have_skill(s)) fist[count(fist)] = s;
	if(count(fist) == 10 && have_skill($skill[Master of the Surprising Fist]))
		print_html("&nbsp;&nbsp;A student came to see Zonshu. Kneeling at<br />&nbsp;&nbsp;&nbsp;the masters feet he produced a Shakuhachi<br />&nbsp;&nbsp;and blew a single note. Zonshu rose, took<br />&nbsp;&nbsp;the student by the arm and placing him on<br />&nbsp;&nbsp;the seat cried to his students: I am one of you!");	
	else if(count(fist) == 0)
		print_html(
		"&nbsp;&nbsp;A student asked Zoshu  - How many skills have I learned? <br />&nbsp;&nbsp;&nbsp;Zoshu replied - How shall I make water?<br />&nbsp;&nbsp;Chastened, the student left to begin his studies, as should you");
	else {
		print_html("<b>You have learned "+count(fist)+" Way"+(count(fist) == 1?"":"s")+" of the Surprising Fist</b>");
		foreach i,s in fist
			print_html("&nbsp;&nbsp;"+(s==$skill[Worldpunch]? "<span style='color:#B22222;font-weight:bold'>":"")+s+(s==$skill[Worldpunch]? "</span>":""));
}

// Are there unstudied scolls? Kwatz!
int scroll = available_amount($item[Teachings of the Fist]);
if(scroll > 0) {
		print("");
		print_html("<span style='color:#6b8e23;font-weight:bold'>&nbsp;&nbsp;Kwatz! Has your candle burned out?<br />&nbsp;&nbsp;You possess "+scroll+" Teachings of the Fist Scroll"+(scroll == 1? "": "s")+" that remain"+(scroll == 1? "s": "")+" unread.</span>");
		}
		
// Print out locations left to learn fist skills
if(get_property("fistSkillsKnown") == "11") exit;
print("");


print_html("<b>You should seek Wisdom in the following locations:</b>");
	foreach locale in $strings [ 	
					fistTeachingsBarroomBrawl,
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
			{
			print_html("<font color='red'>&nbsp;&nbsp;&nbsp;"+ locale.to_place() +"</font>" );
			}

	print("");
	print_html("You have donated <b>" + fistCharity +"</b> meat in this life.<br /><br /> Voice from the Bardo:<br />'You donated <b>"+fistBardo+"</b> meat<br /> in this life and past'.");
	print("");


