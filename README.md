## Feenstra 2016, chapter 2: The Heckscher-Ohlin model.

My aim here is to rewrite the files for the empirical exercises files from Stata into R, which will then allow me to complete them.

**Note that this is a work in progress, and will be updated as I complete the various components**

The original files can be found [here](https://www.robertcfeenstra.com/graduate-text.html).

Downloading the .zip for Chapter 2 will give you a directory containing the following:
* compute_pi.do
* Documentation_Ch2.doc
* Empirical_Exercise_Ch2.doc
* hov_pub.csv
* hov_pub.do
* sign_rank_1.do
* sign_rank_2.do

For my replication work I have copied the .csv with the underlying data across. However, I have not copied the .doc files, as mixing git and binary files like .doc is not recommended.

"Empirical_Exercise_Ch2.doc" outlines the empirical exercises from the chapter and is not reproduced here. For convenience, documentation of the data is copied from "Documentation_Ch2.doc", below:

"The file "hov_pub.csv" is an Excel (comma delimited) file containing the data for Trefler (1993, 1995). There are eight variables without labelling. The first column is the character variable COUNTRY, second is the character variable FACTOR. The rest are FACTOR CONTENT OF TRADE (AT), ENDOWMENT (V), GDP (Y) and TRADE BALANCE (B), GDP PER-CAPITA (YPD) and POPULATION (POP). All data pertain to 1983.

There are 33 countries in the sample. The variable FACTOR CONTENT OF TRADE is equal to A*T in Trefler's paper, which is calculated using U.S. technology matrix. ENDOWMENT includes 9 factors: Capital, Labour endowment in professional/technical, Labour endowment in clerical, Labour endowment in sales, Labour endowment in services, Labour endowment in agriculture, Labour endowment in production, Cropland, and Pasture. Capital endowments were converted into dollars using PPP-adjusted exchange rates. Cropland was measured in hectares. GDP and TRADE BALANCE were converted into dollars."