function decode(){
	// Create an empty array "letters"
	var letters = [];
	
	// document.getElementById is not needed because I explicitly stated the id name in the following 9 lines
	var TL = topleft.value				
	var TC = topcenter.value
	var TR = topright.value
	var ML = midleft.value
	var MC = midcenter.value
	var MR = midright.value
	var BL = bottomleft.value
	var BC = bottomcenter.value
	var BR = bottomright.value
	
	// push the inputted letters into the array "letters"
	letters.push(TL.toLowerCase());
	letters.push(TC.toLowerCase());
	letters.push(TR.toLowerCase());
	letters.push(ML.toLowerCase());
	letters.push(MC.toLowerCase());
	letters.push(MR.toLowerCase());
	letters.push(BL.toLowerCase());
	letters.push(BC.toLowerCase());
	letters.push(BR.toLowerCase());

	// Sort the array "letters" to put them in alphabetical order 
	letters = letters.sort();
	
	// Loop through the words provided in the dictionary
	for(i = 0; i < words.length; i++){
		var thisWord = words[i];
		
		// Split the word into individual letters
		var thisArray = thisWord.split('')
		
		// Sort the order of "thisArray"
		thisArray.sort();

		// Loop through the individual letters in the word and compare with "letters"
		for(j = 0; j < thisArray.length; j++){
			if(letters[j] === thisArray[j]){
				if(j === 8){
					alert(thisWord)
					alert("The word matching algorithm has displayed all possible matches and will now terminate. Goodbye!")
					// Return is used to stop the script from running after we found our word
					return;
				}
			}
			else{
				break;
			};
		};
	};
	
	// If the program gets here, that means no match was found, so we will make another alert
	alert("The word matching algorithm has displayed all possible matches and will now terminate. Goodbye!")
};