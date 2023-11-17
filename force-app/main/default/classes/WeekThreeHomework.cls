public with sharing class WeekThreeHomework {


    public static void homeworkAssignmentMethod() {
        //Read through the setup below and then complete the code following the prompts.  When you're done, make sure to compile (save) your work
        //Open Execute Anonymous in the Developer Console and execute your code by typing in: WeekThreeHomework.homeworkAssignmentMethod();
        //Read through the debug statements to make sure you're done your work correctly.

        //************************************************************************************************************

        // 1. Add two more whole numbers to this list using .add()
        List<Integer> numberList = new List<Integer>{ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 };
            
        	numberList.add(55);
        	numberList.add(89);

        //Checking our work:
        System.debug('This number should be 12: ' + numberList.size());
        
        //[7]|DEBUG|This number should be 12: 12

        //************************************************************************************************************
        // 2. Create a new Lead and insert it in the database. (If you're stuck, look back at the WeekThreeClassExercises class for an example of creating a new SObject Record)
        //You can give it any values you like, but remember that last name and Company are required fields (both are simple text fields.)
        //
        
        Lead newLead = new Lead();
        newLead.LastName = 'Bayindir';
        newLead.FirstName = 'Betul';
        newLead.Company = 'RAD';
        insert newLead;       


        //Checking our work:
        System.debug('We should see One DML was executed: ' + Limits.getDMLRows());
        
        //[9]|DEBUG|We should see One DML was executed: 1

    }

	public static void forLoopsExercise() {

		//1. Let's review iterating over a list of stuff.  How about Strings?

		List < String > myStringList = new List < String >{'red', 'yellow', 'green', 'blue'};

		// using for loop syntax, loop over the list of strings, printing each one out to the debug log.
		// 
		
            for(String print : myStringList){
                
                System.debug(print);
            }



		// 2. How about some SObjects?

		// I'll do the data setup here to create a list of contacts that all have a first name:
		Contact c1 = new Contact(FirstName='Sam');
		Contact c2 = new Contact(FirstName='Diane');
		Contact c3 = new Contact(FirstName='Coach');
		List < Contact > myContacts = new List < Contact >{c1,c2,c3};

		// Your turn!  Using a for loop, print out the first name of each contact on a different line
		//hint, you will need to use dot notation!
		//
		
            for(Contact printContacts : myContacts){
                System.debug(printContacts);
            }
        
        //[11]|DEBUG|Contact:{FirstName=Sam}
        //[11]|DEBUG|Contact:{FirstName=Diane}
        //[11]|DEBUG|Contact:{FirstName=Coach}





		//Bonus question to ponder: Do these contacts actually exist in our database?
		//What would it take to get them there?
		//
		// They don't because unlike the Lead exercise, we did not insert them this time.
		
        	insert myContacts;
        
        /* received error: Line: 27, Column: 1
		System.DmlException: Insert failed. First exception on row 0; first error: REQUIRED_FIELD_MISSING, 
		Required fields are missing: [LastName]: [LastName]
		
		Since the Contact object has a required LastName field, we cannot insert these records unless
		we give them last names. */
	

	}
}