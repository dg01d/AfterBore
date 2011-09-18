// ShaBob's RELAY_AFTERBORE Script
// http://kolmafia.us/showthread.php?t=


notify "ShaBob";
import "htmlform.ash"; 
import "consumption.ash";
import "zlib.ash"
string thisver = "0.9.3";		// This is the script's version!


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
	writeln("<table>");
// Pvp
		writeln("<tr><td><b>PvP</b></td></tr>");
		writeln("<tr><td>Collect Pretty Flowers in AFterBore?</td>");
		writeln("<td>");
		set_property("borePvp", write_check(get_property("borePvp").to_boolean(), 
		"borePvp", ""));
		writeln("</td></tr>");




// Dieting
		writeln("<tr><td><b>Dieting</b></td></tr>");
		writeln("<tr><td>Eat Special Foods for Trophy in AfterBore?</td>");
		writeln("<td>");
		set_property("boreDiet", write_check(get_property("boreDiet").to_boolean(), 
		"boreDiet", ""));
		writeln("</td></tr>");
		writeln("<tr><td align=\"right\">Food Trophy Consumption To Date</td></tr>");

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
		writeln("<tr><td align=\"right\">Herb Brownies</td>");
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
		writeln("<tr><td align=\"right\">Black Pudding</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[black pudding]] + "/500");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">White Citadel Burger</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[White Citadel Burger]] + "/60");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">White Citadel Fries</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[White Citadel Fries]] + "/10");
		writeln("</tr></td>");

		writeln("<tr><td>Special Food to Eat</td>");
		writeln("<td>");
		set_property( "boreDiet_Food", write_choice(get_property("boreDiet_Food"), "boreDiet_Food", "", $strings[Black Pudding, Herb Brownies, White Citadel Burger, White Citadel Fries]) );
		writeln("</td></tr>");



		writeln("<tr><td>Drink Special Drink in AfterBore?</td>");
		writeln("<td>");
		set_property("boreDrink", write_check(get_property("boreDrink").to_boolean(), 
	  "boreDrink", ""));
		writeln("</td></tr>");

		writeln("<tr><td align=\"right\">Booze Trophy Consumption To Date</td></tr>");
		
		writeln("<tr><td align=\"right\">Around the World</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[Around the World]] + "/80");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">White Canadian</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[White Canadian]] + "/30");
		writeln("</tr></td>");

		writeln("<tr><td align=\"right\">Tomato Daiquiri</td>");
		writeln("<td>");
		writeln("" +booze_consumed[$item[tomato daiquiri]] + "/30");
		writeln("</tr></td>");


		writeln("<tr><td>Drink to Drink</td>");
		writeln("<td>");
		set_property( "boreDiet_Drink", write_choice(get_property("boreDiet_Drink"), "boreDiet_Drink", "", $strings[White Canadian, Tomato Daquiri, Around the World]) );
		writeln("</td></tr>");


		writeln("<tr><td>Select Filer Drink (all 1 drunk)</td>");
		writeln("<td>");
		set_property( "boreDiet_Drink_Filler", write_choice(get_property("boreDiet_Drink_Filler"), "boreDiet_Drink_Filler", "", $strings[pumpkin beer, distilled fortified wine, thermos full of Knob coffee, Moonthril Schnapps, cup of primitive beer, can of Swiller, McMillicancuddy's Special Lager, melted Jell-o shot, thistle wine, cruelty-free wine, elven cellocello, herringcello, slimy fermented bile bladder, Cobb's Knob Wurstbrau, shot of blackberry schnapps, cream stout, Russian Ice, shot of rotgut, booze-soaked cherry, gin-soaked blotter paper, fine wine, shot of flower schnapps, shot of grapefruit schnapps, shot of orange schnapps, shot of tomato schnapps, Ram's Face Lager, ice-cold Sir Schlitz, ice-cold Willer, Imp Ale, plastic cup of beer]) );
		writeln("</td></tr>");




		writeln("<tr><td>Use particular Spleen Item in AfterBore?</td>");
		writeln("<td>");
		set_property("boreSpleen", write_check(get_property("boreSpleen").to_boolean(), 
		"boreSpleen", ""));
		writeln("</td></tr>");


		writeln("<tr><td>Special Spleen Item</td>");
		writeln("<td>");
		set_property( "boreDiet_Spleen", write_choice(get_property("boreDiet_Spleen"), "boreDiet_Spleen", "", $strings[Agua de Vida, Roc Feather, Coffee Pixie Sticks, Beastly paste, Bug paste, Cloryphyll paste, Cosmic paste, Crimbo paste, Demonic paste, Ectoplasmic paste, Elemental paste, Fishy paste, Goblin paste, Gooey paste, Greasy paste, Hippy paste, Hobo paste, Indescribably Horrible paste, Mer-Kin paste, Oily paste, Orc paste, Penguin paste, Pirate paste, Slimy paste, Strange paste ]) );
		writeln("</td></tr>");



// Clodhoppering
		writeln("<tr><td><b>Fighting & Collecting</b></td></tr>");
		writeln("<tr><td>Use Fax, 4d, Putty to Fight Monster in AfterBore?</td>");
		writeln("<td>");
		set_property("boreClod", write_check(get_property("boreClod").to_boolean(), 
	  "boreClod", ""));
		writeln("</td></tr>");

		writeln("<tr><td>Monster to fight - <b>Use Faxbot Name!</b></td>");
		writeln("<td>");
		attr("size='24'");
		set_property("boreMonster", write_field(get_property("boreMonster"), "Monster Name", ""));

		writeln("<tr><td>CCS to use for 4D Camera</td>");
//		write_label("Camera CCS", "CCS to use for 4D Camera");
		writeln("<td>");
		attr("size='24'");
		set_property("boreClod_4dCCS", write_field(get_property("boreClod_4dCCS"), "Camera CCS", ""));

		writeln("</td></tr>");
		writeln("<tr><td>CCS to use for Spooky Putty</td>");
//		write_label("Putty CCS", "CCS to use for Spooky Putty");
		writeln("<td>");
		attr("size='24'");
		set_property("boreClod_PuttyCCS", write_field(get_property("boreClod_PuttyCCS"), "Putty CCS", ""));
		writeln("</td></tr>");


// Donating
		writeln("<tr><td><b>Donating</b></td></tr>");
		writeln("<tr><td>Donate to the Hero Statues in AfterBore?</td>");
		writeln("<td>");
		set_property("boreDonate", write_check(get_property("boreDonate").to_boolean(), 
		"boreDonate", ""));
		writeln("</td></tr>");



// Shoretrips
		writeln("<tr><td><b>Tripping</b></td></tr>");
		writeln("<tr><td>Take Shore Trips in AfterBore?</td>");
		writeln("<td>");
		set_property("boreShore", write_check(get_property("boreShore").to_boolean(), 
		"boreShore", ""));
		writeln("</td></tr>");
//		writeln("<tr><td>");
		writeln("<tr><td>Shoretrips Taken To Date</td>");
		writeln("<td>");
		set_property("boreShoretrips", write_field(get_property("boreShoretrips"),  "boreShoretrips", "Set this yourself if Wrong", ""));
		writeln("</td></tr>");
		writeln("<tr><td>Stat to Boost with Shoretrips</td>");
		writeln("<td>");
		set_property("boreShore_Stat", write_choice($stat[Muscle], "boreShore_Stat", "", $stats[]) );
		writeln("</td></tr>");
		
// Rollover
		writeln("<tr><td><b>Rollover</b></td></tr>");
		writeln("<tr><td>Allow Afterbore.ash to manage your rollover?</td>");
		writeln("<td>");
		set_property("boreRollover", write_check(get_property("boreRollover").to_boolean(), 
	  	"boreRollover", ""));
		writeln("</td></tr>");

		writeln("<tr><td>Clan to spend the night in</td>");
		writeln("<td>");
		write_label("Rollover Clan", "");
		attr("size='24'");
		set_property("boreRolloverClan", write_field(get_property("boreRolloverClan"), "Rollover Clan", ""));	
		writeln("</td></tr>");
		writeln("</table>");

	finish_box();
	write_button("", "Save changes");

    	finish_page(); 
}  
