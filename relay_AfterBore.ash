// ShaBob's RELAY_AFTERBORE Script
// http://kolmafia.us/showthread.php?t=


notify "ShaBob";
import <htmlform.ash> 
import <consumption.ash>
import <zlib.ash>

string thisver = "0.9.7";		// This is the script's version!
int AfterBore_PAGE = 9999;
 
// check_version("relay_AfterBore", "relay_AfterBore", thisver, AfterBore_PAGE);

// Thanks to those whose work has been absorbed to make this: 
//    jasonharper, Bale & Especially Panama Joe whose idea this is.
//
//////////////////////////////////////////////////////////////////////
//                                                                  //
//             This is a relay script to set                        //
//             options for ShaBob's AfterBore                       //
//             Script.                                              //
//                                                                  //
//             All Comments Welcome                                 //
//                                                                  //
//////////////////////////////////////////////////////////////////////


void main() { 
    	write_page(); 
//	writeln(check_version("relay_AfterBore", "relayAfterBore", thisver, 7015));     
	writeln("<br />");	
	write_box("AfterBore Settings v"+ thisver);

// Collecting & Donating
	write_box("<b>Collecting & Donating</b>");
		writeln("<table>");
		writeln("<tr><td>Collect Pretty Flowers in AfterBore?</td>");
		writeln("<td>");
		vars["borePvp"] = write_check(vars["borePvp"].to_boolean(), "afterbore pvp setting", "");
		writeln("</td></tr>");

		writeln("<tr><td>Donate to the Hero Statues in AfterBore?</td>");
		writeln("<td>");
		vars["boreDonate"] = write_check(vars["boreDonate"].to_boolean(), "afterbore donate setting", "");
		writeln("</td></tr>");
		writeln("</table>");
	finish_box();


// Dieting
	write_box("<b>Dieting</b>");
		writeln("<table>");
		writeln("<tr><td>Eat Special Foods for Trophy in AfterBore?</td>");
		writeln("<td>");

		vars["boreDiet"] = write_check(vars["boreDiet"].to_boolean(), "afterbore diet setting", "");
		writeln("</td></tr>");
		writeln("<tr><td colspan='2' align='center'>Food Trophy Consumption To Date</td></tr>");

/*		writeln("<tr><td>Spaghetti with Skullheads</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[spaghetti with skullheads]] + "/5");
		writeln("</tr></td>");
*/
/*
		writeln("<tr><td>Ghuol Guolash</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[ghuol guolash]] + "/11");
		writeln("</tr></td>");
*/
		writeln("<tr><td align=\"right\">Herb Brownies&#58;</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[herb brownies]] + "/420");
		writeln("</tr></td>");
/*
		writeln("<tr><td>White Choc & Tomato Pizza</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[white chocolate and tomato pizza]] + "/5");
		writeln("</tr></td>");
		writeln("<tr><td>Lucky Surprise Egg</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[lucky surprise egg]] + "/5");
		writeln("</tr></td>");
*/

		writeln("<tr><td align=\"right\">White Citadel Burger&#58;</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[White Citadel Burger]] + "/60");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">White Citadel Fries&#58;</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[White Citadel Fries]] + "/10");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">Black Puddings Defeated&#58;</td>");
		writeln("<td>");
		writeln("" +get_property("blackPuddingsDefeated") + "/240");
		writeln("</tr></td>");


		writeln("<tr><td>Special Food to Eat</td>");
		writeln("<td>");

		vars["boreDiet_Food"] = write_choice(vars["boreDiet_Food"], "afterbore diet food setting", "", $strings[Black Pudding, Herb Brownies, White Citadel Burger, White Citadel Fries] );
		writeln("</td></tr>");

		writeln("<tr><td>Drink Special Drink in AfterBore?</td>");
		writeln("<td>");

		vars["boreDrink"] = write_check(vars["boreDrink"].to_boolean(), "afterbore drink setting", "");
		writeln("</td></tr>");

		writeln("<tr><td colspan='2' align='center'>Booze Trophy Consumption To Date</td></tr>");
		
		writeln("<tr><td align=\"right\">Around the World&#58;</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[Around the World]] + "/80");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">White Canadian&#58;</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[White Canadian]] + "/30");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">Tomato Daiquiri&#58;</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[tomato daiquiri]] + "/5");
		writeln("</tr></td>");


		writeln("<tr><td>Drink to Drink</td>");
		writeln("<td>");

		vars["boreDiet_Drink"] = write_choice(vars["boreDiet_Drink"], "afterbore diet drink setting", "", $strings[White Canadian, Tomato Daiquiri, Around the World] );
		writeln("</td></tr>");

/*
		writeln("<tr><td>Select Filler Drink (all 1 drunk)</td>");
		writeln("<td>");
		set_property( "boreDiet_Drink_Filler", write_choice(get_property("boreDiet_Drink_Filler"), "boreDiet_Drink_Filler", "", $strings[pumpkin beer, distilled fortified wine, thermos full of Knob coffee, Moonthril Schnapps, cup of primitive beer, can of Swiller, McMillicancuddy's Special Lager, melted Jell-o shot, thistle wine, cruelty-free wine, elven cellocello, herringcello, slimy fermented bile bladder, Cobb's Knob Wurstbrau, shot of blackberry schnapps, cream stout, Russian Ice, shot of rotgut, booze-soaked cherry, gin-soaked blotter paper, fine wine, shot of flower schnapps, shot of grapefruit schnapps, shot of orange schnapps, shot of tomato schnapps, Ram's Face Lager, ice-cold Sir Schlitz, ice-cold Willer, Imp Ale, plastic cup of beer]) );
		writeln("</td></tr>");
*/


/*
		writeln("<tr><td>Use particular Spleen Item in AfterBore?</td>");
		writeln("<td>");
		set_property("boreSpleen", write_check(get_property("boreSpleen").to_boolean(), 
		"boreSpleen", ""));
		writeln("</td></tr>");


		writeln("<tr><td>Special Spleen Item</td>");
		writeln("<td>");
		set_property( "boreDiet_Spleen", write_choice(get_property("boreDiet_Spleen"), "boreDiet_Spleen", "", $strings[Agua de Vida, Roc Feather, Coffee Pixie Sticks, Beastly paste, Bug paste, Cloryphyll paste, Cosmic paste, Crimbo paste, Demonic paste, Ectoplasmic paste, Elemental paste, Fishy paste, Goblin paste, Gooey paste, Greasy paste, Hippy paste, Hobo paste, Indescribably Horrible paste, Mer-Kin paste, Oily paste, Orc paste, Penguin paste, Pirate paste, Slimy paste, Strange paste ]) );
		writeln("</td></tr>");
*/
		writeln("</table>");
	finish_box();

// Clodhoppering
	write_box("<b>Faxing</b>");
		writeln("<table>");

		writeln("<tr><td>Use Fax, 4d, Putty to Fight Monster in AfterBore?</td>");
		writeln("<td>");

		vars["boreClod"] = write_check(vars["boreClod"].to_boolean(), "afterbore fight setting", "");
		writeln("</td></tr>");

		writeln("<tr><td>Monster to fight</b></td>");
		writeln("<td>");
		attr("size='24'");

		vars["boreMonster"] = write_field(vars["boreMonster"], "afterbore monster name", "");
		writeln("</td></tr>");
		writeln("<tr><td>CCS to use for 4D Camera</td>");
		writeln("<td>");
		attr("size='24'");

		vars["boreClod_4dCCS"] = write_field(vars["boreClod_4dCCS"], "afterbore 4d css name", "");
		writeln("</td></tr>");
		writeln("</td></tr>");
		writeln("<tr><td>CCS to use for Spooky Putty</td>");
		writeln("<td>");
		attr("size='24'");

		vars["boreClod_PuttyCCS"] = write_field(vars["boreClod_PuttyCCS"], "afterbore Putty css name", "");
		writeln("</td></tr>");
		writeln("</table>");
	finish_box();


// Shoretrips

	write_box("<b>What to Do? Tripping, Fighting or Scripting</b>");
		writeln("<table>");
		
		writeln("<tr><td>Take Shore Trips in AfterBore?</td>");
		writeln("<td>");

		vars["boreShore"] = write_check(vars["boreShore"].to_boolean(), "afterbore shore setting", "");
		writeln("</td></tr>");

		writeln("<tr><td>Shoretrips Taken To Date</td>");
		writeln("<td>");

		vars["boreShoretrips"] = write_field(vars["boreShoretrips"], "afterbore shore count", "Set this yourself if Wrong <br />& Reset for each Ascension!");
//		writeln(vars["boreShoretrips"]);
		writeln("</td></tr>");
		writeln("<tr><td>Stat to Boost with Shoretrips</td>");
		writeln("<td>");

		vars["boreShoreStat"] = write_choice($stat[Moxie], "afterbore stat setting", "", $stats[] );

		writeln("</td></tr>");

// Black Forest Hunting
		writeln("<tr><td colspan='2' align='center'><b>&#8212;OR&#8212;</td></tr>");
		
		writeln("<tr><td>Farm Black Items in AfterBore?</td>");
		writeln("<td>");

		vars["boreBlackFarm"] = write_check(vars["boreBlackFarm"].to_boolean(), "afterbore black farm setting", "");
		writeln("</td></tr>");

		writeln("<tr><td>CSS to use for Black Forest Farming</td>");
		writeln("<td>");
		attr("size='24'");
		vars["boreBlackFarm_CSS"] = write_field(vars["boreBlackFarm_CSS"], "afterbore black forest ccs", "");
		writeln("</td></tr>");

// Users own Script
		writeln("<tr><td colspan='2' align='center'><b>&#8212;OR&#8212;</td></tr>");
		writeln("<tr><td>Do your own thing in AfterBore?</td>");
		writeln("<td>");

		vars["boreUserChoice"] = write_check(vars["boreUserChoice"].to_boolean(), "afterbore user choice setting", "");
		writeln("</td></tr>");

		writeln("<tr><td>Script to use for own adventuring</td>");
		writeln("<td>");
		attr("size='24'");
		vars["boreUser_Script"] = write_field(vars["boreUser_Script"], "afterbore user script", "");
		writeln("</td></tr>");
		writeln("</table>");
	finish_box();

		
// Rollover
	write_box("<b>Rollover</b>");
		writeln("<table>");
		writeln("<tr><td>Allow Afterbore.ash to manage your rollover?</td>");
		writeln("<td>");
		vars["boreRollover"] = write_check(vars["boreRollover"].to_boolean(), "afterbore rollover setting", "");
		writeln("</td></tr>");
		writeln("<tr><td>What to Boost for Rollover</td>");
		writeln("<td>");
		vars["boreRolloverPref"] = write_choice(vars["boreRolloverPref"], "afterbore roll setting", "", $strings[Adventures, PvP Fights] );
		writeln("</td></tr>");
		writeln("<tr><td>Clan to spend the night in</td>");
		writeln("<td>");
		write_label("Rollover Clan", "");
		attr("size='24'");

		vars["boreRolloverClan"] = write_field(vars["boreRolloverClan"], "afterbore rollover clan name", "");
		writeln("</td></tr>");
		writeln("</table>");
	finish_box();
	finish_box();
//	write_button("", "Save changes");
	if(write_button("save", "Save"))
	{
		writeln("<font color='green'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Settings saved at "+ now_to_string("d MMM yyyy HH:mm: Z") +"</font>");
		updatevars();
	}


	finish_page(); 
}  
