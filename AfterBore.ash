// ShaBob & Joe's AFTERBORE Script
// http://kolmafia.us/showthread.php?t=

notify ShaBob;
import <zlib.ash>
import <eatdrink.ash>
//script "AfterBore.ash";

string thisver = "1.02";		// This is the script's version!
int AfterBore_PAGE = 7936;
 
 check_version("AfterBore", "AfterBore", thisver, AfterBore_PAGE);

// Thanks to those whose work has been absorbed to make this: 
//    jasonharper, slyz & Especially Panama Joe whose script this is.

//////////////////////////////////////////////////////////////////////
//                                                                  //
//             You MUST run the Relay Script to                     //
//             Set Configuration Options before                     //
//             Attempting to use this Script.                       //
//                                                                  //
//             Setting Options Directly is NOT                      //
//             A Good Idea (tm)                                     //
//                                                                  //
//////////////////////////////////////////////////////////////////////



//Avoid script abort due to CLI command problems
boolean safe_cli_execute( string cmd )   
	{   
	    boolean success; 
	    try   
	    {   
        	cli_execute( cmd );
	        success = true;   
	    }   
	    finally   
	    {   
	        return success;   
	    }   
	    return success;   
	}



// A Map. Just one for now :)



string [string] fax_names;
	 file_to_map( "Fax_List.txt", fax_names );


// Some Settings & Variables to make Script Cleaner
item BORE_FOOD = vars["boreDiet_Food"].to_item();
item BORE_DRINK = vars["boreDiet_Drink"].to_item();
string BORE_MOB = vars["boreMonster"].to_monster();
string BORE_FAX = fax_names[BORE_MOB];
string BORE_4DCCS = vars["boreClod_4dCCS"];
string BORE_PUTTYCCS = vars["boreClod_PuttyCCS"];
string BORE_4D = vars["boreClod_4d"];
string BORE_PUTTY = vars["boreClod_Putty"];
string BORE_ADV = vars["boreAdv"];
string BORE_ADV_SET = vars["boreAdvSet"];
string BORE_VAC = vars["boreShoreStat"];
location VAC_LOC = (BORE_VAC+" vacation").to_location();
string BORE_MAX = vars["boreRolloverPref"];
string BORE_BFARM = vars["boreBlackFarm"];
string BORE_BFARM_CCS = vars["boreBlackFarm_CSS"];
string BORE_BFARM_MOOD = vars["boreBlackFarm_Mood"];
string BORE_USERC = vars["boreUserChoice"];
string BORE_USERS = vars["boreUser_Script"];
string BORE_ROLL = vars["boreRollover"];
string BORE_ROLL_SET = vars["boreRolloverNightCap"];
item BORE_ROLL_DRINK = vars["boreRolloverDrink"].to_item();
boolean COMPLETED_SETUP = vars["bore_setup"].to_boolean();

setvar("bore_setup", false);

// Donation Script from slyz

int total_donation( string hero )
	{
		return get_property( "heroDonation" + hero ).to_int();
	}

string to_command( string hero )
	{
	    switch( hero )
	    {
		    case "Boris": return "boris";
		    case "Jarlsberg": return "jarl";
		    case "SneakyPete": return "pete";
	    }
	    return "";
	}

