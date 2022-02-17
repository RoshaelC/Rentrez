# github repository: https://github.com/RoshaelC/Rentrez.git
install.packages("rentrez")
library("rentrez")

ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # creates a vector with the IDs of the sequences that will be pulled from the NCBI database

Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # entrez_fetch helps us download data from the NCBI database. "db" identifies database to search within, "id" identifies the unique IDs of the sequences that need to be pulled, and "rettype" tells R the format that the data should be in (in this case, it's FASTA)

Sequences = strsplit(Bburg, split = "(\\n)\\W") # split Bburg into an object called "Sequences" that has 3 elements with one for each sequence

Sequences <- unlist(Sequences)

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)


Sequences$Sequence <- gsub("[\r\n]", "", Sequences$Sequence) # run gsub() function of removing all newline characters only in "sequences" column of dataframe

write.csv(Sequences, "Sequences.csv", row.names = FALSE)


