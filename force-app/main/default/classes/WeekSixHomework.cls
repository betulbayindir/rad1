public with sharing class WeekSixHomework {
    // Remember Sets & Maps??  We did a little practice with Lists in week 2, but we need to make sure we know how to use Sets & Maps as well!!
	
    public static void setsReview(){

        //Your assignment: Play with Sets!

        // 1.  Create a set of Strings and add at least 5 entries
        
        Set<String> daysOfWeek = new Set<String>{'Sunday','Monday','Tuesday','Saturday'};
        daysOfWeek.add('Wednesday');
        daysOfWeek.add('Thursday');
        daysOfWeek.add('Friday');
        

        //Use System.debug to print out the size of your set
        //
       
        System.debug(daysOfWeek.size());
        	//[11]|DEBUG|7
        	// It works!


        //Add an item to your set that already exists
        daysOfWeek.add('Friday');
        daysOfWeek.add('Wednesday');
        daysOfWeek.add('Thursday');
       
       
        //Use System.debug to print out the size again,  they should be the same!
        
        System.debug(daysOfWeek.size());
        	//[21]|DEBUG|7  all good 


        // 2.  Bonus Points!  Check out the documentation on Sets. Go to the section titled Set Methods. Pick one of the methods to try out and print the results to the debug log.  
        // Documentation: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_set.htm
        //Hint:  can you print out a boolean that indicates if the set is empty?  Can you clone it?

        System.debug(daysOfWeek.isEmpty());
        //USER_DEBUG [31]|DEBUG|false
        
        
        

    }

    public static void mapsReview () {

        //Time to get creative!  

        // 1. Create a new Map.  You can use whatever primitives/object types you like, as long as they make sense.
        // Try to add at least 5 Key/value pairs.        
        Map<String, Integer> areaCodes = new Map<String, Integer>();
        areaCodes.put('Orlando',407);
        areaCodes.put('Vero Beach', 772);
        areaCodes.put('Port St. Lucie',772);
        areaCodes.put('Palm Beach',561);
        areaCodes.put('Miami',305);


        //Now, in the debug log, print out  a list of the values.
        System.debug(areaCodes);


        //Can you print out a set of the Keys?
        Set<String> keys = areaCodes.keySet();
		System.debug(keys);
       



        // 2. Bonus!  Check out the documentation on Maps. Go to the section titled Map Methods.  Manipulate the Map using one of the methods defined in the documentation
        // Documentation: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_map.htm
        // Hint: Can you remove an entry using the key?  Can you clear out the map without deleting it?
        System.debug(areaCodes.toString());
        System.debug(areaCodes.remove('Orlando'));
        
        


    }

    public static void listsReview() {

        // 1. Create a list of Strings.  Add at least 5 entries to the list, all in one line
		List<String> team1 = new List<String>{'Betul', 'Kristi', 'Elyysa', 'Isabel', 'Ujwala'};

        // 2. Create a second list of Strings and add 5 or more entries to this list.
        List<String> team2 = new List<String>{'Angie', 'Mandie', 'Swati', 'Molly', 'Michelle'};


        //3.  Bonus! Using the documentation on standard List methods from Salesforce, add the items from your first list, to your second list with one command
        // Documentation: https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_methods_system_list.htm

            
        /* team1.addAll(team2); 
        System.debug(team2);
        System.debug(team2.size());
        
        this code did not work and I had a hard time understanding why
        turns out I used the addAll() method wrong */
        
        team2.addAll(team1); 
        System.debug(team2);
        System.debug(team2.size());
        
        // USER_DEBUG [19]|DEBUG|(Angie, Mandie, Swati, Molly, Michelle, Betul, Kristi, Elyysa, Isabel, Ujwala)
        // USER_DEBUG [20]|DEBUG|10

        //4.  Can you now loop through your combined list and print it to the debug log?  (Hint:  Check the documentation!)
        for (String s : team2){
            System.debug(s);
        }

    }
        
}