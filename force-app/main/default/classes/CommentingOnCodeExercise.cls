public with sharing class CommentingOnCodeExercise {

    /**
     * Your Assignment is to add comments describing what is being done in the methods below.
     * Call out the concepts you learned in your readings and in class.
     */

    public static void cartValues() {
        
        // Defining the integers. We are declaring them by giving the data type and name, and we
        // initialize them by giving values.
        	Integer minimumCartValue = 50;
        

        	Integer itemA = 10;
        	Integer itemB = 20;
        	Integer itemC = 45;
        
        // The value of itemA and itemB are being added to calculate cart value
        	Integer cartValue = itemA + itemB;
        
        // Here we have a Boolean variable checking if cart value of A and B equals to the minimum cart value set
        // if itemA and itemB is not equal to or greater than 50, the Boolean will return false 
			Boolean cartMinimumMet = cartValue >= minimumCartValue;

        	System.debug('Have we reached the minimum: ' + cartMinimumMet);
        
        
        // Since we haven't reached the min number required to check out,
        //we will add itemC as well. Now our container includes items A, B and C.
			cartValue = cartValue + itemC;

        // Let's check our Boolean again. Since we declared cartMinimumMet as a Boolean before,
        // we don't have to specify it one more time
        	cartMinimumMet = cartValue >= minimumCartValue;

        	System.debug('How about now? : ' + cartMinimumMet);
        // Now we can get free shipping! 

    }


}