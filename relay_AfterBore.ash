// ShaBob's RELAY_AFTERBORE Script
// http://kolmafia.us/showthread.php?t=


notify "ShaBob";
import <htmlform.ash> 
import <consumption.ash>
import <zlib.ash>

string thisver = "1.0";		// This is the script's version!
int AfterBore_PAGE = 7936;
 


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


// Setting up the Shore Trip Counter
int done_trips = 0;
string page = visit_url("shore.php");
matcher shore_trips = create_matcher ( "You have taken (\\d+)" , page );
if(shore_trips.find())
	{
		done_trips = (shore_trips.group(1)).to_int();
	}

void main() { 
    	write_page(); 
	writeln(check_version("relay_AfterBore", "relayAfterBore", thisver, AfterBore_PAGE));     
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


		writeln("<tr><td align=\"right\">Herb Brownies&#58;</td>");
		writeln("<td>");
		writeln("" +food_consumed[$item[herb brownies]] + "/420");
		writeln("</tr></td>");


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

		writeln("<tr><td>");
		vars["boreClod_4d"] = write_check(vars["boreClod_4d"].to_boolean(), "afterbore 4d setting", "Use 4D Camera?");
	writeln("</td><td>");
		vars["boreClod_Putty"] = write_check(vars["boreClod_Putty"].to_boolean(), "afterbore putty setting", "Use Putty?");
		writeln("<tr><td>");
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
		writeln("<tr><td>Should AfterBore burn your Adventures?</td>");
		writeln("<td>");

		vars["boreAdv"] = write_check(vars["boreAdv"].to_boolean(), "afterbore setting", "");
		writeln("</td></tr>");


		writeln("<tr><td>What should AfterBore do with Adventures?</td>");
		writeln("<td>");
		vars["boreAdvSet"] = write_choice(vars["boreAdvSet"], "afterbore adventure setting", "", $strings[Take Vacations, Black Item Farming, User Script] );
		writeln("</td></tr>");		
		writeln("<tr><td colspan='2' align='center'><b>&#8212;&nbsp;&#8212;</td></tr>");


		writeln("<tr><td>Shoretrips Taken To Date</td>");
		writeln("<td>");
		writeln("You have taken "+ done_trips + " shore trips!");
//		set_property("boreShoretrips", write_field(get_property("boreShoretrips"),  "boreShoretrips", "Set this yourself if Wrong<br />& Reset for each Ascension", ""));
//		vars["boreShoretrips"] = write_field(vars["boreShoretrips"], "afterbore shore count", "Set this yourself if Wrong <br />& Reset for each Ascension!");

		writeln("</td></tr>");
		writeln("<tr><td>Stat to Boost with Shoretrips</td>");
		writeln("<td>");

		vars["boreShoreStat"] = write_choice($stat[Moxie], "afterbore stat setting", "", $stats[] );

		writeln("</td></tr>");

// Black Forest Hunting
		writeln("<tr><td colspan='2' align='center'><b>&#8212;OR&#8212;</td></tr>");
		


		writeln("<tr><td>CSS to use for Black Forest Farming</td>");
		writeln("<td>");
		attr("size='24'");
		vars["boreBlackFarm_CSS"] = write_field(vars["boreBlackFarm_CSS"], "afterbore black forest ccs", "");
		writeln("</td></tr>");

		writeln("<tr><td>Mood to use for Black Forest Farming</td>");
		writeln("<td>");
		attr("size='24'");
		vars["boreBlackFarm_Mood"] = write_field(vars["boreBlackFarm_Mood"], "afterbore black forest mood", "");
		writeln("</td></tr>");

// Users own Script
		writeln("<tr><td colspan='2' align='center'><b>&#8212;OR&#8212;</td></tr>");

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
		writeln("<tr><td>What to Drink for Rollover</td>");
		writeln("<td>");
		vars["boreRolloverNightCap"] = write_choice(vars["boreRolloverNightCap"], "afterbore nightcap setting", "", $strings[TrophyBooze, EatDrink, UserSelect] );
		writeln("</td></tr>");
		writeln("<tr><td>NightCap Drink</td>");
		writeln("<td>");
		write_label("Rollover Drink", "");
		attr("size='24'");
		vars["boreRolloverDrink"] = write_field(vars["boreRolloverDrink"], "afterbore rollover nightcap name name", "");
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

	if(write_button("save", "Save"))
	{
		writeln("<font color='green'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Settings saved at "+ now_to_string("d MMM yyyy HH:mm: Z") +"</font>");
		if(vars["bore_setup"] == "false")
			vars["bore_setup"] = "true";
		updatevars();
	}


	finish_page(); 
}  
