// Welcome to the 
//  _______     __ _         _____        _          _           _     
// |__   __|   / _| |       |  __ \      | |        | |         | |    
//    | |_   _| |_| |_ ___  | |  | | __ _| |_ __ _  | |     __ _| |__  
//    | | | | |  _| __/ __| | |  | |/ _` | __/ _` | | |    / _` | '_ \ 
//    | | |_| | | | |_\__ \ | |__| | (_| | || (_| | | |___| (_| | |_) |
//    |_|\__,_|_|  \__|___/ |_____/ \__,_|\__\__,_| |______\__,_|_.__/ 
//
//             Innovate. Analyze. Visualize. | datalab.tufts.edu
//
//  ----------------------------------------
//  Date: 1-3-2018
//  By: Kyle Monahan
//  Version: Stata 15.0
//  ----------------------------------------
//
//
//  To access other online resources on statistics, see go.tufts.edu/stats

/*-------------------- Getting Started ------------------
 
The goal of this document is to address the concerns brought up by Gloria. 

These included: 

1. Example do file for checking OS and updating file paths
2. Survey weights - check to see if they are implemented correctly (awaiting do file)
3. Any further support needed?

  ---------------------------------------------------------*/
  
 // We can start up a small macro to save your files, independent of Mac or Windows. 
 // This script will automatically save into the user username on Mac or Windows. 
 // If you want other users to use the file, you can always make a folder under /Users/ with the name of your project and save it there. 
 
	if regexm(c(os),"Mac") == 1 {
	local mypath = "/Users/username/myfoldertosavedata"
	}
	else if regexm(c(os),"Windows") == 1 local mypath = "c:/Users/username/documents/myfoldertosavedata"

// Then, you can call this marco as follows: 

	use "`mypath'/data.dta"
	log using "`mypath'/mylog.dta", replace
	
// The best part about this is that your logs, data, files, and other materials will be in one central location.
// You can add "'mypath'/subfolder/data.dta" as well, to use subfolders with the same technique. 

// Documentation here: https://www.stata.com/statalist/archives/2013-05/msg01105.html
