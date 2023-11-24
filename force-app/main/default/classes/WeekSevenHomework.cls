public with sharing class WeekSevenHomework {

    //Assignment:  The following method is supposed to create the number of accounts specified in the argument that it takes.
    //Each Account should be named 'Sample Account #sampleNumber'  where sample number is the count.  So if you created 2 Accounts
    //one would be called 'Sample Account 1' and the other 'Sample Account 2'

    //Also, when we're done inserting them, we will create a case for each one with a Status of 'New', Origin of 'New Account' and the
    //desription and subject of your choice.

    //This isn't working quite right.  Can you use your debugging skills to fix it?  I had to comment it out since it won't compile
    //Look out for consistency and formatting too!  (even if they don't break the code)
    //Add comments to describe what the code is doing.
    //After you get it to compile, run it in execute anonymous and check that it's really working!  Look up your new accounts in your org!

    public static void createSampleAccounts(Integer numberOfAccounts) {
	// Fixing variable type from Decimal to Integer

           List<Account> acctList = new List<Account>();
                
        for (Integer i = 1; i <= numberOfAccounts; i++) {
	// Changed Integer i from 0 to 1 because we want to start naming Accounts starting from 1.
                    Account a = new Account();
                    a.Name = 'Sample Account' + i;
	// Changed a.Name formatting to fit given naming convention
					acctList.add(a);
            
	//Adding the Account created into our list acctList
	System.debug(a.Name);
                }
        
                insert acctList;
        
                List<Case> casesToInsert = new List<Case>();
        
                for (Account a: acctList) {
	// Fixed a typo in List name. accctList -> acctList
                    Case c = new Case();
                    c.Status = 'New';
	// Changed identifier from double quotes to single quotes 
                    c.Origin = 'New Account';
	// Added missing ; in Line 31
                    c.AccountId = a.Id;
	// This one was hard: Illegal assignment from Account to Id error
                    c.Subject = 'New Case';
	// Added missing assignment operator.
                    c.Description = 'Follow Up';
	//Fixed typo in variable name. Descritpion -> Description
	//Changed comparison operator (==) to assignment operator (=)
                    casesToInsert.add(c);
                    
	/* WRONG: Added a DML operation to insert new cases.
	
					insert casesToInsert;
	I'd accidentally added the DML inside the loop. Fixing it in line 47 */
                }
					insert casesToInsert;
	// I proofread my first code! Unfortunately, even though the code does not have 'problems', 
	// the DML operation does not work. I think the issue might be with my first loop,
	// or I might have messed up the increment.


}
    
}