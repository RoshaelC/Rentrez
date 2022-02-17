# github repository: https://github.com/RoshaelC/Rentrez.git

library("rentrez")
CoV2 <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")

CoV2 <- gsub("[\r\n]", "", CoV2)


CoV2 <- gsub(">NC_045512.2 Severe acute respiratory syndrome coronavirus 2 isolate Wuhan-Hu-1, complete genome", "", CoV2)

# isolate S protein from downloaded genome

gsub("[^ATGTTTGTTTTTCTTGTTTA.*GTCAAATTACATTACACATAA$.*]", "X", CoV2)

CoV2_S <- substr(CoV2, 21563, 25384) # i couldn't figure out how to use reg ex so I used this code instead to find the S protein sequence
CoV2_S

# I think that the gene is highly conserved since all of the queries that come up in the NCBI BLAST search all have a query coverage of 100% and a percent identity of 100% as well. Therefore, this spike protein seems to stay unchanged in all available sequences of the CoVID-19 genome.