item to_key( string hero )
	{
	    switch( hero )
	    {
		    case "Boris": return $item[ Boris's key ];
		    case "Jarlsberg": return $item[ Jarlsberg's key ];
		    case "SneakyPete": return $item[ Sneaky Pete's key ];
	    }
	    return $item[ Xlyinia's notebook ];
	}	
// Panama Joe's bestfam() function

void best_fam()
	{
		string famkeep = vars["is_100_run"];
		if ( famkeep == "none" )
		{
			int temp;
			familiar bestfam;
			foreach f in $familiars[] if (have_familiar(f) && familiar_weight(f) > temp) 
			{ 
				temp = familiar_weight(f);
				bestfam = f;
			} 
			use_familiar ( bestfam );
		}
	}

// Options are ALL selected in the relay script. Do not Edit this File!

// Collects Flowers
void pvp()
	{
		print_html("<b>AfterBore:</b> Commencing Flower Picking For Your Convenience");
		maximize ("mox", false );
		best_fam();
		cli_execute ("flowers");

	}

void get_ode()
{
   maximize("Additional Song -tie", false); 

   while ((have_effect($effect[ode to booze]) <= inebriety_limit() ) && have_skill($skill[ode to booze])) use_skill(1 , $skill[ode to booze]);
      
   if ( ! have_skill ( $skill [ode to booze] ))
   {
      print("purchasing Ode to Booze from a buffbot...", "blue");
      if ( have_effect ( $effect [polka of plenty]) > 0 )
      cli_execute ("shrug polka" );
      cli_execute("csend 1 meat to Testudinata");
      int iterations = 0;
      while(have_effect($effect[Ode to Booze]) < 1 && iterations < 30) {
         wait(30);
         refresh_status();
         iterations = iterations + 1;
      }
   if(have_effect($effect[Ode to Booze]) < 1)
   {
      print("failed to get Ode to Booze", "red");
      }

   }
}

// Drinks the User Selected Drink - Uses Joe's Ode routines
void drink()
{
	if (get_property( "_bore_dieted_today") != "TRUE" )	{
		if ( my_inebriety() < inebriety_limit() ) {
   print_html("<b>AfterBore:</b> About to Start in on the Booze");
   if (BORE_DRINK == to_item("around the world")) {
      get_ode();
      int amount = floor((inebriety_limit() - my_inebriety()) / 4);
      drink(amount, BORE_DRINK);
   }
   else {
      get_ode();
      int amount = floor((inebriety_limit() - my_inebriety()) / 3);
      drink(amount, BORE_DRINK);
      }
		}	
	}
	else print_html("<b>AfterBore:</b> We appear to have been boozing already!");
}

// Eats the User Selected Food
void diet() 
{   
	if (get_property( "_bore_dieted_today") != "TRUE" )	{ 
		print_html("<b>AfterBore:</b> Eating Time!");
		int full_per_unit = 2;
		if ( BORE_FOOD == $item[black pudding] )
			full_per_unit = 3;
		while ( (my_fullness() + full_per_unit ) <= fullness_limit() )
		{
			if ( have_effect ( $effect[got milk]) < 3)//use milk only as required
			{
				use (1, $item[milk of magnesium]);
			}
    eat (1, BORE_FOOD);
		}
	}
	else print_html("<b>AfterBore:</b> We appear to have been eating already!");
}

// Fights Monster as selected by the user. 
// The Script maximizes itemdrops, and can become somewhat expensive :)
void clod()
	{
		print_html("<b>AfterBore:</b> Fighting your Selected Monster.");
		if ( get_property ( "_photocopyUsed" ) == true ) return;
//	Checker to see that you have your putty and cameras
		if (BORE_4D == true)
		{
			int have_4d = item_amount($item[4d Camera]);
			if (have_4d < 1)  abort("You have no 4D Cameras!");
		}
		if (BORE_PUTTY == true)
		{
			int have_putty = item_amount($item[spooky putty sheet]);
			if (have_putty < 1) abort("You have no Spooky Putty Sheet!");   
		}   
//	Checker to see faxbot is active
		if( !is_online( "faxbot" ) ) abort( "Faxbot is dead!" );
		while ( get_property( "photocopyMonster" ) != BORE_MOB )
		{
			if (item_amount ( $item[photocopied monster] ) != 0)
			{
				cli_execute ("fax put");
			}
			chat_private ("faxbot", BORE_FAX );
			wait (60);
			cli_execute ("fax get");
		}
		//buffing and combat routine
		maximize ("items", false );
		foreach potion in $items[cyclops eyedrops, polka pop, blue-frosted astral cupcake, knob goblin eyedrops, buffing spray]
		{
			use (1, potion);
		}

		if (BORE_4D == false && BORE_PUTTY == false)
			use ( 1, $item[photocopied monster]);

		if (BORE_4D == true && BORE_PUTTY == false)
		{
			cli_execute ( "ccs " + BORE_4DCCS ); //ccs to use 4-d camera
			use ( 1, $item[photocopied monster]);
			use ( 1, $item[Shaking 4-d camera]);
		}
		if (BORE_4D == true && BORE_PUTTY == true)
		{
			cli_execute ( "ccs " + BORE_4DCCS ); //ccs to use 4-d camera
			use ( 1, $item[photocopied monster]);
			cli_execute ( "ccs " + BORE_PUTTYCCS );//ccs to use putty
			use ( 1, $item[Shaking 4-d camera]);
			for j from 1 to 5
			{
				use ( 1, $item[spooky putty monster]);
			}
		}
		if (BORE_4D == false && BORE_PUTTY == true)
		{
			cli_execute ( "ccs " + BORE_PUTTYCCS ); //ccs to use putty
			use ( 1, $item[photocopied monster]);
			for j from 1 to 5
			{
				use ( 1, $item[spooky putty monster]);
			}
		}
		
	}

//Sets up the ShoreTrip Counter
int trips()
	{
	int done_trips = 0;
	string page = visit_url("shore.php");
	matcher shore_trips = create_matcher ( "You have taken (\\d+)" , page );
	if(shore_trips.find())
	 {
	  done_trips = (shore_trips.group(1)).to_int();
	 }
	return (done_trips);
	}


// Takes Shoretrips towards the Boat Trophies.
void shoretrip()
	{
		print_html("<b>AfterBore:</b> About to have some Vacations");
		print(BORE_VAC + " Vacations!");
		maximize ("mp regen max", false );//let's get some MP out of this

		for foo from 1 to (my_adventures() / 3)
			{
				print("Taking Trip No."+foo);
				adventure ( 1 , VAC_LOC );
				set_property("boreShoretrips", to_int(get_property("boreShoretrips")) + 1);
			}

	}

// Black Forest Farming
void bfarm()
{
		print_html("<b>AfterBore:</b> Farming in the Black Forest - So You Don't Have To!");
		string OLD_MOOD = get_property("currentMood");
		cli_execute ( "mood " + BORE_BFARM_MOOD);		
		maximize ("items", false );
		cli_execute ( "ccs " + BORE_BFARM_CCS ); //ccs to use 4-d camera
		// leaves 5 adventures for any crafting which may need to be done at the end of the day
		adventure ( (my_adventures()-5) , $location[black forest] );
		cli_execute ( "mood " + OLD_MOOD);				

}

void userscript()
{
		cli_execute ( BORE_USERS );
}

// Donates
void donate()
	{
		print_html("<b>AfterBore:</b> Donating to Heroes - So You Don't Have To!");
		
		    int donation;
		    int max_donation = my_level() * 10000;
		    foreach hero in $strings[ Boris, Jarlsberg, SneakyPete ]
		    {
		        if ( total_donation( hero ) >= 1000000 ) continue;
		        if ( max_donation <= 0 ) return;
        		if ( my_meat() == 0 )
		        {
		            print( "You need meat to make donations!" );
		            return;
		        }
		        if ( item_amount( hero.to_key() ) == 0 )
		        {
		            print( "You need a " + hero.to_key() + " to donate to " + hero, "red" );
		            continue;
		        }
		        donation = min( my_meat(), min( max_donation , 1000000 - total_donation( hero ) ) ); 
		        if ( safe_cli_execute( "donate " + hero.to_command() + " " + donation ) )
		        {
		            max_donation -= donation;
		        }
		        // the donation failed, you have probably donated the limit for the day
		}
	}

//Prints a summary

void summary()
	{
		print("");
		print("");
		print_html("<font color='red'><b>AfterBore:</b> Summary</font>");
		print ("Total black puddings fought " + get_property( "blackPuddingsDefeated" ), "green");
		print ("Total shore trips " + (trips()), "green");
		print ("Total 4-D cameras used " + get_property ( "camerasUsed" ), "green");
		print ("Donated to Boris " + get_property( "heroDonationBoris" ), "green");
		print ("Donated to Jarlsberg " + get_property( "heroDonationJarlsberg" ), "green");
		print ("Donated to Sneaky Pete " + get_property( "heroDonationSneakyPete" ), "green");
	}

## new ##
// checks for waiting trophies at the hut
void check_trophies()
{
	string trophypage = visit_url("trophy.php");
	matcher trophymatcher = create_matcher("entitled to the .([A-Z\\sa-z]*). Trophy" ,trophypage);
	while (find(trophymatcher)){
		print("You are entitled to the " + group(trophymatcher,1) + " trophy","red");
	}
}

//Does Rollovers 
void rollover()
	{
		print_html("<b>AfterBore:</b> Setting up your rollover");

		if (BORE_ROLL_SET == "EatDrink")
		{
			print("AfterBore Using EatDrink to OverDrink!");
			eatdrink ( fullness_limit(), inebriety_limit(), spleen_limit(), TRUE );
		}			
		if (BORE_ROLL_SET == "TrophyBooze")
		{
			print_html("AfterBore Drinking <b>" + BORE_DRINK +"</b> to OverDrink");
			get_ode();
			drink (1, BORE_DRINK);		
		}
		if (BORE_ROLL_SET == "UserSelect")
		{
			print_html("AfterBore Drinking <b>" + BORE_ROLL_DRINK +"</b> to OverDrink" );
			get_ode();
			drink (1, BORE_ROLL_DRINK );		
		}


		maximize (BORE_MAX, false );
		if ( vars["boreRolloverClan"] != "" )
		chat_clan("/whitelist " + vars["boreRolloverClan"]);
	}


//Ties it all together
void main()
{
	if(!COMPLETED_SETUP)
		{
		print("Please first configure the options with the relay script", "green");
		print("Remember to click the Save button when you're done", "green");
		}
	else
	{
	maximize ("mp regen max", false );
	if ( my_inebriety() <= inebriety_limit() ) 	
	{
		if (vars["borePvp"]== true) pvp();
		if (vars["boreDrink"]== true) drink();
		if (vars["boreDiet"]== true) diet();
		if (get_property( "_bore_dieted_today") != "TRUE" )
		{
		eatdrink ( fullness_limit(), inebriety_limit(), spleen_limit(), FALSE );//use up any remaining diet room
		}
		set_property ( "_bore_dieted_today", "TRUE" );	
		if (vars["boreClod"]== true) clod();
		if (vars["boreAdv"]== true) 
		{
			if (BORE_ADV_SET == "Take Vacations") shoretrip();
			if (BORE_ADV_SET == "Black Item Farming") bfarm();
			if (BORE_ADV_SET == "User Script") userscript();
		}
		if (vars["boreDonate"]== true) donate();
		set_property ( "_bore_ran_today", "TRUE" );
	}

	//test for adventures lost to rollover and shout if case

	if ( my_adventures() < 130 && BORE_ROLL == true && get_property("_bore_ran_today") == true) 
			rollover();

	else{

		if (BORE_ROLL == false) print_html("<b>AfterBore is finished. Don't forget your rollover!</b>" );
		else
		{
		print_html ("<b>Something is amiss. You appear ready for rollover, but not to have adventured today.</b>");
		print_html ("<b>Perhaps there is something you would like to do with your "+ my_adventures() +" adventures?</b>");
		}
	}
	summary();
## new ##
	check_trophies();
	}
}

