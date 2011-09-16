// ShaBob's RELAY_AFTERBORE Script
// http://kolmafia.us/showthread.php?t=


notify "ShaBob";
import "htmlform.ash"; 
import "zlib.ash"
string thisver = "1.0.0";		// This is the script's version!


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
	write_box("AfterBore Settings");

// Pvp
		set_property("borePvp", write_check(get_property("borePvp").to_boolean(), 
		"borePvp", "Collect Pretty Flowers in AfterBore?"));
		writeln("<br />");
		writeln("<br />");

// Dieting
		set_property("boreDiet", write_check(get_property("boreDiet").to_boolean(), 
		"boreDiet", "Eat Special Foods for Trophy in AfterBore?"));

		writeln("<br />");

//		write_label("Food to Eat", "Special Food to Eat");
//		attr("size='24'");
//		set_property("boreDiet_Food", write_field(get_property("boreDiet_Food"), "Diet Food", ""));
		set_property( "boreDiet_Food", write_choice(get_property("boreDiet_Food"), "boreDiet_Food", "Special Food to Eat", $strings[Black Pudding, Herb Brownies, White Citadel Burger, White Citadel Fries]) );
		writeln("<br />");
		writeln("<br />");
		set_property("boreDrink", write_check(get_property("boreDrink").to_boolean(), 
	  "boreDrink", "Drink Special Drink in AfterBore?"));
		writeln("<br />");
//		write_label("Drink to Drink", "Special Drink to, er, Drink");
//		attr("size='24'");
//		set_property("boreDiet_Drink", write_field(get_property("boreDiet_Drink"), "Drink Drink", ""));		
		set_property( "boreDiet_Drink", write_choice(get_property("boreDiet_Drink"), "boreDiet_Drink", "Special Drink to Drink", $strings[White Canadian, Tomato Daquiri]) );
		writeln("<br />");
		writeln("<br />");
		set_property("boreSpleen", write_check(get_property("boreSpleen").to_boolean(), 
		"boreSpleen", "Use particular Spleen Item in AfterBore?"));
		writeln("<br />");
//		write_label("Spleen Item to Use", "Spleen Item to Use");
//		attr("size='24'");
//		set_property("boreDiet_Spleen", write_field(get_property("boreDiet_Spleen"), "Diet Spleen", ""));		
		set_property( "boreDiet_Spleen", write_choice(get_property("boreDiet_Spleen"), "boreDiet_Spleen", "Special Spleen Item", $strings[Agua de Vida, Roc Feather, Coffee Pixie Sticks, Beastly paste, Bug paste, Cloryphyll paste, Cosmic paste, Crimbo paste, Demonic paste, Ectoplasmic paste, Elemental paste, Fishy paste, Goblin paste, Gooey paste, Greasy paste, Hippy paste, Hobo paste, Indescribably Horrible paste, Mer-Kin paste, Oily paste, Orc paste, Penguin paste, Pirate paste, Slimy paste, Strange paste ]) );
		writeln("<br />");
		writeln("<br />");
// Clodhoppering
		set_property("boreClod", write_check(get_property("boreClod").to_boolean(), 
	  "boreClod", "Use Fax&Putty to Fight ClodHoppers & Collect Floaty Sand in AfterBore"));

		writeln("<br />");
		write_label("Camera CCS", "CCS to use for 4D Camera");
		attr("size='24'");
		set_property("boreClod_4dCCS", write_field(get_property("boreClod_4dCCS"), "Camera CCS", ""));
		writeln("<br />");
		write_label("Putty CCS", "CCS to use for Spooky Putty");
		attr("size='24'");
		set_property("boreClod_PuttyCCS", write_field(get_property("boreClod_PuttyCCS"), "Putty CCS", ""));


		writeln("<br />");
// Donating
		set_property("boreDonate", write_check(get_property("boreDonate").to_boolean(), 
		"boreDonate", "Donate to the Statues"));

		writeln("<br />");
// Shoretrips
		set_property("boreShore", write_check(get_property("boreShore").to_boolean(), 
		"boreShore", "Take Shore Trips"));

		set_property("boreShoretrips", write_field(get_property("boreShoretrips"),  "boreShoretrips", "Shoretrips Taken To Date", ""));
		writeln("<br />");
		set_property("boreShore_Stat", write_choice($stat[Muscle], "boreShore_Stat", "Stat to Boost with Shoretrips", $stats[]) );
		writeln("<br>");
		
// Rollover
		set_property("boreRollover", write_check(get_property("boreRollover").to_boolean(), 
	  	"boreRollover", "Allow Afterbore.ash to manage your rollover?"));
		writeln("<br />");
		write_label("Rollover Clan", "Clan to spend the night in");
		attr("size='24'");
		set_property("boreRolloverClan", write_field(get_property("boreRolloverClan"), "Rollover Clan", ""));	


	finish_box();
	write_button("", "Save changes");

    	finish_page(); 
}  
